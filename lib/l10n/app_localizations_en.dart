// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get settingsPrivacy => 'Privacidad';

  @override
  String get settingsPrivacySubtitle => 'Control de datos y actividad';

  @override
  String get settingsEditProfile => 'Editar perfil';

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
