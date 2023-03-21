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

  /// `Errores generales lanzados por el controlador simulado utilizado para la prueba.`
  String get general_mock {
    return Intl.message(
      'Errores generales lanzados por el controlador simulado utilizado para la prueba.',
      name: 'general_mock',
      desc: '',
      args: [],
    );
  }

  /// `La solicitud contiene uno o más argumentos no válidos. Consulte la documentación del punto final.`
  String get general_argument_invalid {
    return Intl.message(
      'La solicitud contiene uno o más argumentos no válidos. Consulte la documentación del punto final.',
      name: 'general_argument_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Se excedió el límite de consultas para el atributo actual. Está prohibido el uso de más de 100 valores de consulta en un solo atributo.`
  String get general_query_limit_exceeded {
    return Intl.message(
      'Se excedió el límite de consultas para el atributo actual. Está prohibido el uso de más de 100 valores de consulta en un solo atributo.',
      name: 'general_query_limit_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `La sintaxis de la consulta no es válida. Verifique la consulta y vuelva a intentarlo.`
  String get general_query_invalid {
    return Intl.message(
      'La sintaxis de la consulta no es válida. Verifique la consulta y vuelva a intentarlo.',
      name: 'general_query_invalid',
      desc: '',
      args: [],
    );
  }

  /// `El cursor no es válido. Esto puede ocurrir si se ha eliminado el elemento representado por el cursor.`
  String get general_cursor_not_found {
    return Intl.message(
      'El cursor no es válido. Esto puede ocurrir si se ha eliminado el elemento representado por el cursor.',
      name: 'general_cursor_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas no coinciden. Por favor verifique la contraseña y confirme la contraseña.`
  String get user_password_mismatch {
    return Intl.message(
      'Las contraseñas no coinciden. Por favor verifique la contraseña y confirme la contraseña.',
      name: 'user_password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `El usuario actual no tiene un número de teléfono asociado a su cuenta.`
  String get user_phone_not_found {
    return Intl.message(
      'El usuario actual no tiene un número de teléfono asociado a su cuenta.',
      name: 'user_phone_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Falta el ID del proveedor de OAuth2.`
  String get user_missing_id {
    return Intl.message(
      'Falta el ID del proveedor de OAuth2.',
      name: 'user_missing_id',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el dispositivo de almacenamiento solicitado.`
  String get storage_device_not_found {
    return Intl.message(
      'No se pudo encontrar el dispositivo de almacenamiento solicitado.',
      name: 'storage_device_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Archivo vacío pasado al punto final.`
  String get storage_file_empty {
    return Intl.message(
      'Archivo vacío pasado al punto final.',
      name: 'storage_file_empty',
      desc: '',
      args: [],
    );
  }

  /// `La extensión de archivo proporcionada no es compatible.`
  String get storage_file_type_unsupported {
    return Intl.message(
      'La extensión de archivo proporcionada no es compatible.',
      name: 'storage_file_type_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `El tamaño del archivo no es válido o supera el tamaño máximo permitido. Verifique el archivo o el valor de la variable de entorno _APP_STORAGE_LIMIT.`
  String get storage_invalid_file_size {
    return Intl.message(
      'El tamaño del archivo no es válido o supera el tamaño máximo permitido. Verifique el archivo o el valor de la variable de entorno _APP_STORAGE_LIMIT.',
      name: 'storage_invalid_file_size',
      desc: '',
      args: [],
    );
  }

  /// `El rango de contenido no es válido. Verifique el valor del encabezado Content-Range.`
  String get storage_invalid_content_range {
    return Intl.message(
      'El rango de contenido no es válido. Verifique el valor del encabezado Content-Range.',
      name: 'storage_invalid_content_range',
      desc: '',
      args: [],
    );
  }

  /// `La compilación con el ID solicitado se está compilando y no está lista para ejecutarse.`
  String get build_not_ready {
    return Intl.message(
      'La compilación con el ID solicitado se está compilando y no está lista para ejecutarse.',
      name: 'build_not_ready',
      desc: '',
      args: [],
    );
  }

  /// `La compilación con el ID solicitado ya está en curso. Espere antes de poder volver a intentarlo.`
  String get build_in_progress {
    return Intl.message(
      'La compilación con el ID solicitado ya está en curso. Espere antes de poder volver a intentarlo.',
      name: 'build_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Se ha alcanzado el número máximo de colecciones.`
  String get collection_limit_exceeded {
    return Intl.message(
      'Se ha alcanzado el número máximo de colecciones.',
      name: 'collection_limit_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `La estructura del documento no es válida. Asegúrese de que los atributos coincidan con la definición de la colección.`
  String get document_invalid_structure {
    return Intl.message(
      'La estructura del documento no es válida. Asegúrese de que los atributos coincidan con la definición de la colección.',
      name: 'document_invalid_structure',
      desc: '',
      args: [],
    );
  }

  /// `Falta la carga del documento.`
  String get document_missing_payload {
    return Intl.message(
      'Falta la carga del documento.',
      name: 'document_missing_payload',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el atributo requerido para el índice. Por favor, confirme que todos sus atributos están en eldisponibleestado.`
  String get attribute_unknown {
    return Intl.message(
      'No se pudo encontrar el atributo requerido para el índice. Por favor, confirme que todos sus atributos están en eldisponibleestado.',
      name: 'attribute_unknown',
      desc: '',
      args: [],
    );
  }

  /// `El atributo solicitado aún no esdisponible. Por favor, inténtelo de nuevo más tarde.`
  String get attribute_not_available {
    return Intl.message(
      'El atributo solicitado aún no esdisponible. Por favor, inténtelo de nuevo más tarde.',
      name: 'attribute_not_available',
      desc: '',
      args: [],
    );
  }

  /// `El formato de atributo solicitado no es compatible.`
  String get attribute_format_unsupported {
    return Intl.message(
      'El formato de atributo solicitado no es compatible.',
      name: 'attribute_format_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `Los valores predeterminados no se pueden establecer paraformaciónyrequeridoatributos`
  String get attribute_default_unsupported {
    return Intl.message(
      'Los valores predeterminados no se pueden establecer paraformaciónyrequeridoatributos',
      name: 'attribute_default_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `Se ha alcanzado el número máximo de atributos.`
  String get attribute_limit_exceeded {
    return Intl.message(
      'Se ha alcanzado el número máximo de atributos.',
      name: 'attribute_limit_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `El valor del atributo no es válido. Compruebe el tipo, el rango y el valor del atributo.`
  String get attribute_value_invalid {
    return Intl.message(
      'El valor del atributo no es válido. Compruebe el tipo, el rango y el valor del atributo.',
      name: 'attribute_value_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Se ha alcanzado el número máximo de índices.`
  String get index_limit_exceeded {
    return Intl.message(
      'Se ha alcanzado el número máximo de índices.',
      name: 'index_limit_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `Falta el ID del proyecto o no es válido. Compruebe el valor del encabezado X-Appwrite-Project para asegurarse de que se está utilizando el ID de proyecto correcto.`
  String get project_unknown {
    return Intl.message(
      'Falta el ID del proyecto o no es válido. Compruebe el valor del encabezado X-Appwrite-Project para asegurarse de que se está utilizando el ID de proyecto correcto.',
      name: 'project_unknown',
      desc: '',
      args: [],
    );
  }

  /// `URL de redirección no válida para el éxito de OAuth.`
  String get project_invalid_success_url {
    return Intl.message(
      'URL de redirección no válida para el éxito de OAuth.',
      name: 'project_invalid_success_url',
      desc: '',
      args: [],
    );
  }

  /// `URL de redirección no válida por falla de OAuth.`
  String get project_invalid_failure_url {
    return Intl.message(
      'URL de redirección no válida por falla de OAuth.',
      name: 'project_invalid_failure_url',
      desc: '',
      args: [],
    );
  }

  /// `El ID del proyecto está reservado. Elija otro ID de proyecto.`
  String get project_reserved_project {
    return Intl.message(
      'El ID del proyecto está reservado. Elija otro ID de proyecto.',
      name: 'project_reserved_project',
      desc: '',
      args: [],
    );
  }

  /// `El acceso a esta API está prohibido.`
  String get general_access_forbidden {
    return Intl.message(
      'El acceso a esta API está prohibido.',
      name: 'general_access_forbidden',
      desc: '',
      args: [],
    );
  }

  /// `El usuario actual o la clave de API no tiene los ámbitos necesarios para acceder al recurso solicitado.`
  String get general_unauthorized_scope {
    return Intl.message(
      'El usuario actual o la clave de API no tiene los ámbitos necesarios para acceder al recurso solicitado.',
      name: 'general_unauthorized_scope',
      desc: '',
      args: [],
    );
  }

  /// `El token JWT no es válido. Verifique el valor del encabezado X-Appwrite-JWT para asegurarse de que se esté utilizando el token correcto.`
  String get user_jwt_invalid {
    return Intl.message(
      'El token JWT no es válido. Verifique el valor del encabezado X-Appwrite-JWT para asegurarse de que se esté utilizando el token correcto.',
      name: 'user_jwt_invalid',
      desc: '',
      args: [],
    );
  }

  /// `El usuario actual ha sido bloqueado. Puede desbloquear al usuario desde la consola de Appwrite.`
  String get user_blocked {
    return Intl.message(
      'El usuario actual ha sido bloqueado. Puede desbloquear al usuario desde la consola de Appwrite.',
      name: 'user_blocked',
      desc: '',
      args: [],
    );
  }

  /// `Token no válido pasado en la solicitud.`
  String get user_invalid_token {
    return Intl.message(
      'Token no válido pasado en la solicitud.',
      name: 'user_invalid_token',
      desc: '',
      args: [],
    );
  }

  /// `El registro de la consola está restringido a correos electrónicos específicos. Póngase en contacto con su administrador para obtener más información.`
  String get user_email_not_whitelisted {
    return Intl.message(
      'El registro de la consola está restringido a correos electrónicos específicos. Póngase en contacto con su administrador para obtener más información.',
      name: 'user_email_not_whitelisted',
      desc: '',
      args: [],
    );
  }

  /// `El registro de la consola está restringido a direcciones IP específicas. Póngase en contacto con su administrador para obtener más información.`
  String get user_ip_not_whitelisted {
    return Intl.message(
      'El registro de la consola está restringido a direcciones IP específicas. Póngase en contacto con su administrador para obtener más información.',
      name: 'user_ip_not_whitelisted',
      desc: '',
      args: [],
    );
  }

  /// `Credenciales no válidas. Por favor, compruebe el correo electrónico y la contraseña.`
  String get user_invalid_credentials {
    return Intl.message(
      'Credenciales no válidas. Por favor, compruebe el correo electrónico y la contraseña.',
      name: 'user_invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `No se pueden crear usuarios anónimos para el proyecto de consola.`
  String get user_anonymous_console_prohibited {
    return Intl.message(
      'No se pueden crear usuarios anónimos para el proyecto de consola.',
      name: 'user_anonymous_console_prohibited',
      desc: '',
      args: [],
    );
  }

  /// `Está prohibida la creación de usuarios anónimos cuando una sesión está activa.`
  String get user_session_already_exists {
    return Intl.message(
      'Está prohibida la creación de usuarios anónimos cuando una sesión está activa.',
      name: 'user_session_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `El usuario actual no está autorizado para realizar la acción solicitada.`
  String get user_unauthorized {
    return Intl.message(
      'El usuario actual no está autorizado para realizar la acción solicitada.',
      name: 'user_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `El secreto de invitación del equipo no es válido.`
  String get team_invalid_secret {
    return Intl.message(
      'El secreto de invitación del equipo no es válido.',
      name: 'team_invalid_secret',
      desc: '',
      args: [],
    );
  }

  /// `La invitación no pertenece al usuario actual.`
  String get team_invite_mismatch {
    return Intl.message(
      'La invitación no pertenece al usuario actual.',
      name: 'team_invite_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `La clave del proyecto ha caducado. Genere una clave nueva mediante la consola de Appwrite.`
  String get project_key_expired {
    return Intl.message(
      'La clave del proyecto ha caducado. Genere una clave nueva mediante la consola de Appwrite.',
      name: 'project_key_expired',
      desc: '',
      args: [],
    );
  }

  /// `La verificación de dominio para el dominio solicitado ha fallado.`
  String get domain_verification_failed {
    return Intl.message(
      'La verificación de dominio para el dominio solicitado ha fallado.',
      name: 'domain_verification_failed',
      desc: '',
      args: [],
    );
  }

  /// `La solicitud se originó de un origen desconocido. Si confía en este dominio, inclúyalo como plataforma de confianza en la consola de Appwrite.`
  String get general_unknown_origin {
    return Intl.message(
      'La solicitud se originó de un origen desconocido. Si confía en este dominio, inclúyalo como plataforma de confianza en la consola de Appwrite.',
      name: 'general_unknown_origin',
      desc: '',
      args: [],
    );
  }

  /// `El archivo subido no es válido. Verifique el archivo y vuelva a intentarlo.`
  String get storage_invalid_file {
    return Intl.message(
      'El archivo subido no es válido. Verifique el archivo y vuelva a intentarlo.',
      name: 'storage_invalid_file',
      desc: '',
      args: [],
    );
  }

  /// `No se encontró la ruta solicitada. Consulte los documentos y vuelva a intentarlo.`
  String get general_route_not_found {
    return Intl.message(
      'No se encontró la ruta solicitada. Consulte los documentos y vuelva a intentarlo.',
      name: 'general_route_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el usuario con la ID solicitada.`
  String get user_not_found {
    return Intl.message(
      'No se pudo encontrar el usuario con la ID solicitada.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la sesión de usuario actual.`
  String get user_session_not_found {
    return Intl.message(
      'No se pudo encontrar la sesión de usuario actual.',
      name: 'user_session_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el equipo con la ID solicitada.`
  String get team_not_found {
    return Intl.message(
      'No se pudo encontrar el equipo con la ID solicitada.',
      name: 'team_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la invitación del equipo solicitado.`
  String get team_invite_not_found {
    return Intl.message(
      'No se pudo encontrar la invitación del equipo solicitado.',
      name: 'team_invite_not_found',
      desc: '',
      args: [],
    );
  }

  /// `La identificación de membresía no pertenece a la identificación del equipo.`
  String get team_membership_mismatch {
    return Intl.message(
      'La identificación de membresía no pertenece a la identificación del equipo.',
      name: 'team_membership_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la membresía con la identificación solicitada.`
  String get membership_not_found {
    return Intl.message(
      'No se pudo encontrar la membresía con la identificación solicitada.',
      name: 'membership_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el conjunto de avatar solicitado.`
  String get avatar_set_not_found {
    return Intl.message(
      'No se pudo encontrar el conjunto de avatar solicitado.',
      name: 'avatar_set_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el avatar de la solicitud.`
  String get avatar_not_found {
    return Intl.message(
      'No se pudo encontrar el avatar de la solicitud.',
      name: 'avatar_not_found',
      desc: '',
      args: [],
    );
  }

  /// `La imagen solicitada no se encontró en la URL.`
  String get avatar_image_not_found {
    return Intl.message(
      'La imagen solicitada no se encontró en la URL.',
      name: 'avatar_image_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo obtener el favicon de la URL solicitada.`
  String get avatar_remote_url_failed {
    return Intl.message(
      'No se pudo obtener el favicon de la URL solicitada.',
      name: 'avatar_remote_url_failed',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el favicon solicitado.`
  String get avatar_icon_not_found {
    return Intl.message(
      'No se pudo encontrar el favicon solicitado.',
      name: 'avatar_icon_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el archivo solicitado.`
  String get storage_file_not_found {
    return Intl.message(
      'No se pudo encontrar el archivo solicitado.',
      name: 'storage_file_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el depósito de almacenamiento con el ID solicitado.`
  String get storage_bucket_not_found {
    return Intl.message(
      'No se pudo encontrar el depósito de almacenamiento con el ID solicitado.',
      name: 'storage_bucket_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la función con el ID solicitado.`
  String get function_not_found {
    return Intl.message(
      'No se pudo encontrar la función con el ID solicitado.',
      name: 'function_not_found',
      desc: '',
      args: [],
    );
  }

  /// `El tiempo de ejecución solicitado está inactivo o no es compatible. Verifique el valor de la variable de entorno _APP_FUNCTIONS_RUNTIMES.`
  String get function_runtime_unsupported {
    return Intl.message(
      'El tiempo de ejecución solicitado está inactivo o no es compatible. Verifique el valor de la variable de entorno _APP_FUNCTIONS_RUNTIMES.',
      name: 'function_runtime_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la compilación con el ID solicitado.`
  String get build_not_found {
    return Intl.message(
      'No se pudo encontrar la compilación con el ID solicitado.',
      name: 'build_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la implementación con el ID solicitado.`
  String get deployment_not_found {
    return Intl.message(
      'No se pudo encontrar la implementación con el ID solicitado.',
      name: 'deployment_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la ejecución con el ID solicitado.`
  String get execution_not_found {
    return Intl.message(
      'No se pudo encontrar la ejecución con el ID solicitado.',
      name: 'execution_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Base de datos no encontrada`
  String get database_not_found {
    return Intl.message(
      'Base de datos no encontrada',
      name: 'database_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se ha podido encontrar la colección con el ID solicitado.`
  String get collection_not_found {
    return Intl.message(
      'No se ha podido encontrar la colección con el ID solicitado.',
      name: 'collection_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se ha podido encontrar el documento con el ID solicitado.`
  String get document_not_found {
    return Intl.message(
      'No se ha podido encontrar el documento con el ID solicitado.',
      name: 'document_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el atributo con el ID solicitado.`
  String get attribute_not_found {
    return Intl.message(
      'No se pudo encontrar el atributo con el ID solicitado.',
      name: 'attribute_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el índice con el ID solicitado.`
  String get index_not_found {
    return Intl.message(
      'No se pudo encontrar el índice con el ID solicitado.',
      name: 'index_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el proyecto con el ID solicitado. Compruebe el valor del encabezado X-Appwrite-Project para asegurarse de que se está utilizando el ID de proyecto correcto.`
  String get project_not_found {
    return Intl.message(
      'No se pudo encontrar el proyecto con el ID solicitado. Compruebe el valor del encabezado X-Appwrite-Project para asegurarse de que se está utilizando el ID de proyecto correcto.',
      name: 'project_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el webhook con el ID solicitado.`
  String get webhook_not_found {
    return Intl.message(
      'No se pudo encontrar el webhook con el ID solicitado.',
      name: 'webhook_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la clave con el ID solicitado.`
  String get key_not_found {
    return Intl.message(
      'No se pudo encontrar la clave con el ID solicitado.',
      name: 'key_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la plataforma con el ID solicitado.`
  String get platform_not_found {
    return Intl.message(
      'No se pudo encontrar la plataforma con el ID solicitado.',
      name: 'platform_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar el dominio con el ID solicitado.`
  String get domain_not_found {
    return Intl.message(
      'No se pudo encontrar el dominio con el ID solicitado.',
      name: 'domain_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo encontrar la variable con el ID solicitado.`
  String get variable_not_found {
    return Intl.message(
      'No se pudo encontrar la variable con el ID solicitado.',
      name: 'variable_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe un usuario con el mismo correo electrónico en su proyecto.`
  String get user_already_exists {
    return Intl.message(
      'Ya existe un usuario con el mismo correo electrónico en su proyecto.',
      name: 'user_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe un usuario con el mismo correo electrónico en el proyecto actual.`
  String get user_email_already_exists {
    return Intl.message(
      'Ya existe un usuario con el mismo correo electrónico en el proyecto actual.',
      name: 'user_email_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe un usuario con el mismo número de teléfono en el proyecto actual.`
  String get user_phone_already_exists {
    return Intl.message(
      'Ya existe un usuario con el mismo número de teléfono en el proyecto actual.',
      name: 'user_phone_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `El usuario ya ha sido invitado o ya es miembro de este equipo`
  String get team_invite_already_exists {
    return Intl.message(
      'El usuario ya ha sido invitado o ya es miembro de este equipo',
      name: 'team_invite_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Membresía ya confirmada`
  String get membership_already_confirmed {
    return Intl.message(
      'Membresía ya confirmada',
      name: 'membership_already_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe un depósito de almacenamiento con el ID solicitado.`
  String get storage_bucket_already_exists {
    return Intl.message(
      'Ya existe un depósito de almacenamiento con el ID solicitado.',
      name: 'storage_bucket_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `La base de datos ya existe`
  String get database_already_exists {
    return Intl.message(
      'La base de datos ya existe',
      name: 'database_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe una colección con el ID solicitado.`
  String get collection_already_exists {
    return Intl.message(
      'Ya existe una colección con el ID solicitado.',
      name: 'collection_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `El documento con el ID solicitado ya existe.`
  String get document_already_exists {
    return Intl.message(
      'El documento con el ID solicitado ya existe.',
      name: 'document_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `El atributo con el ID solicitado ya existe.`
  String get attribute_already_exists {
    return Intl.message(
      'El atributo con el ID solicitado ya existe.',
      name: 'attribute_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `El índice con el ID solicitado ya existe.`
  String get index_already_exists {
    return Intl.message(
      'El índice con el ID solicitado ya existe.',
      name: 'index_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe un Dominio con el ID solicitado.`
  String get domain_already_exists {
    return Intl.message(
      'Ya existe un Dominio con el ID solicitado.',
      name: 'domain_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Ya existe una variable con el mismo ID en su proyecto.`
  String get variable_already_exists {
    return Intl.message(
      'Ya existe una variable con el mismo ID en su proyecto.',
      name: 'variable_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `El usuario actual requiere un restablecimiento de contraseña.`
  String get user_password_reset_required {
    return Intl.message(
      'El usuario actual requiere un restablecimiento de contraseña.',
      name: 'user_password_reset_required',
      desc: '',
      args: [],
    );
  }

  /// `El proveedor de OAuth elegido está deshabilitado. Puede habilitar el proveedor de OAuth mediante la consola de Appwrite.`
  String get project_provider_disabled {
    return Intl.message(
      'El proveedor de OAuth elegido está deshabilitado. Puede habilitar el proveedor de OAuth mediante la consola de Appwrite.',
      name: 'project_provider_disabled',
      desc: '',
      args: [],
    );
  }

  /// `El rango solicitado no es satisfactorio. Compruebe el valor del encabezado Rango.`
  String get storage_invalid_range {
    return Intl.message(
      'El rango solicitado no es satisfactorio. Compruebe el valor del encabezado Rango.',
      name: 'storage_invalid_range',
      desc: '',
      args: [],
    );
  }

  /// `Se ha excedido el límite de velocidad para el extremo actual. Vuelva a intentarlo después de un tiempo.`
  String get general_rate_limit_exceeded {
    return Intl.message(
      'Se ha excedido el límite de velocidad para el extremo actual. Vuelva a intentarlo después de un tiempo.',
      name: 'general_rate_limit_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error desconocido. Consulte los registros para obtener más información.`
  String get general_unknown {
    return Intl.message(
      'Ha ocurrido un error desconocido. Consulte los registros para obtener más información.',
      name: 'general_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error interno del servidor.`
  String get general_server_error {
    return Intl.message(
      'Ocurrió un error interno del servidor.',
      name: 'general_server_error',
      desc: '',
      args: [],
    );
  }

  /// `La solicitud no se puede cumplir con el protocolo actual. Verifique el valor de la variable de entorno _APP_OPTIONS_FORCE_HTTPS.`
  String get general_protocol_unsupported {
    return Intl.message(
      'La solicitud no se puede cumplir con el protocolo actual. Verifique el valor de la variable de entorno _APP_OPTIONS_FORCE_HTTPS.',
      name: 'general_protocol_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `El proyecto actual ha superado el número máximo de usuarios. Verifique su límite de usuarios en la consola de Appwrite.`
  String get user_count_exceeded {
    return Intl.message(
      'El proyecto actual ha superado el número máximo de usuarios. Verifique su límite de usuarios en la consola de Appwrite.',
      name: 'user_count_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `El método de autenticación solicitado está deshabilitado o no es compatible. Verifique los métodos de autenticación admitidos en la consola de Appwrite.`
  String get user_auth_method_unsupported {
    return Intl.message(
      'El método de autenticación solicitado está deshabilitado o no es compatible. Verifique los métodos de autenticación admitidos en la consola de Appwrite.',
      name: 'user_auth_method_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `El proveedor de OAuth elegido no es compatible. Consulte los documentos para ver la lista completa de proveedores de OAuth admitidos.`
  String get project_provider_unsupported {
    return Intl.message(
      'El proveedor de OAuth elegido no es compatible. Consulte los documentos para ver la lista completa de proveedores de OAuth admitidos.',
      name: 'project_provider_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `El servicio solicitado está deshabilitado. Puede habilitar el servicio desde la consola de Appwrite.`
  String get general_service_disabled {
    return Intl.message(
      'El servicio solicitado está deshabilitado. Puede habilitar el servicio desde la consola de Appwrite.',
      name: 'general_service_disabled',
      desc: '',
      args: [],
    );
  }

  /// `SMTP está deshabilitado en su instancia de Appwrite. Puede obtener más información sobre cómo configurar SMTP en nuestros documentos.`
  String get general_smtp_disabled {
    return Intl.message(
      'SMTP está deshabilitado en su instancia de Appwrite. Puede obtener más información sobre cómo configurar SMTP en nuestros documentos.',
      name: 'general_smtp_disabled',
      desc: '',
      args: [],
    );
  }

  /// `El proveedor de telefonía no está configurado. Verifique la variable de entorno _APP_SMS_PROVIDER de su servidor Appwrite.`
  String get general_phone_disabled {
    return Intl.message(
      'El proveedor de telefonía no está configurado. Verifique la variable de entorno _APP_SMS_PROVIDER de su servidor Appwrite.',
      name: 'general_phone_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Error en cache`
  String get cache_error {
    return Intl.message(
      'Error en cache',
      name: 'cache_error',
      desc: '',
      args: [],
    );
  }

  /// `No tienes conexión a internet`
  String get no_internet_connection {
    return Intl.message(
      'No tienes conexión a internet',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Error no identificado`
  String get defaulT {
    return Intl.message(
      'Error no identificado',
      name: 'defaulT',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
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
