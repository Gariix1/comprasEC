// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'EC Shopping';

  @override
  String get navSearch => 'Search';

  @override
  String get navTracking => 'Tracker';

  @override
  String get navCommunity => 'Community';

  @override
  String get navSettings => 'Settings';

  @override
  String get navServices => 'Services';

  @override
  String get searchPlaceholder => 'Search product';

  @override
  String get searchHint => 'e.g. smartwatch, headphones, clothes';

  @override
  String get searchFeatured => 'Featured results';

  @override
  String get searchCreateAlert => 'Create alert';

  @override
  String get searchFilter => 'Filter';

  @override
  String get trackingNumber => 'Tracking number';

  @override
  String get trackingHint => 'e.g. LB123456789CN';

  @override
  String get trackingTimeline => 'Timeline';

  @override
  String get trackingRefresh => 'Refresh status';

  @override
  String get searchCategoryElectronics => 'Electronics';

  @override
  String get searchCategoryHome => 'Home';

  @override
  String get communityTitle => 'Community';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeSubtitle => 'Light / Dark / System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSystem => 'System default';

  @override
  String get settingsLanguageSpanish => 'Spanish';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsAccent => 'Accent color';

  @override
  String get settingsAccentSubtitle => 'Green (default)';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsOffersAlerts => 'Offers alerts';

  @override
  String get settingsOffersSubtitle => 'Price changes and highlighted deals';

  @override
  String get settingsShippingAlerts => 'Shipping status';

  @override
  String get settingsShippingSubtitle => 'Tracker and customs updates';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsProfileSubtitle => 'Account data and preferences';

  @override
  String get settingsUserName => 'User';

  @override
  String get settingsLinkedGoogle => 'Google linked';

  @override
  String get settingsLinkedApple => 'Apple not linked';

  @override
  String get settingsConnectAccounts => 'Link accounts';

  @override
  String get settingsConnectAccountsSubtitle =>
      'Link Google or Apple ID to sync data';

  @override
  String get settingsConnectGoogle => 'Google';

  @override
  String get settingsConnectApple => 'Apple ID';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsPrivacySubtitle => 'Data and activity control';

  @override
  String get settingsDataActivityTitle => 'Data & activity';

  @override
  String get settingsDataActivitySubtitle =>
      'Control data usage, activity logs and permissions here.';

  @override
  String get settingsEditProfile => 'Edit profile';

  @override
  String get servicesTitle => 'Connected services';

  @override
  String servicesManage(Object serviceName) {
    return 'Connect or manage your $serviceName account';
  }

  @override
  String get errorGeneric => 'An error occurred while loading';

  @override
  String get searchEmptyMessage =>
      'No results yet. Try another search or create an alert.';

  @override
  String get trackingEmptyMessage => 'No events for this tracking';

  @override
  String get trackingError => 'Failed to load tracking';

  @override
  String get trackingErrorInvalid => 'Enter a valid number';

  @override
  String get communityError => 'Failed to load community';

  @override
  String get communityEmpty => 'No posts yet';
}
