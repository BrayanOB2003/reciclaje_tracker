import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'EcoTrack'**
  String get appTitle;

  /// No description provided for @calculatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Recycling Calculator'**
  String get calculatorTitle;

  /// No description provided for @trackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Deliveries Tracking'**
  String get trackingTitle;

  /// No description provided for @enterRecycledMaterials.
  ///
  /// In en, this message translates to:
  /// **'Enter your recycled materials'**
  String get enterRecycledMaterials;

  /// No description provided for @calculateBenefits.
  ///
  /// In en, this message translates to:
  /// **'Calculate Benefits'**
  String get calculateBenefits;

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get invalid;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'Kg'**
  String get kg;

  /// No description provided for @materialPaper.
  ///
  /// In en, this message translates to:
  /// **'Paper'**
  String get materialPaper;

  /// No description provided for @materialCardboard.
  ///
  /// In en, this message translates to:
  /// **'Cardboard'**
  String get materialCardboard;

  /// No description provided for @materialPlastic.
  ///
  /// In en, this message translates to:
  /// **'Plastic'**
  String get materialPlastic;

  /// No description provided for @materialGlass.
  ///
  /// In en, this message translates to:
  /// **'Glass'**
  String get materialGlass;

  /// No description provided for @materialAluminum.
  ///
  /// In en, this message translates to:
  /// **'Aluminum'**
  String get materialAluminum;

  /// No description provided for @materialCopper.
  ///
  /// In en, this message translates to:
  /// **'Copper'**
  String get materialCopper;

  /// No description provided for @materialOil.
  ///
  /// In en, this message translates to:
  /// **'Oil'**
  String get materialOil;

  /// No description provided for @materialScrap.
  ///
  /// In en, this message translates to:
  /// **'Scrap'**
  String get materialScrap;

  /// No description provided for @co2Saved.
  ///
  /// In en, this message translates to:
  /// **'CO₂ saved'**
  String get co2Saved;

  /// No description provided for @treesSaved.
  ///
  /// In en, this message translates to:
  /// **'Trees'**
  String get treesSaved;

  /// No description provided for @energySaved.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energySaved;

  /// No description provided for @waterSaved.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get waterSaved;

  /// No description provided for @recycled.
  ///
  /// In en, this message translates to:
  /// **'Recycled'**
  String get recycled;

  /// No description provided for @metricUnitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get metricUnitKg;

  /// No description provided for @metricUnitKwh.
  ///
  /// In en, this message translates to:
  /// **'kWh'**
  String get metricUnitKwh;

  /// No description provided for @metricUnitL.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get metricUnitL;

  /// No description provided for @moreInfoAbout.
  ///
  /// In en, this message translates to:
  /// **'More info about {metric}!'**
  String moreInfoAbout(Object metric);

  /// No description provided for @simulateUpdate.
  ///
  /// In en, this message translates to:
  /// **'Simulate update'**
  String get simulateUpdate;

  /// No description provided for @formRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get formRequired;

  /// No description provided for @formOnlyPositive.
  ///
  /// In en, this message translates to:
  /// **'Only positive numbers allowed'**
  String get formOnlyPositive;

  /// No description provided for @formEnterNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a number'**
  String get formEnterNumber;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your recycling app!'**
  String get welcomeMessage;

  /// No description provided for @calculatorDescription.
  ///
  /// In en, this message translates to:
  /// **'Calculate the ecological benefit of your recycled materials.'**
  String get calculatorDescription;

  /// No description provided for @trackingDescription.
  ///
  /// In en, this message translates to:
  /// **'View the history of your deliveries and overall impact.'**
  String get trackingDescription;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// No description provided for @totalRecycled.
  ///
  /// In en, this message translates to:
  /// **'Total recycled'**
  String get totalRecycled;

  /// No description provided for @co2Equivalence.
  ///
  /// In en, this message translates to:
  /// **'This is equivalent to avoiding a car driving {km} km.'**
  String co2Equivalence(Object km);

  /// No description provided for @addDelivery.
  ///
  /// In en, this message translates to:
  /// **'Add delivery'**
  String get addDelivery;

  /// No description provided for @clearForm.
  ///
  /// In en, this message translates to:
  /// **'Clear fields'**
  String get clearForm;

  /// No description provided for @emptyFormError.
  ///
  /// In en, this message translates to:
  /// **'Digitize your recycling!'**
  String get emptyFormError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
