import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'display_picture_screen.dart';

class FoodScanCameraScreen extends StatefulWidget {
  const FoodScanCameraScreen({super.key});

  @override
  State<FoodScanCameraScreen> createState() => _FoodScanCameraScreenState();
}

class _FoodScanCameraScreenState extends State<FoodScanCameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  bool _isTorchOn = false;

  @override
  void initState() {
    super.initState();
    _requestPermissionsAndInitCamera();
  }

  /// Request all permissions
  Future<void> _requestPermissionsAndInitCamera() async {
    final statuses = await [
      Permission.camera,
      Permission.photos,
      Permission.microphone,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    if (!allGranted) {
      // Show dialog for permanently denied permissions
      final permanentlyDenied = statuses.values.any(
        (s) => s.isPermanentlyDenied,
      );
      if (permanentlyDenied) {
        _showPermissionDialog();
      }
      debugPrint("Permissions denied");
      return;
    }

    // If granted, initialize camera
    await _initCamera();
  }

  /// Show dialog to open settings
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Permission Required"),
        content: const Text(
          "Camera, Photos, and Microphone access are required. Please enable them in Settings.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  /// Initialize camera
  Future<void> _initCamera() async {
    try {
      if (_controller != null) {
        await _controller!.dispose();
        _controller = null;
      }

      final cameras = await availableCameras();
      final backCamera = cameras.first;

      _controller = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      _initializeControllerFuture = _controller!.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint("Camera init error: $e");
    }
  }

  @override
  void dispose() {
    if (_isTorchOn) _controller?.setFlashMode(FlashMode.off);
    _controller?.dispose();
    super.dispose();
  }

  /// Capture image from camera
  Future<void> _captureImage() async {
    try {
      if (_controller == null) return;
      await _initializeControllerFuture;

      if (_isTorchOn) {
        await _controller!.setFlashMode(FlashMode.off);
        _isTorchOn = false;
        if (mounted) setState(() {});
      }

      final picture = await _controller!.takePicture();

      final bytes = await File(picture.path).readAsBytes();
      final original = img.decodeImage(bytes);
      if (original == null) return;

      final renderBox = context.findRenderObject() as RenderBox;
      final screenW = renderBox.size.width;
      final screenH = renderBox.size.height;

      final scanRect = Rect.fromCenter(
        center: Offset(screenW / 2, screenH / 2),
        width: screenW * 0.7,
        height: screenH * 0.35,
      );

      final scaleX = original.width / screenW;
      final scaleY = original.height / screenH;

      final cropped = img.copyCrop(
        original,
        x: (scanRect.left * scaleX).round(),
        y: (scanRect.top * scaleY).round(),
        width: (scanRect.width * scaleX).round(),
        height: (scanRect.height * scaleY).round(),
      );

      final tempDir = await getTemporaryDirectory();
      final croppedPath =
          '${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(croppedPath).writeAsBytes(img.encodeJpg(cropped));

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DisplayPictureScreen(imagePath: croppedPath),
        ),
      );
    } catch (e) {
      debugPrint("Error capturing image: $e");
    }
  }

  /// Pick image from gallery
  Future<void> _pickFromGallery() async {
    await _requestPermissionsAndInitCamera();
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1920,
      );

      if (pickedFile != null && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DisplayPictureScreen(imagePath: pickedFile.path),
          ),
        );
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  /// Toggle flash
  void _toggleFlash() async {
    if (_controller == null) return;
    try {
      _isTorchOn = !_isTorchOn;
      await _controller!.setFlashMode(
        _isTorchOn ? FlashMode.torch : FlashMode.off,
      );
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint("Error toggling flash: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Scaffold(
        body: Center(child: Text("No camera available for this device")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(child: CameraPreview(_controller!)),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final scanRect = Rect.fromCenter(
                        center: Offset(
                          constraints.maxWidth / 2,
                          constraints.maxHeight / 2,
                        ),
                        width: constraints.maxWidth * 0.7,
                        height: constraints.maxHeight * 0.35,
                      );

                      return Stack(
                        children: [
                          ClipPath(
                            clipper: OutsideClipper(scanRect),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(color: Colors.transparent),
                            ),
                          ),
                          CustomPaint(
                            size: Size(
                              constraints.maxWidth,
                              constraints.maxHeight,
                            ),
                            painter: BlurOutsidePainter(scanRect),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      // const Text(
                      //   "Food Ingredient",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      // const SizedBox(width: 28),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _captureImage,
                            icon: const Icon(Icons.restaurant_menu),
                            label: const Text("Scan Food"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: _pickFromGallery,
                            icon: const Icon(Icons.photo_library_outlined),
                            label: const Text("Library"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: _toggleFlash,
                            icon: Icon(
                              _isTorchOn ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 24),
                          GestureDetector(
                            onTap: _captureImage,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                              ),
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("No camera available for this device"),
            );
          }
        },
      ),
    );
  }
}

class BlurOutsidePainter extends CustomPainter {
  final Rect scanRect;
  BlurOutsidePainter(this.scanRect);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(scanRect, const Radius.circular(20)))
      ..fillType = PathFillType.evenOdd;

    final overlayPaint = Paint()..color = Colors.black.withOpacity(0.4);
    canvas.drawPath(path, overlayPaint);

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRRect(
      RRect.fromRectAndRadius(scanRect, const Radius.circular(20)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OutsideClipper extends CustomClipper<Path> {
  final Rect hole;
  OutsideClipper(this.hole);

  @override
  Path getClip(Size size) => Path()
    ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
    ..addRRect(RRect.fromRectAndRadius(hole, const Radius.circular(20)))
    ..fillType = PathFillType.evenOdd;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
