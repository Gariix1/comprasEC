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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Compras EC'**
  String get appTitle;

  /// No description provided for @navSearch.
  ///
  /// In es, this message translates to:
  /// **'Buscar'**
  String get navSearch;

  /// No description provided for @navTracking.
  ///
  /// In es, this message translates to:
  /// **'Tracker'**
  String get navTracking;

  /// No description provided for @navCommunity.
  ///
  /// In es, this message translates to:
  /// **'Comunidad'**
  String get navCommunity;

  /// No description provided for @navSettings.
  ///
  /// In es, this message translates to:
  /// **'Config'**
  String get navSettings;

  /// No description provided for @searchPlaceholder.
  ///
  /// In es, this message translates to:
  /// **'Buscar producto'**
  String get searchPlaceholder;

  /// No description provided for @searchHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: smartwatch, audifonos, ropa'**
  String get searchHint;

  /// No description provided for @searchFeatured.
  ///
  /// In es, this message translates to:
  /// **'Resultados destacados'**
  String get searchFeatured;

  /// No description provided for @searchCreateAlert.
  ///
  /// In es, this message translates to:
  /// **'Crear alerta'**
  String get searchCreateAlert;

  /// No description provided for @searchFilter.
  ///
  /// In es, this message translates to:
  /// **'Filtrar'**
  String get searchFilter;

  /// No description provided for @trackingNumber.
  ///
  /// In es, this message translates to:
  /// **'Numero de seguimiento'**
  String get trackingNumber;

  /// No description provided for @trackingHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: LB123456789CN'**
  String get trackingHint;

  /// No description provided for @trackingTimeline.
  ///
  /// In es, this message translates to:
  /// **'Linea de tiempo'**
  String get trackingTimeline;

  /// No description provided for @trackingRefresh.
  ///
  /// In es, this message translates to:
  /// **'Actualizar estado'**
  String get trackingRefresh;

  /// No description provided for @communityTitle.
  ///
  /// In es, this message translates to:
  /// **'Comunidad'**
  String get communityTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get settingsAppearance;

  /// No description provided for @settingsTheme.
  ///
  /// In es, this message translates to:
  /// **'Tema'**
  String get settingsTheme;

  /// No description provided for @settingsThemeSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Claro / Oscuro / Sistema'**
  String get settingsThemeSubtitle;

  /// No description provided for @settingsAccent.
  ///
  /// In es, this message translates to:
  /// **'Acento de color'**
  String get settingsAccent;

  /// No description provided for @settingsAccentSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Verde (predeterminado)'**
  String get settingsAccentSubtitle;

  /// No description provided for @settingsNotifications.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get settingsNotifications;

  /// No description provided for @settingsOffersAlerts.
  ///
  /// In es, this message translates to:
  /// **'Alertas de ofertas'**
  String get settingsOffersAlerts;

  /// No description provided for @settingsOffersSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Cambios de precio y ofertas destacadas'**
  String get settingsOffersSubtitle;

  /// No description provided for @settingsShippingAlerts.
  ///
  /// In es, this message translates to:
  /// **'Estados de envío'**
  String get settingsShippingAlerts;

  /// No description provided for @settingsShippingSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Actualizaciones del tracker y aduana'**
  String get settingsShippingSubtitle;

  /// No description provided for @settingsAccount.
  ///
  /// In es, this message translates to:
  /// **'Cuenta'**
  String get settingsAccount;

  /// No description provided for @settingsProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get settingsProfile;

  /// No description provided for @settingsProfileSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Datos y preferencias de la cuenta'**
  String get settingsProfileSubtitle;

  /// No description provided for @settingsPrivacy.
  ///
  /// In es, this message translates to:
  /// **'Privacidad'**
  String get settingsPrivacy;

  /// No description provided for @settingsPrivacySubtitle.
  ///
  /// In es, this message translates to:
  /// **'Control de datos y actividad'**
  String get settingsPrivacySubtitle;

  /// No description provided for @settingsEditProfile.
  ///
  /// In es, this message translates to:
  /// **'Editar perfil'**
  String get settingsEditProfile;

  /// No description provided for @errorGeneric.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error al cargar'**
  String get errorGeneric;

  /// No description provided for @searchEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'No hay resultados aún. Prueba otra búsqueda o crea una alerta.'**
  String get searchEmptyMessage;

  /// No description provided for @trackingEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'No hay eventos para este tracking'**
  String get trackingEmptyMessage;

  /// No description provided for @trackingError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error al cargar el tracking'**
  String get trackingError;

  /// No description provided for @trackingErrorInvalid.
  ///
  /// In es, this message translates to:
  /// **'Ingresa un número válido'**
  String get trackingErrorInvalid;

  /// No description provided for @communityError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error al cargar la comunidad'**
  String get communityError;

  /// No description provided for @communityEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay publicaciones aún'**
  String get communityEmpty;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
