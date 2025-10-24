import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppString {
  //===================== Genaral =====================
  static const String soni = "SO:NI";
  static const String continuee = "Continue";

  //======================= SingUp & SignIn Screen
  static const String enterfullName = "Enter Full Name";
  static const String enterEmailAddress = "Enter Email Address";
  static const String enterMobileNumber = "Enter Mobile Number";
  static const String enterPassword = "Enter Password";
  static const String reEnterPassword = "Re Enter Password";
  static const String signUp = "Sign Up";
  static const String singIn = "Sign In";
  static const String forgotPassword = "Forgot Password?";

  //==================================== Reset Password Otp =================
  static const String pleaseEnterYourEmail =
      "Please enter your email to reset the password";
  static const String resetPassword = "Reset Password";
  static const String veryfyCode = "Verify Code";
  static const String checkYourEmail = "Check your email";
  static const String weSentCode = "We sent a code to";
  static const String haventgotEmail = "Haven’t got the email yet?";
  static const String resendEmail = "Resend email";
  static const String passwordReset = "Password reset";
  static const String updatePassword = "Update Password";
  static const String accouintCreateSuccesfull = "Account Created Successfully";
  static const String yourAccounthasBeenCreated =
      "Your account has been created. You can now log in and start exploring your account. ";
  static const String enter6digitCose =
      "Enter 6 digit code that mentioned in the email";
  static const String enterNewPassword = "Enter your new password";
  static const String reEnterNewPassword = "Re- Enter new password";
  static const String passwordUpdateSuccessfully =
      "Password Update Successfully";

  //================================ Onboarding =================================
  static const String smartFoodScanner = "Smart Food Scanner";
  static const String instantlyAnalize =
      "Instantly analyze your meals with AI to track calories and nutrients.";
  static const String aiPowerdModelRecommend = "AI-Powered Meal Recommendation";
  static const String getPersonalized =
      "Get personalized meal plans tailored to your health and fitness goals.";
  static const String smartMealDiary = "Smart Meal Diary";
  static const String logYourDailyMeals =
      "Log your daily meals and track your wellness journey effortlessly.";
  static const String personalizedWorkoutPlan = "Personalized Workout Plan";
  static const String aiTailored =
      "AI-tailored workouts designed to match your goals and fitness level.";
  static const String howOldAreYou = "How old are you?";
  static const String whatsYourFullName = "What’s Your Full Name?";
  static const String whatsYourGender = "What’s Your Gender?";
  static const String whatsYourHeight = "What’s Your Height?";

  static const String whatsYourWeight = "What’s Your Weight?";
  static const String tellUsAboutYourLifestyle =
      "Tell Us About Your Lifestyle!";
  static const String whatsYourPrimaryHealthGoal =
      "What’s your primary health goal?";
  static const String doyouFollowSpecificDiet =
      "Do you follow a specific diet?";
  static const String doyouHaveAnyDietryRestrication =
      "Do You Have Any Dietary Restrictions?";
  static const String selectALanguage = "Select a Language";
  static const String yourName = "Your name";

  static const String startYour3dayFreeTrailToContinue =
      "Start your 3-day FREE trial to continue.";
  static const String today = "Today";
  static const String day2 = "Day 2";
  static const String after3Day = "After day 3";
  static const String getFullAccessAndSeeYourMindset =
      "Get full access and see your mindset\nstartfo change.";
  static const String getAreminderThatYourTrialEndsIn =
      "Get a reminder that your trial ends in 24\nhours";
  static const String yourFreeTrailEndsAndYouWillbeCharged =
      "Your free trial ends and you'll be\ncharged, cancel anytime before";
  static const String monthly = "Monthly";
  static const String mo199 = "1.99 €/mo";
  static const String yearly = "Yearly";
  static const String mo099 = "0.99 €/mo";
  static const String dayfree3 = "3 days Free ";
  static const String noPaymentDueNow = "No Payment Due Now";
  static const String start3dayFreeTrial = "Start 3-day free trial";
  static const String daysFreeThen = "3days free then 11,88€ a year";
  static const String great = "Great!";
  static const String yourProfileIsReady = "Your profile is ready.  ";
  static const String letsStartBuildingHealth =
      "Let’s start building healthier habits together!";
  static const String gotoHomePages = "Go to Homepage";

  //================================ Home Screen =================================
  static const String yourDailyCalories = "Your Daily calories";
  static const String kcalTotal = "Kcal Total";
  static const String carbs = "Carbs";
  static const String protein = "Protein";
  static const String fat = "Fat";
  static const String yourWeeklyCalories = "Your Weekly calories";
  static const String mealPlanCalendar = "Meal Plan Calendar";
  static const String customizeYourThreeDays = "Customize your three days";
  static const String yourWaterGoal = "Daily Water Goal";
  static const String latNight = "Last Night";
  static const String weeklyAvg = "Weekly Avg";
  static const String workWoutProgress = "Workout Progress";
  static const String yourDailyWorkoutProgress = "your Daily Workout Progress";
  static const String targetKcal = "Target Kcal";
  static const String exercise = "Exercise";
  static const String video = "Video";
  static const String duration = "Duration";
}

