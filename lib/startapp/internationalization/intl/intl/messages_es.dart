// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "attribute_already_exists": MessageLookupByLibrary.simpleMessage(
            "El atributo con el ID solicitado ya existe."),
        "attribute_default_unsupported": MessageLookupByLibrary.simpleMessage(
            "Los valores predeterminados no se pueden establecer paraformaciónyrequeridoatributos"),
        "attribute_format_unsupported": MessageLookupByLibrary.simpleMessage(
            "El formato de atributo solicitado no es compatible."),
        "attribute_limit_exceeded": MessageLookupByLibrary.simpleMessage(
            "Se ha alcanzado el número máximo de atributos."),
        "attribute_not_available": MessageLookupByLibrary.simpleMessage(
            "El atributo solicitado aún no esdisponible. Por favor, inténtelo de nuevo más tarde."),
        "attribute_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el atributo con el ID solicitado."),
        "attribute_unknown": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el atributo requerido para el índice. Por favor, confirme que todos sus atributos están en eldisponibleestado."),
        "attribute_value_invalid": MessageLookupByLibrary.simpleMessage(
            "El valor del atributo no es válido. Compruebe el tipo, el rango y el valor del atributo."),
        "avatar_icon_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el favicon solicitado."),
        "avatar_image_not_found": MessageLookupByLibrary.simpleMessage(
            "La imagen solicitada no se encontró en la URL."),
        "avatar_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el avatar de la solicitud."),
        "avatar_remote_url_failed": MessageLookupByLibrary.simpleMessage(
            "No se pudo obtener el favicon de la URL solicitada."),
        "avatar_set_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el conjunto de avatar solicitado."),
        "build_in_progress": MessageLookupByLibrary.simpleMessage(
            "La compilación con el ID solicitado ya está en curso. Espere antes de poder volver a intentarlo."),
        "build_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la compilación con el ID solicitado."),
        "build_not_ready": MessageLookupByLibrary.simpleMessage(
            "La compilación con el ID solicitado se está compilando y no está lista para ejecutarse."),
        "cache_error": MessageLookupByLibrary.simpleMessage("Error en cache"),
        "collection_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe una colección con el ID solicitado."),
        "collection_limit_exceeded": MessageLookupByLibrary.simpleMessage(
            "Se ha alcanzado el número máximo de colecciones."),
        "collection_not_found": MessageLookupByLibrary.simpleMessage(
            "No se ha podido encontrar la colección con el ID solicitado."),
        "database_already_exists":
            MessageLookupByLibrary.simpleMessage("La base de datos ya existe"),
        "database_not_found":
            MessageLookupByLibrary.simpleMessage("Base de datos no encontrada"),
        "defaulT":
            MessageLookupByLibrary.simpleMessage("Error no identificado"),
        "deployment_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la implementación con el ID solicitado."),
        "document_already_exists": MessageLookupByLibrary.simpleMessage(
            "El documento con el ID solicitado ya existe."),
        "document_invalid_structure": MessageLookupByLibrary.simpleMessage(
            "La estructura del documento no es válida. Asegúrese de que los atributos coincidan con la definición de la colección."),
        "document_missing_payload": MessageLookupByLibrary.simpleMessage(
            "Falta la carga del documento."),
        "document_not_found": MessageLookupByLibrary.simpleMessage(
            "No se ha podido encontrar el documento con el ID solicitado."),
        "domain_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe un Dominio con el ID solicitado."),
        "domain_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el dominio con el ID solicitado."),
        "domain_verification_failed": MessageLookupByLibrary.simpleMessage(
            "La verificación de dominio para el dominio solicitado ha fallado."),
        "execution_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la ejecución con el ID solicitado."),
        "function_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la función con el ID solicitado."),
        "function_runtime_unsupported": MessageLookupByLibrary.simpleMessage(
            "El tiempo de ejecución solicitado está inactivo o no es compatible. Verifique el valor de la variable de entorno _APP_FUNCTIONS_RUNTIMES."),
        "general_access_forbidden": MessageLookupByLibrary.simpleMessage(
            "El acceso a esta API está prohibido."),
        "general_argument_invalid": MessageLookupByLibrary.simpleMessage(
            "La solicitud contiene uno o más argumentos no válidos. Consulte la documentación del punto final."),
        "general_cursor_not_found": MessageLookupByLibrary.simpleMessage(
            "El cursor no es válido. Esto puede ocurrir si se ha eliminado el elemento representado por el cursor."),
        "general_mock": MessageLookupByLibrary.simpleMessage(
            "Errores generales lanzados por el controlador simulado utilizado para la prueba."),
        "general_phone_disabled": MessageLookupByLibrary.simpleMessage(
            "El proveedor de telefonía no está configurado. Verifique la variable de entorno _APP_SMS_PROVIDER de su servidor Appwrite."),
        "general_protocol_unsupported": MessageLookupByLibrary.simpleMessage(
            "La solicitud no se puede cumplir con el protocolo actual. Verifique el valor de la variable de entorno _APP_OPTIONS_FORCE_HTTPS."),
        "general_query_invalid": MessageLookupByLibrary.simpleMessage(
            "La sintaxis de la consulta no es válida. Verifique la consulta y vuelva a intentarlo."),
        "general_query_limit_exceeded": MessageLookupByLibrary.simpleMessage(
            "Se excedió el límite de consultas para el atributo actual. Está prohibido el uso de más de 100 valores de consulta en un solo atributo."),
        "general_rate_limit_exceeded": MessageLookupByLibrary.simpleMessage(
            "Se ha excedido el límite de velocidad para el extremo actual. Vuelva a intentarlo después de un tiempo."),
        "general_route_not_found": MessageLookupByLibrary.simpleMessage(
            "No se encontró la ruta solicitada. Consulte los documentos y vuelva a intentarlo."),
        "general_server_error": MessageLookupByLibrary.simpleMessage(
            "Ocurrió un error interno del servidor."),
        "general_service_disabled": MessageLookupByLibrary.simpleMessage(
            "El servicio solicitado está deshabilitado. Puede habilitar el servicio desde la consola de Appwrite."),
        "general_smtp_disabled": MessageLookupByLibrary.simpleMessage(
            "SMTP está deshabilitado en su instancia de Appwrite. Puede obtener más información sobre cómo configurar SMTP en nuestros documentos."),
        "general_unauthorized_scope": MessageLookupByLibrary.simpleMessage(
            "El usuario actual o la clave de API no tiene los ámbitos necesarios para acceder al recurso solicitado."),
        "general_unknown": MessageLookupByLibrary.simpleMessage(
            "Ha ocurrido un error desconocido. Consulte los registros para obtener más información."),
        "general_unknown_origin": MessageLookupByLibrary.simpleMessage(
            "La solicitud se originó de un origen desconocido. Si confía en este dominio, inclúyalo como plataforma de confianza en la consola de Appwrite."),
        "index_already_exists": MessageLookupByLibrary.simpleMessage(
            "El índice con el ID solicitado ya existe."),
        "index_limit_exceeded": MessageLookupByLibrary.simpleMessage(
            "Se ha alcanzado el número máximo de índices."),
        "index_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el índice con el ID solicitado."),
        "key_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la clave con el ID solicitado."),
        "membership_already_confirmed":
            MessageLookupByLibrary.simpleMessage("Membresía ya confirmada"),
        "membership_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la membresía con la identificación solicitada."),
        "no_internet_connection": MessageLookupByLibrary.simpleMessage(
            "No tienes conexión a internet"),
        "platform_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la plataforma con el ID solicitado."),
        "project_invalid_failure_url": MessageLookupByLibrary.simpleMessage(
            "URL de redirección no válida por falla de OAuth."),
        "project_invalid_success_url": MessageLookupByLibrary.simpleMessage(
            "URL de redirección no válida para el éxito de OAuth."),
        "project_key_expired": MessageLookupByLibrary.simpleMessage(
            "La clave del proyecto ha caducado. Genere una clave nueva mediante la consola de Appwrite."),
        "project_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el proyecto con el ID solicitado. Compruebe el valor del encabezado X-Appwrite-Project para asegurarse de que se está utilizando el ID de proyecto correcto."),
        "project_provider_disabled": MessageLookupByLibrary.simpleMessage(
            "El proveedor de OAuth elegido está deshabilitado. Puede habilitar el proveedor de OAuth mediante la consola de Appwrite."),
        "project_provider_unsupported": MessageLookupByLibrary.simpleMessage(
            "El proveedor de OAuth elegido no es compatible. Consulte los documentos para ver la lista completa de proveedores de OAuth admitidos."),
        "project_reserved_project": MessageLookupByLibrary.simpleMessage(
            "El ID del proyecto está reservado. Elija otro ID de proyecto."),
        "project_unknown": MessageLookupByLibrary.simpleMessage(
            "Falta el ID del proyecto o no es válido. Compruebe el valor del encabezado X-Appwrite-Project para asegurarse de que se está utilizando el ID de proyecto correcto."),
        "storage_bucket_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe un depósito de almacenamiento con el ID solicitado."),
        "storage_bucket_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el depósito de almacenamiento con el ID solicitado."),
        "storage_device_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el dispositivo de almacenamiento solicitado."),
        "storage_file_empty": MessageLookupByLibrary.simpleMessage(
            "Archivo vacío pasado al punto final."),
        "storage_file_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el archivo solicitado."),
        "storage_file_type_unsupported": MessageLookupByLibrary.simpleMessage(
            "La extensión de archivo proporcionada no es compatible."),
        "storage_invalid_content_range": MessageLookupByLibrary.simpleMessage(
            "El rango de contenido no es válido. Verifique el valor del encabezado Content-Range."),
        "storage_invalid_file": MessageLookupByLibrary.simpleMessage(
            "El archivo subido no es válido. Verifique el archivo y vuelva a intentarlo."),
        "storage_invalid_file_size": MessageLookupByLibrary.simpleMessage(
            "El tamaño del archivo no es válido o supera el tamaño máximo permitido. Verifique el archivo o el valor de la variable de entorno _APP_STORAGE_LIMIT."),
        "storage_invalid_range": MessageLookupByLibrary.simpleMessage(
            "El rango solicitado no es satisfactorio. Compruebe el valor del encabezado Rango."),
        "team_invalid_secret": MessageLookupByLibrary.simpleMessage(
            "El secreto de invitación del equipo no es válido."),
        "team_invite_already_exists": MessageLookupByLibrary.simpleMessage(
            "El usuario ya ha sido invitado o ya es miembro de este equipo"),
        "team_invite_mismatch": MessageLookupByLibrary.simpleMessage(
            "La invitación no pertenece al usuario actual."),
        "team_invite_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la invitación del equipo solicitado."),
        "team_membership_mismatch": MessageLookupByLibrary.simpleMessage(
            "La identificación de membresía no pertenece a la identificación del equipo."),
        "team_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el equipo con la ID solicitada."),
        "user_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe un usuario con el mismo correo electrónico en su proyecto."),
        "user_anonymous_console_prohibited": MessageLookupByLibrary.simpleMessage(
            "No se pueden crear usuarios anónimos para el proyecto de consola."),
        "user_auth_method_unsupported": MessageLookupByLibrary.simpleMessage(
            "El método de autenticación solicitado está deshabilitado o no es compatible. Verifique los métodos de autenticación admitidos en la consola de Appwrite."),
        "user_blocked": MessageLookupByLibrary.simpleMessage(
            "El usuario actual ha sido bloqueado. Puede desbloquear al usuario desde la consola de Appwrite."),
        "user_count_exceeded": MessageLookupByLibrary.simpleMessage(
            "El proyecto actual ha superado el número máximo de usuarios. Verifique su límite de usuarios en la consola de Appwrite."),
        "user_email_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe un usuario con el mismo correo electrónico en el proyecto actual."),
        "user_email_not_whitelisted": MessageLookupByLibrary.simpleMessage(
            "El registro de la consola está restringido a correos electrónicos específicos. Póngase en contacto con su administrador para obtener más información."),
        "user_invalid_credentials": MessageLookupByLibrary.simpleMessage(
            "Credenciales no válidas. Por favor, compruebe el correo electrónico y la contraseña."),
        "user_invalid_token": MessageLookupByLibrary.simpleMessage(
            "Token no válido pasado en la solicitud."),
        "user_ip_not_whitelisted": MessageLookupByLibrary.simpleMessage(
            "El registro de la consola está restringido a direcciones IP específicas. Póngase en contacto con su administrador para obtener más información."),
        "user_jwt_invalid": MessageLookupByLibrary.simpleMessage(
            "El token JWT no es válido. Verifique el valor del encabezado X-Appwrite-JWT para asegurarse de que se esté utilizando el token correcto."),
        "user_missing_id": MessageLookupByLibrary.simpleMessage(
            "Falta el ID del proveedor de OAuth2."),
        "user_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el usuario con la ID solicitada."),
        "user_password_mismatch": MessageLookupByLibrary.simpleMessage(
            "Las contraseñas no coinciden. Por favor verifique la contraseña y confirme la contraseña."),
        "user_password_reset_required": MessageLookupByLibrary.simpleMessage(
            "El usuario actual requiere un restablecimiento de contraseña."),
        "user_phone_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe un usuario con el mismo número de teléfono en el proyecto actual."),
        "user_phone_not_found": MessageLookupByLibrary.simpleMessage(
            "El usuario actual no tiene un número de teléfono asociado a su cuenta."),
        "user_session_already_exists": MessageLookupByLibrary.simpleMessage(
            "Está prohibida la creación de usuarios anónimos cuando una sesión está activa."),
        "user_session_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la sesión de usuario actual."),
        "user_unauthorized": MessageLookupByLibrary.simpleMessage(
            "El usuario actual no está autorizado para realizar la acción solicitada."),
        "variable_already_exists": MessageLookupByLibrary.simpleMessage(
            "Ya existe una variable con el mismo ID en su proyecto."),
        "variable_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar la variable con el ID solicitado."),
        "webhook_not_found": MessageLookupByLibrary.simpleMessage(
            "No se pudo encontrar el webhook con el ID solicitado.")
      };
}
