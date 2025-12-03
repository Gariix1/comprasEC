// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Compras EC';

  @override
  String get navSearch => 'Buscar';

  @override
  String get navTracking => 'Tracker';

  @override
  String get navCommunity => 'Comunidad';

  @override
  String get navSettings => 'Config';

  @override
  String get navServices => 'Servicios';

  @override
  String get searchPlaceholder => 'Buscar producto';

  @override
  String get searchHint => 'Ej: smartwatch, audifonos, ropa';

  @override
  String get searchFeatured => 'Resultados destacados';

  @override
  String get searchCreateAlert => 'Crear alerta';

  @override
  String get searchFilter => 'Filtrar';

  @override
  String get trackingNumber => 'Numero de seguimiento';

  @override
  String get trackingHint => 'Ej: LB123456789CN';

  @override
  String get trackingTimeline => 'Linea de tiempo';

  @override
  String get trackingRefresh => 'Actualizar estado';

  @override
  String get searchCategoryElectronics => 'Electrónica';

  @override
  String get searchCategoryHome => 'Hogar';

  @override
  String get communityTitle => 'Comunidad';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSubtitle => 'Claro / Oscuro / Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Oscuro';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageSystem => 'Predeterminado del sistema';

  @override
  String get settingsLanguageSpanish => 'Español';

  @override
  String get settingsLanguageEnglish => 'Inglés';

  @override
  String get settingsAccent => 'Acento de color';

  @override
  String get settingsAccentSubtitle => 'Verde (predeterminado)';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsOffersAlerts => 'Alertas de ofertas';

  @override
  String get settingsOffersSubtitle => 'Cambios de precio y ofertas destacadas';

  @override
  String get settingsShippingAlerts => 'Estados de envío';

  @override
  String get settingsShippingSubtitle => 'Actualizaciones del tracker y aduana';

  @override
  String get settingsAccount => 'Cuenta';

  @override
  String get settingsProfile => 'Perfil';

  @override
  String get settingsProfileSubtitle => 'Datos y preferencias de la cuenta';

  @override
  String get settingsUserName => 'Usuario';

  @override
  String get settingsLinkedGoogle => 'Google vinculado';

  @override
  String get settingsLinkedApple => 'Apple no vinculado';

  @override
  String get settingsConnectAccounts => 'Conectar cuentas';

  @override
  String get settingsConnectAccountsSubtitle =>
      'Vincula Google o Apple ID para sincronizar datos';

  @override
  String get settingsConnectGoogle => 'Google';

  @override
  String get settingsConnectApple => 'Apple ID';

  @override
  String get settingsPrivacy => 'Privacidad';

  @override
  String get settingsPrivacySubtitle => 'Control de datos y actividad';

  @override
  String get settingsDataActivityTitle => 'Datos y actividad';

  @override
  String get settingsDataActivitySubtitle =>
      'Controla uso de datos, registros de actividad y permisos aquí.';

  @override
  String get settingsEditProfile => 'Editar perfil';

  @override
  String get servicesTitle => 'Servicios conectados';

  @override
  String servicesManage(Object serviceName) {
    return 'Conecta o gestiona tu cuenta de $serviceName';
  }

  @override
  String get errorGeneric => 'Ocurrió un error al cargar';

  @override
  String get searchEmptyMessage =>
      'No hay resultados aún. Prueba otra búsqueda o crea una alerta.';

  @override
  String get trackingEmptyMessage => 'No hay eventos para este tracking';

  @override
  String get trackingError => 'Ocurrió un error al cargar el tracking';

  @override
  String get trackingErrorInvalid => 'Ingresa un número válido';

  @override
  String get communityError => 'Ocurrió un error al cargar la comunidad';

  @override
  String get communityEmpty => 'No hay publicaciones aún';
}