// Concrete Translations class that implements `Translations`
class TranslationsImplementation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // English (US)
    'en': {
      'soni': 'SO:NI',
      'continuee': 'Continue',
      'enterfullName': 'Enter Full Name',
      'enterEmailAddress': 'Enter Email Address',
      'enterMobileNumber': 'Enter Mobile Number',
      'enterPassword': 'Enter Password',
      'reEnterPassword': 'Re Enter Password',
      'signUp': 'Sign Up',
      'singIn': 'Sign In',
      'forgotPassword': 'Forgot Password?',
      'pleaseEnterYourEmail': 'Please enter your email to reset the password',
      'resetPassword': 'Reset Password',
      'veryfyCode': 'Verify Code',
      'checkYourEmail': 'Check your email',
      'weSentCode': 'We sent a code to',
      'haventgotEmail': 'Haven’t got the email yet?',
      'resendEmail': 'Resend email',
      'passwordReset': 'Password reset',
      'updatePassword': 'Update Password',
      'smartFoodScanner': 'Smart Food Scanner',
      'instantlyAnalize':
          'Instantly analyze your meals with AI to track calories and nutrients.',
      'aiPowerdModelRecommend': 'AI-Powered Meal Recommendation',
      'getPersonalized':
          'Get personalized meal plans tailored to your health and fitness goals.',
      'smartMealDiary': 'Smart Meal Diary',
      'logYourDailyMeals':
          'Log your daily meals and track your wellness journey effortlessly.',
      'personalizedWorkoutPlan': 'Personalized Workout Plan',
      'aiTailored':
          'AI-tailored workouts designed to match your goals and fitness level.',
      'howOldAreYou': 'How old are you?',
      'whatsYourFullName': 'What’s Your Full Name?',
      'whatsYourGender': 'What’s Your Gender?',
      'whatsYourHeight': 'What’s Your Height?',
      'whatsYourWeight': 'What’s Your Weight?',
      'tellUsAboutYourLifestyle': 'Tell Us About Your Lifestyle!',
      'whatsYourPrimaryHealthGoal': 'What’s your primary health goal?',
      'doyouFollowSpecificDiet': 'Do you follow a specific diet?',
      'doyouHaveAnyDietryRestrication': 'Do You Have Any Dietary Restrictions?',
      'selectALanguage': 'Select a Language',
      'yourName': 'Your name',
      'startYour3dayFreeTrailToContinue':
          'Start your 3-day FREE trial to continue.',
      'today': 'Today',
      'day2': 'Day 2',
      'after3Day': 'After day 3',
      'getFullAccessAndSeeYourMindset':
          'Get full access and see your mindset startfo change.',
      'getAreminderThatYourTrialEndsIn':
          'Get a reminder that your trial ends in 24 hours',
      'yourFreeTrailEndsAndYouWillbeCharged':
          'Your free trial ends and you\'ll be charged, cancel anytime before',
      'monthly': 'Monthly',
      'mo199': '1.99 €/mo',
      'yearly': 'Yearly',
      'mo099': '0.99 €/mo',
      'dayfree3': '3 days Free ',
      'noPaymentDueNow': 'No Payment Due Now',
      'start3dayFreeTrial': 'Start 3-day free trial',
      'daysFreeThen': '3days free then 11,88€ a year',
      'great': 'Great!',
      'yourProfileIsReady': 'Your profile is ready.  ',
      'letsStartBuildingHealth':
          'Let’s start building healthier habits together!',
      'gotoHomePages': 'Go to Homepage',
      'yourDailyCalories': 'Your Daily calories',
      'kcalTotal': 'Kcal Total',
      'carbs': 'Carbs',
      'protein': 'Protein',
      'fat': 'Fat',
      'yourWeeklyCalories': 'Your Weekly calories',
      'mealPlanCalendar': 'Meal Plan Calendar',
      'customizeYourThreeDays': 'Customize your three days',
      'yourWaterGoal': 'Daily Water Goal',
      'latNight': 'Last Night',
      'weeklyAvg': 'Weekly Avg',
      'workWoutProgress': 'Workout Progress',
      'yourDailyWorkoutProgress': 'your Daily Workout Progress',
      'targetKcal': 'Target Kcal',
      'exercise': 'Exercise',
      'video': 'Video',
      'duration': 'Duration',
    },

    // Spanish (ES)
    'es': {
      'soni': 'SO:NI',
      'continuee': 'Continuar',
      'enterfullName': 'Introduce el nombre completo',
      'enterEmailAddress': 'Introduce la dirección de correo electrónico',
      'enterMobileNumber': 'Introduce el número de móvil',
      'enterPassword': 'Introduce la contraseña',
      'reEnterPassword': 'Vuelve a introducir la contraseña',
      'signUp': 'Registrarse',
      'singIn': 'Iniciar sesión',
      'forgotPassword': '¿Olvidaste tu contraseña?',
      'pleaseEnterYourEmail':
          'Por favor, ingresa tu correo electrónico para restablecer la contraseña',
      'resetPassword': 'Restablecer la contraseña',
      'veryfyCode': 'Verificar código',
      'checkYourEmail': 'Revisa tu correo electrónico',
      'weSentCode': 'Enviamos un código a',
      'haventgotEmail': '¿No has recibido el correo?',
      'resendEmail': 'Reenviar correo',
      'passwordReset': 'Contraseña restablecida',
      'updatePassword': 'Actualizar contraseña',
      'smartFoodScanner': 'Escáner de alimentos inteligente',
      'instantlyAnalize':
          'Analiza tus comidas al instante con IA para rastrear calorías y nutrientes.',
      'aiPowerdModelRecommend': 'Recomendación de comidas basada en IA',
      'getPersonalized':
          'Obtén planes de comidas personalizados adaptados a tus objetivos de salud y bienestar.',
      'smartMealDiary': 'Diario de comidas inteligente',
      'logYourDailyMeals':
          'Registra tus comidas diarias y sigue tu progreso de bienestar de forma sencilla.',
      'personalizedWorkoutPlan': 'Plan de entrenamiento personalizado',
      'aiTailored':
          'Entrenamientos diseñados por IA para adaptarse a tus metas y nivel de fitness.',
      'howOldAreYou': '¿Cuántos años tienes?',
      'whatsYourFullName': '¿Cuál es tu nombre completo?',
      'whatsYourGender': '¿Cuál es tu género?',
      'whatsYourHeight': '¿Cuál es tu altura?',
      'whatsYourWeight': '¿Cuál es tu peso?',
      'tellUsAboutYourLifestyle': '¡Cuéntanos sobre tu estilo de vida!',
      'whatsYourPrimaryHealthGoal': '¿Cuál es tu objetivo principal de salud?',
      'doyouFollowSpecificDiet': '¿Sigues una dieta específica?',
      'doyouHaveAnyDietryRestrication': '¿Tienes alguna restricción dietética?',
      'selectALanguage': 'Seleccionar un idioma',
      'yourName': 'Tu nombre',
      'startYour3dayFreeTrailToContinue':
          'Comienza tu prueba GRATUITA de 3 días para continuar.',
      'today': 'Hoy',
      'day2': 'Día 2',
      'after3Day': 'Después del día 3',
      'getFullAccessAndSeeYourMindset':
          'Obtén acceso completo y verás cómo cambia tu mentalidad.',
      'getAreminderThatYourTrialEndsIn':
          'Recibe un recordatorio de que tu prueba termina en 24 horas.',
      'yourFreeTrailEndsAndYouWillbeCharged':
          'Tu prueba gratuita termina y se te cobrará. Cáncelalo en cualquier momento antes.',
      'monthly': 'Mensual',
      'mo199': '1.99 €/mes',
      'yearly': 'Anual',
      'mo099': '0.99 €/mes',
      'dayfree3': '3 días gratis',
      'noPaymentDueNow': 'No hay pagos pendientes',
      'start3dayFreeTrial': 'Inicia prueba gratuita de 3 días',
      'daysFreeThen': '3 días gratis luego 11,88 € al año',
      'great': '¡Genial!',
      'yourProfileIsReady': 'Tu perfil está listo.',
      'letsStartBuildingHealth':
          '¡Comencemos a construir hábitos más saludables juntos!',
      'gotoHomePages': 'Ir a la página principal',
      'yourDailyCalories': 'Tus calorías diarias',
      'kcalTotal': 'Total de Kcal',
      'carbs': 'Carbohidratos',
      'protein': 'Proteína',
      'fat': 'Grasas',
      'yourWeeklyCalories': 'Tus calorías semanales',
      'mealPlanCalendar': 'Calendario del plan de comidas',
      'customizeYourThreeDays': 'Personaliza tus tres días',
      'yourWaterGoal': 'Objetivo de agua diario',
      'latNight': 'Anoche',
      'weeklyAvg': 'Promedio semanal',
      'workWoutProgress': 'Progreso del entrenamiento',
      'yourDailyWorkoutProgress': 'Tu progreso diario de entrenamiento',
      'targetKcal': 'Kcal objetivo',
      'exercise': 'Ejercicio',
      'video': 'Video',
      'duration': 'Duración',
    },

    // German (DE)
    'de': {
      'soni': 'SO:NI',
      'continuee': 'Fortfahren',
      'enterfullName': 'Vollständigen Namen eingeben',
      'enterEmailAddress': 'E-Mail-Adresse eingeben',
      'enterMobileNumber': 'Handynummer eingeben',
      'enterPassword': 'Passwort eingeben',
      'reEnterPassword': 'Passwort erneut eingeben',
      'signUp': 'Anmelden',
      'singIn': 'Einloggen',
      'forgotPassword': 'Passwort vergessen?',
      'pleaseEnterYourEmail':
          'Bitte geben Sie Ihre E-Mail-Adresse ein, um das Passwort zurückzusetzen',
      'resetPassword': 'Passwort zurücksetzen',
      'veryfyCode': 'Code überprüfen',
      'checkYourEmail': 'Überprüfen Sie Ihre E-Mails',
      'weSentCode': 'Wir haben einen Code gesendet an',
      'haventgotEmail': 'Haben Sie die E-Mail noch nicht erhalten?',
      'resendEmail': 'E-Mail erneut senden',
      'passwordReset': 'Passwort zurückgesetzt',
      'updatePassword': 'Passwort aktualisieren',
      'smartFoodScanner': 'Smart Food Scanner',
      'instantlyAnalize':
          'Analysiere sofort deine Mahlzeiten mit KI, um Kalorien und Nährstoffe zu verfolgen.',
      'aiPowerdModelRecommend': 'KI-gestützte Essensempfehlung',
      'getPersonalized':
          'Erhalte personalisierte Mahlzeitenpläne, die auf deine Gesundheits- und Fitnessziele zugeschnitten sind.',
      'smartMealDiary': 'Smart Meal Diary',
      'logYourDailyMeals':
          'Logge deine täglichen Mahlzeiten und verfolge deinen Wellnessweg mühelos.',
      'personalizedWorkoutPlan': 'Personalisiertes Trainingsprogramm',
      'aiTailored':
          'KI-angepasste Workouts, die auf deine Ziele und Fitnesslevel zugeschnitten sind.',
      'howOldAreYou': 'Wie alt bist du?',
      'whatsYourFullName': 'Was ist dein voller Name?',
      'whatsYourGender': 'Was ist dein Geschlecht?',
      'whatsYourHeight': 'Wie groß bist du?',
      'whatsYourWeight': 'Wie viel wiegst du?',
      'tellUsAboutYourLifestyle': 'Erzählen Sie uns von Ihrem Lebensstil!',
      'whatsYourPrimaryHealthGoal':
          'Was ist dein Hauptziel im Bereich Gesundheit?',
      'doyouFollowSpecificDiet': 'Folgen Sie einer speziellen Diät?',
      'doyouHaveAnyDietryRestrication': 'Haben Sie Diätbeschränkungen?',
      'selectALanguage': 'Wählen Sie eine Sprache',
      'yourName': 'Ihr Name',
      'startYour3dayFreeTrailToContinue':
          'Starten Sie Ihre 3-tägige kostenlose Testversion, um fortzufahren.',
      'today': 'Heute',
      'day2': 'Tag 2',
      'after3Day': 'Nach Tag 3',
      'getFullAccessAndSeeYourMindset':
          'Erhalten Sie vollen Zugang und sehen Sie, wie sich Ihre Denkweise verändert.',
      'getAreminderThatYourTrialEndsIn':
          'Erhalten Sie eine Erinnerung, dass Ihre Testversion in 24 Stunden endet.',
      'yourFreeTrailEndsAndYouWillbeCharged':
          'Ihre kostenlose Testversion endet und Sie werden berechnet. Kündigen Sie jederzeit vorher.',
      'monthly': 'Monatlich',
      'mo199': '1,99 € / Monat',
      'yearly': 'Jährlich',
      'mo099': '0,99 € / Monat',
      'dayfree3': '3 Tage kostenlos',
      'noPaymentDueNow': 'Keine Zahlungen jetzt fällig',
      'start3dayFreeTrial': 'Starten Sie 3 Tage kostenlose Testversion',
      'daysFreeThen': '3 Tage kostenlos dann 11,88 € pro Jahr',
      'great': 'Großartig!',
      'yourProfileIsReady': 'Ihr Profil ist fertig.',
      'letsStartBuildingHealth':
          'Lassen Sie uns gemeinsam gesunde Gewohnheiten aufbauen!',
      'gotoHomePages': 'Gehe zur Homepage',
      'yourDailyCalories': 'Ihre täglichen Kalorien',
      'kcalTotal': 'Gesamt Kcal',
      'carbs': 'Kohlenhydrate',
      'protein': 'Eiweiß',
      'fat': 'Fett',
      'yourWeeklyCalories': 'Ihre wöchentlichen Kalorien',
      'mealPlanCalendar': 'Mahlzeitenplan Kalender',
      'customizeYourThreeDays': 'Passen Sie Ihre drei Tage an',
      'yourWaterGoal': 'Tägliches Wasserziel',
      'latNight': 'Letzte Nacht',
      'weeklyAvg': 'Wöchentlicher Durchschnitt',
      'workWoutProgress': 'Workout-Fortschritt',
      'yourDailyWorkoutProgress': 'Ihr täglicher Trainingsfortschritt',
      'targetKcal': 'Ziel Kcal',
      'exercise': 'Übung',
      'video': 'Video',
      'duration': 'Dauer',
    },
    // Italian (IT)
    'it': {
      'soni': 'SO:NI',
      'continuee': 'Continua',
      'enterfullName': 'Inserisci il nome completo',
      'enterEmailAddress': 'Inserisci l\'indirizzo email',
      'enterMobileNumber': 'Inserisci il numero di cellulare',
      'enterPassword': 'Inserisci la password',
      'reEnterPassword': 'Reinserisci la password',
      'signUp': 'Registrati',
      'singIn': 'Accedi',
      'forgotPassword': 'Hai dimenticato la password?',
      'pleaseEnterYourEmail':
          'Inserisci la tua email per ripristinare la password',
      'resetPassword': 'Ripristina la password',
      'veryfyCode': 'Verifica il codice',
      'checkYourEmail': 'Controlla la tua email',
      'weSentCode': 'Abbiamo inviato un codice a',
      'haventgotEmail': 'Non hai ancora ricevuto l\'email?',
      'resendEmail': 'Reinvia l\'email',
      'passwordReset': 'Password ripristinata',
      'updatePassword': 'Aggiorna la password',

      //================================ Onboarding ============================
      'smartFoodScanner': 'Scanner alimentare intelligente',
      'instantlyAnalize':
          'Analizza subito i tuoi pasti con l\'AI per tracciare calorie e nutrienti.',
      'aiPowerdModelRecommend': 'Raccomandazioni per i pasti basate su IA',
      'getPersonalized':
          'Ricevi piani alimentari personalizzati in base ai tuoi obiettivi di salute e fitness.',
      'smartMealDiary': 'Diario alimentare intelligente',
      'logYourDailyMeals':
          'Registra i tuoi pasti giornalieri e segui il tuo percorso di benessere senza sforzi.',
      'personalizedWorkoutPlan': 'Piano di allenamento personalizzato',
      'aiTailored':
          'Allenamenti progettati da IA per adattarsi ai tuoi obiettivi e livello di fitness.',
      'howOldAreYou': 'Quanti anni hai?',
      'whatsYourFullName': 'Qual è il tuo nome completo?',
      'whatsYourGender': 'Qual è il tuo genere?',
      'whatsYourHeight': 'Qual è la tua altezza?',
      'whatsYourWeight': 'Qual è il tuo peso?',
      'tellUsAboutYourLifestyle': 'Raccontaci del tuo stile di vita!',
      'whatsYourPrimaryHealthGoal':
          'Qual è il tuo obiettivo di salute principale?',
      'doyouFollowSpecificDiet': 'Segui una dieta specifica?',
      'doyouHaveAnyDietryRestrication': 'Hai restrizioni alimentari?',
      'selectALanguage': 'Seleziona una lingua',
      'yourName': 'Il tuo nome',

      'startYour3dayFreeTrailToContinue':
          'Inizia la tua prova GRATUITA di 3 giorni per continuare.',
      'today': 'Oggi',
      'day2': 'Giorno 2',
      'after3Day': 'Dopo il giorno 3',
      'getFullAccessAndSeeYourMindset':
          'Ottieni l\'accesso completo e vedrai il cambiamento della tua mentalità.',
      'getAreminderThatYourTrialEndsIn':
          'Ricevi un promemoria che la tua prova termina tra 24 ore.',
      'yourFreeTrailEndsAndYouWillbeCharged':
          'La tua prova gratuita termina e ti verrà addebitato il costo, annulla in qualsiasi momento prima.',
      'monthly': 'Mensile',
      'mo199': '1,99 € / mese',
      'yearly': 'Annuale',
      'mo099': '0,99 € / mese',
      'dayfree3': '3 giorni gratis',
      'noPaymentDueNow': 'Nessun pagamento dovuto ora',
      'start3dayFreeTrial': 'Inizia la prova gratuita di 3 giorni',
      'daysFreeThen': '3 giorni gratuiti poi 11,88 € all\'anno',
      'great': 'Fantastico!',
      'yourProfileIsReady': 'Il tuo profilo è pronto.',
      'letsStartBuildingHealth':
          'Cominciamo a costruire abitudini più sane insieme!',
      'gotoHomePages': 'Vai alla pagina principale',

      //================================ Home Screen =================================
      'yourDailyCalories': 'Le tue calorie giornaliere',
      'kcalTotal': 'Totale Kcal',
      'carbs': 'Carboidrati',
      'protein': 'Proteine',
      'fat': 'Grassi',
      'yourWeeklyCalories': 'Le tue calorie settimanali',
      'mealPlanCalendar': 'Calendario del piano pasti',
      'customizeYourThreeDays': 'Personalizza i tuoi tre giorni',
      'yourWaterGoal': 'Obiettivo di acqua giornaliero',
      'latNight': 'La scorsa notte',
      'weeklyAvg': 'Media settimanale',
      'workWoutProgress': 'Progresso dell\'allenamento',
      'yourDailyWorkoutProgress':
          'Il tuo progresso quotidiano nell\'allenamento',
      'targetKcal': 'Kcal obiettivo',
      'exercise': 'Esercizio',
      'video': 'Video',
      'duration': 'Durata',
    },
    // Hungarian (HU)
    'hu': {
      'soni': 'SO:NI',
      'continuee': 'Folytatás',
      'enterfullName': 'Teljes név megadása',
      'enterEmailAddress': 'Email cím megadása',
      'enterMobileNumber': 'Mobil szám megadása',
      'enterPassword': 'Jelszó megadása',
      'reEnterPassword': 'Jelszó újra megadása',
      'signUp': 'Regisztráció',
      'singIn': 'Bejelentkezés',
      'forgotPassword': 'Elfelejtett jelszó?',
      'pleaseEnterYourEmail':
          'Kérjük, adja meg az email címét a jelszó visszaállításához',
      'resetPassword': 'Jelszó visszaállítása',
      'veryfyCode': 'Kód ellenőrzése',
      'checkYourEmail': 'Ellenőrizze az emailjét',
      'weSentCode': 'Küldtünk egy kódot a következő email címre',
      'haventgotEmail': 'Még nem kapta meg az emailt?',
      'resendEmail': 'Email újraküldése',
      'passwordReset': 'Jelszó visszaállítva',
      'updatePassword': 'Jelszó frissítése',

      //================================ Onboarding ============================
      'smartFoodScanner': 'Okos étel szkenner',
      'instantlyAnalize':
          'Azonnal analizálja az étkezéseit AI segítségével, hogy nyomon kövesse a kalóriákat és tápanyagokat.',
      'aiPowerdModelRecommend': 'AI-alapú étkezési ajánlások',
      'getPersonalized':
          'Személyre szabott étkezési terveket kap, amelyek a céljainak és egészségi állapotának megfelelően készültek.',
      'smartMealDiary': 'Okos étkezési napló',
      'logYourDailyMeals':
          'Naponta rögzítse étkezéseit és kövesse egészségügyi előrehaladását könnyedén.',
      'personalizedWorkoutPlan': 'Személyre szabott edzésterv',
      'aiTailored':
          'AI által tervezett edzések, amelyek az Ön céljaira és fitnesz szintjére vannak szabva.',
      'howOldAreYou': 'Hány éves vagy?',
      'whatsYourFullName': 'Mi a teljes neved?',
      'whatsYourGender': 'Mi a nemed?',
      'whatsYourHeight': 'Mekkora a magasságod?',
      'whatsYourWeight': 'Mennyi a súlyod?',
      'tellUsAboutYourLifestyle': 'Mesélj nekünk az életstílusodról!',
      'whatsYourPrimaryHealthGoal': 'Mi az alapvető egészségügyi célod?',
      'doyouFollowSpecificDiet': 'Követel egy speciális diétát?',
      'doyouHaveAnyDietryRestrication': 'Vannak diétás korlátozások?',
      'selectALanguage': 'Válasszon nyelvet',
      'yourName': 'A neved',

      'startYour3dayFreeTrailToContinue':
          'Kezdje el a 3 napos INGYENES próbaverziót a folytatáshoz.',
      'today': 'Ma',
      'day2': '2. nap',
      'after3Day': '3. nap után',
      'getFullAccessAndSeeYourMindset':
          'Szerezzen teljes hozzáférést, és látni fogja, hogyan változik a gondolkodásmódja.',
      'getAreminderThatYourTrialEndsIn':
          'Kérjen emlékeztetőt, hogy a próbaverziója 24 órán belül lejár',
      'yourFreeTrailEndsAndYouWillbeCharged':
          'A próbaverziója lejár, és díjat számítunk fel. Bármikor lemondhatja előtte.',
      'monthly': 'Havi',
      'mo199': '1,99 €/hó',
      'yearly': 'Éves',
      'mo099': '0,99 €/hó',
      'dayfree3': '3 nap ingyenes',
      'noPaymentDueNow': 'Nincs fizetendő összeg most',
      'start3dayFreeTrial': 'Indítsa el a 3 napos ingyenes próbaverziót',
      'daysFreeThen': '3 nap ingyenes, majd 11,88 € évente',
      'great': 'Szuper!',
      'yourProfileIsReady': 'A profilod kész.',
      'letsStartBuildingHealth':
          'Kezdjük el együtt építeni az egészségesebb szokásokat!',
      'gotoHomePages': 'Menj a kezdőlapra',

      //================================ Home Screen =================================
      'yourDailyCalories': 'A napi kalóriáid',
      'kcalTotal': 'Összes Kcal',
      'carbs': 'Szénhidrátok',
      'protein': 'Fehérjék',
      'fat': 'Zsír',
      'yourWeeklyCalories': 'A heti kalóriáid',
      'mealPlanCalendar': 'Étkezési terv naptár',
      'customizeYourThreeDays': 'Testreszabhatod a három napodat',
      'yourWaterGoal': 'Napi vízfogyasztási cél',
      'latNight': 'Múlt éjszaka',
      'weeklyAvg': 'Heti átlag',
      'workWoutProgress': 'Edzés előrehaladás',
      'yourDailyWorkoutProgress': 'A napi edzésed előrehaladása',
      'targetKcal': 'Cél Kcal',
      'exercise': 'Gyakorlat',
      'video': 'Videó',
      'duration': 'Időtartam',
    },
    // French (FR)
    'fr': {
      'soni': 'SO:NI',
      'continuee': 'Continuer',
      'enterfullName': 'Entrez le nom complet',
      'enterEmailAddress': 'Entrez l\'adresse e-mail',
      'enterMobileNumber': 'Entrez le numéro de téléphone',
      'enterPassword': 'Entrez le mot de passe',
      'reEnterPassword': 'Re-entrez le mot de passe',
      'signUp': 'S\'inscrire',
      'singIn': 'Se connecter',
      'forgotPassword': 'Mot de passe oublié ?',
      'pleaseEnterYourEmail':
          'Veuillez entrer votre e-mail pour réinitialiser le mot de passe',
      'resetPassword': 'Réinitialiser le mot de passe',
      'veryfyCode': 'Vérifier le code',
      'checkYourEmail': 'Vérifiez votre e-mail',
      'weSentCode': 'Nous avons envoyé un code à',
      'haventgotEmail': 'Vous n\'avez pas encore reçu l\'e-mail ?',
      'resendEmail': 'Renvoyer l\'e-mail',
      'passwordReset': 'Mot de passe réinitialisé',
      'updatePassword': 'Mettre à jour le mot de passe',

      //================================ Onboarding ============================
      'smartFoodScanner': 'Scanner alimentaire intelligent',
      'instantlyAnalize':
          'Analysez immédiatement vos repas avec l\'IA pour suivre les calories et les nutriments.',
      'aiPowerdModelRecommend': 'Recommandation de repas alimentée par IA',
      'getPersonalized':
          'Obtenez des plans de repas personnalisés adaptés à vos objectifs de santé et de condition physique.',
      'smartMealDiary': 'Journal alimentaire intelligent',
      'logYourDailyMeals':
          'Enregistrez vos repas quotidiens et suivez facilement votre parcours de bien-être.',
      'personalizedWorkoutPlan': 'Plan d\'entraînement personnalisé',
      'aiTailored':
          'Entraînements personnalisés par IA adaptés à vos objectifs et à votre niveau de condition physique.',
      'howOldAreYou': 'Quel âge avez-vous ?',
      'whatsYourFullName': 'Quel est votre nom complet ?',
      'whatsYourGender': 'Quel est votre sexe ?',
      'whatsYourHeight': 'Quelle est votre taille ?',
      'whatsYourWeight': 'Quel est votre poids ?',
      'tellUsAboutYourLifestyle': 'Parlez-nous de votre mode de vie !',
      'whatsYourPrimaryHealthGoal':
          'Quel est votre principal objectif de santé ?',
      'doyouFollowSpecificDiet': 'Suivez-vous un régime spécifique ?',
      'doyouHaveAnyDietryRestrication':
          'Avez-vous des restrictions alimentaires ?',
      'selectALanguage': 'Sélectionner une langue',
      'yourName': 'Votre nom',

      'startYour3dayFreeTrailToContinue':
          'Commencez votre essai GRATUIT de 3 jours pour continuer.',
      'today': 'Aujourd\'hui',
      'day2': 'Jour 2',
      'after3Day': 'Après le jour 3',
      'getFullAccessAndSeeYourMindset':
          'Obtenez un accès complet et voyez comment votre état d\'esprit commence à changer.',
      'getAreminderThatYourTrialEndsIn':
          'Recevez un rappel que votre essai se termine dans 24 heures',
      'yourFreeTrailEndsAndYouWillbeCharged':
          'Votre essai gratuit se termine et vous serez facturé, annulez à tout moment avant.',
      'monthly': 'Mensuel',
      'mo199': '1,99 € / mois',
      'yearly': 'Annuel',
      'mo099': '0,99 € / mois',
      'dayfree3': '3 jours gratuits',
      'noPaymentDueNow': 'Aucun paiement dû maintenant',
      'start3dayFreeTrial': 'Démarrer l\'essai gratuit de 3 jours',
      'daysFreeThen': '3 jours gratuits, puis 11,88 € par an',
      'great': 'Super !',
      'yourProfileIsReady': 'Votre profil est prêt.',
      'letsStartBuildingHealth':
          'Commençons à créer des habitudes plus saines ensemble !',
      'gotoHomePages': 'Aller à la page d\'accueil',

      //================================ Home Screen =================================
      'yourDailyCalories': 'Vos calories quotidiennes',
      'kcalTotal': 'Total des Kcal',
      'carbs': 'Glucides',
      'protein': 'Protéines',
      'fat': 'Graisses',
      'yourWeeklyCalories': 'Vos calories hebdomadaires',
      'mealPlanCalendar': 'Calendrier du plan de repas',
      'customizeYourThreeDays': 'Personnalisez vos trois jours',
      'yourWaterGoal': 'Objectif d\'eau quotidien',
      'latNight': 'La nuit dernière',
      'weeklyAvg': 'Moyenne hebdomadaire',
      'workWoutProgress': 'Progrès de l\'entraînement',
      'yourDailyWorkoutProgress': 'Vos progrès quotidiens en entraînement',
      'targetKcal': 'Kcal cible',
      'exercise': 'Exercice',
      'video': 'Vidéo',
      'duration': 'Durée',
    },

    // Add other languages here (German, Spanish, etc.) in a similar manner...
  };
}
