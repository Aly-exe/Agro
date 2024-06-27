// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign up`
  String get create_acc {
    return Intl.message(
      'Sign up',
      name: 'create_acc',
      desc: '',
      args: [],
    );
  }

  /// ` first name`
  String get first_name {
    return Intl.message(
      ' first name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// ` last name`
  String get last_name {
    return Intl.message(
      ' last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_acc {
    return Intl.message(
      'Already have an account?',
      name: 'have_acc',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `enter first name`
  String get first_name_please {
    return Intl.message(
      'enter first name',
      name: 'first_name_please',
      desc: '',
      args: [],
    );
  }

  /// `enter last name`
  String get last_name_please {
    return Intl.message(
      'enter last name',
      name: 'last_name_please',
      desc: '',
      args: [],
    );
  }

  /// `enter valid name`
  String get validName {
    return Intl.message(
      'enter valid name',
      name: 'validName',
      desc: '',
      args: [],
    );
  }

  /// `enter your Email`
  String get email_please {
    return Intl.message(
      'enter your Email',
      name: 'email_please',
      desc: '',
      args: [],
    );
  }

  /// `enter valid email`
  String get valid_email_please {
    return Intl.message(
      'enter valid email',
      name: 'valid_email_please',
      desc: '',
      args: [],
    );
  }

  /// `enter password`
  String get password_please {
    return Intl.message(
      'enter password',
      name: 'password_please',
      desc: '',
      args: [],
    );
  }

  /// `successful Login You can now use App.`
  String get successful_registration {
    return Intl.message(
      'successful Login You can now use App.',
      name: 'successful_registration',
      desc: '',
      args: [],
    );
  }

  /// `failed registration please try again`
  String get failed_registration {
    return Intl.message(
      'failed registration please try again',
      name: 'failed_registration',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Market`
  String get Market {
    return Intl.message(
      'Market',
      name: 'Market',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get Setting {
    return Intl.message(
      'Setting',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Feedbacks`
  String get Feedbacks {
    return Intl.message(
      'Feedbacks',
      name: 'Feedbacks',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get Rateus {
    return Intl.message(
      'Rate Us',
      name: 'Rateus',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get About {
    return Intl.message(
      'About us',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Create Now`
  String get create_now {
    return Intl.message(
      'Create Now',
      name: 'create_now',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get donot_have_account {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'donot_have_account',
      desc: '',
      args: [],
    );
  }

  /// `diagnose`
  String get diagnose {
    return Intl.message(
      'diagnose',
      name: 'diagnose',
      desc: '',
      args: [],
    );
  }

  /// `Crown Root Rot`
  String get Crown_Root_Rot {
    return Intl.message(
      'Crown Root Rot',
      name: 'Crown_Root_Rot',
      desc: '',
      args: [],
    );
  }

  /// `Healthy Wheat`
  String get Healthy_Wheat {
    return Intl.message(
      'Healthy Wheat',
      name: 'Healthy_Wheat',
      desc: '',
      args: [],
    );
  }

  /// `Leaf Rust`
  String get Leaf_Rust {
    return Intl.message(
      'Leaf Rust',
      name: 'Leaf_Rust',
      desc: '',
      args: [],
    );
  }

  /// `Loose Smut`
  String get Wheat_Loose_Smut {
    return Intl.message(
      'Loose Smut',
      name: 'Wheat_Loose_Smut',
      desc: '',
      args: [],
    );
  }

  /// `All You need to know About Wheat`
  String get explor_Main_title {
    return Intl.message(
      'All You need to know About Wheat',
      name: 'explor_Main_title',
      desc: '',
      args: [],
    );
  }

  /// `Wheat`
  String get wheatmarket {
    return Intl.message(
      'Wheat',
      name: 'wheatmarket',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get medicinemarket {
    return Intl.message(
      'Medicine',
      name: 'medicinemarket',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobile {
    return Intl.message(
      'Mobile Number',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get ProductName {
    return Intl.message(
      'Product Name',
      name: 'ProductName',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Available items`
  String get available {
    return Intl.message(
      'Available items',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Pound`
  String get pound {
    return Intl.message(
      'Pound',
      name: 'pound',
      desc: '',
      args: [],
    );
  }

  /// `kilo`
  String get kilo {
    return Intl.message(
      'kilo',
      name: 'kilo',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editprofile {
    return Intl.message(
      'Edit Profile',
      name: 'editprofile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// ` Dark Mode(Soon)`
  String get Mode {
    return Intl.message(
      ' Dark Mode(Soon)',
      name: 'Mode',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpandsupport {
    return Intl.message(
      'Help & Support',
      name: 'helpandsupport',
      desc: '',
      args: [],
    );
  }

  /// `Change Name`
  String get ChangeName {
    return Intl.message(
      'Change Name',
      name: 'ChangeName',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Changepassword {
    return Intl.message(
      'Change Password',
      name: 'Changepassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Image`
  String get ChangeProfileImage {
    return Intl.message(
      'Change Profile Image',
      name: 'ChangeProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `No Profile image selected to update`
  String get imageprofileerror {
    return Intl.message(
      'No Profile image selected to update',
      name: 'imageprofileerror',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `incorrect Email or Password`
  String get loginerror {
    return Intl.message(
      'incorrect Email or Password',
      name: 'loginerror',
      desc: '',
      args: [],
    );
  }

  /// `incorrect Password`
  String get passerror {
    return Intl.message(
      'incorrect Password',
      name: 'passerror',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Camcel`
  String get cancel {
    return Intl.message(
      'Camcel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logoutsure {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutsure',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get Yes {
    return Intl.message(
      'yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get resetpassword {
    return Intl.message(
      'Forget Password?',
      name: 'resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Name done Succecfully`
  String get Namesuccess {
    return Intl.message(
      'Change Name done Succecfully',
      name: 'Namesuccess',
      desc: '',
      args: [],
    );
  }

  /// `Some Errors occured , please try Again`
  String get Namefailed {
    return Intl.message(
      'Some Errors occured , please try Again',
      name: 'Namefailed',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Succecfully`
  String get passsuccess {
    return Intl.message(
      'Password Changed Succecfully',
      name: 'passsuccess',
      desc: '',
      args: [],
    );
  }

  /// `Some Errors occured , please try Again`
  String get passfailed {
    return Intl.message(
      'Some Errors occured , please try Again',
      name: 'passfailed',
      desc: '',
      args: [],
    );
  }

  /// `All Feedbacks `
  String get AllFeedbacks {
    return Intl.message(
      'All Feedbacks ',
      name: 'AllFeedbacks',
      desc: '',
      args: [],
    );
  }

  /// `No feedback available`
  String get Nofeedback {
    return Intl.message(
      'No feedback available',
      name: 'Nofeedback',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skip {
    return Intl.message(
      'SKIP',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Wheat becomes unusually wet, resulting in squirrel swelling and distortion, causing significant crop losses to reduce the incidence of loose swelling, some preventive measures such as ensuring good pre-harvest dehydration of wheat, controlling insects and innate diseases, and avoiding storage in wet conditions.`
  String get loosesmutdes {
    return Intl.message(
      'Wheat becomes unusually wet, resulting in squirrel swelling and distortion, causing significant crop losses to reduce the incidence of loose swelling, some preventive measures such as ensuring good pre-harvest dehydration of wheat, controlling insects and innate diseases, and avoiding storage in wet conditions.',
      name: 'loosesmutdes',
      desc: '',
      args: [],
    );
  }

  /// `'''Tebconazole''' is a fungicide that can be used to treat loose coal in wheat, and is considered effective against disease-causing fungi. It has to be used according to the specific instructions and doses, and on the infected leaves and cables.`
  String get loosesmutmed {
    return Intl.message(
      '\'\'\'Tebconazole\'\'\' is a fungicide that can be used to treat loose coal in wheat, and is considered effective against disease-causing fungi. It has to be used according to the specific instructions and doses, and on the infected leaves and cables.',
      name: 'loosesmutmed',
      desc: '',
      args: [],
    );
  }

  /// `Crown Rots & Root`
  String get CrownRotsAndRoots {
    return Intl.message(
      'Crown Rots & Root',
      name: 'CrownRotsAndRoots',
      desc: '',
      args: [],
    );
  }

  /// `The disease spreads to most farms immediately after the chilling, leading to the death of the infected seedlings, thus leading to a lack of production, especially if the time for planting a spasm is greater than that of the missing. The injury appears on some branches or on the entire plant, and is similar to the symptoms of water shortage`
  String get CrownRootdes {
    return Intl.message(
      'The disease spreads to most farms immediately after the chilling, leading to the death of the infected seedlings, thus leading to a lack of production, especially if the time for planting a spasm is greater than that of the missing. The injury appears on some branches or on the entire plant, and is similar to the symptoms of water shortage',
      name: 'CrownRootdes',
      desc: '',
      args: [],
    );
  }

  /// `'''Rezolx''' is used as an effective treatment to eliminate mold and is sprayed in soil every four weeks if the rot is severe and every six weeks if the rot is simple. The treatment must be sprayed in the evening where no sunshine reacts to chemicals and negatively affects the soil. Soil moisture must be checked periodically, especially before chemical treatments are sprayed`
  String get CrownRootmed {
    return Intl.message(
      '\'\'\'Rezolx\'\'\' is used as an effective treatment to eliminate mold and is sprayed in soil every four weeks if the rot is severe and every six weeks if the rot is simple. The treatment must be sprayed in the evening where no sunshine reacts to chemicals and negatively affects the soil. Soil moisture must be checked periodically, especially before chemical treatments are sprayed',
      name: 'CrownRootmed',
      desc: '',
      args: [],
    );
  }

  /// `The most common echo disease in wheat. Symptoms depend on plant sensitivity and injury. The incidence is characterized by the appearance of many small red orange pulses into a brown bull spread over the surface of the leaves, and by the perfume of the leaf and the crust. It's up to 1.5 mm in diameter, slightly high and round to rectangular shape.`
  String get leafrustdes {
    return Intl.message(
      'The most common echo disease in wheat. Symptoms depend on plant sensitivity and injury. The incidence is characterized by the appearance of many small red orange pulses into a brown bull spread over the surface of the leaves, and by the perfume of the leaf and the crust. It\'s up to 1.5 mm in diameter, slightly high and round to rectangular shape.',
      name: 'leafrustdes',
      desc: '',
      args: [],
    );
  }

  /// `Combination Products: Fungicides combining triazoles and strobilurins, like azoxystrobin + propiconazole, can offer broad-spectrum control.`
  String get leafrustmed {
    return Intl.message(
      'Combination Products: Fungicides combining triazoles and strobilurins, like azoxystrobin + propiconazole, can offer broad-spectrum control.',
      name: 'leafrustmed',
      desc: '',
      args: [],
    );
  }

  /// `Give us Your feedback`
  String get givefeedback {
    return Intl.message(
      'Give us Your feedback',
      name: 'givefeedback',
      desc: '',
      args: [],
    );
  }

  /// `What's your opinion about APP ?`
  String get feedbackquestion {
    return Intl.message(
      'What\'s your opinion about APP ?',
      name: 'feedbackquestion',
      desc: '',
      args: [],
    );
  }

  /// `Care to share more about it?`
  String get feedbackcare {
    return Intl.message(
      'Care to share more about it?',
      name: 'feedbackcare',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback`
  String get yourfeedback {
    return Intl.message(
      'Your feedback',
      name: 'yourfeedback',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your feedback`
  String get feedbackwarning {
    return Intl.message(
      'Please enter your feedback',
      name: 'feedbackwarning',
      desc: '',
      args: [],
    );
  }

  /// `PUBLISH FEEDBACK`
  String get publishfeedback {
    return Intl.message(
      'PUBLISH FEEDBACK',
      name: 'publishfeedback',
      desc: '',
      args: [],
    );
  }

  /// `Your review will be posted in the Application`
  String get feedbacksuccessmessage {
    return Intl.message(
      'Your review will be posted in the Application',
      name: 'feedbacksuccessmessage',
      desc: '',
      args: [],
    );
  }

  /// `By making your voice heard, you help us improve`
  String get feedbacksuccessmessage2 {
    return Intl.message(
      'By making your voice heard, you help us improve',
      name: 'feedbacksuccessmessage2',
      desc: '',
      args: [],
    );
  }

  /// `Thanks !`
  String get thanks {
    return Intl.message(
      'Thanks !',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectlanguage {
    return Intl.message(
      'Select Language',
      name: 'selectlanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get Cahngelanguage {
    return Intl.message(
      'Change Language',
      name: 'Cahngelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendcode {
    return Intl.message(
      'Send Code',
      name: 'sendcode',
      desc: '',
      args: [],
    );
  }

  /// `Email sent successfully , you can reset password now`
  String get email_sent {
    return Intl.message(
      'Email sent successfully , you can reset password now',
      name: 'email_sent',
      desc: '',
      args: [],
    );
  }

  /// `Error during send code please try again`
  String get resetpasswordsentemailfailed {
    return Intl.message(
      'Error during send code please try again',
      name: 'resetpasswordsentemailfailed',
      desc: '',
      args: [],
    );
  }

  /// `please enter Weight`
  String get weightplease {
    return Intl.message(
      'please enter Weight',
      name: 'weightplease',
      desc: '',
      args: [],
    );
  }

  /// `please enter Mobile Number`
  String get mobileplease {
    return Intl.message(
      'please enter Mobile Number',
      name: 'mobileplease',
      desc: '',
      args: [],
    );
  }

  /// `please enter Price`
  String get priceplease {
    return Intl.message(
      'please enter Price',
      name: 'priceplease',
      desc: '',
      args: [],
    );
  }

  /// `please enter your Name`
  String get nameplease {
    return Intl.message(
      'please enter your Name',
      name: 'nameplease',
      desc: '',
      args: [],
    );
  }

  /// `please enter Medicine Name`
  String get medicineplease {
    return Intl.message(
      'please enter Medicine Name',
      name: 'medicineplease',
      desc: '',
      args: [],
    );
  }

  /// `package`
  String get package {
    return Intl.message(
      'package',
      name: 'package',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
