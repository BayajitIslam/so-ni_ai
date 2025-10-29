// Message Model
class Message {
  final String text;
  final bool isUser;
  final String? time;

  Message({required this.text, required this.isUser, this.time});
}
