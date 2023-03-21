import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';

import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(dynamic error, S s) {
    if (error is AppwriteException) {
      if (kDebugMode) {
        debugPrint('ErrorHandler.handle ${error.response}');
      }
      failure = _handleAppwriteError(error.code, error.type, s);
    } else {
      failure = DataSource.defaulT.getFailure(0, s);
    }
  }

  Failure _handleAppwriteError(int? code, String? type, S s) {
    final dataSource = dataSourceValues.map[type];
    return dataSource.getFailure(code ?? 0, s);
  }
}

extension DataSourceExtension on DataSource? {
  Failure getFailure(int code, S s) {
    switch (this) {
      case DataSource.general_mock:
        return Failure(code, s.general_mock);

      case DataSource.general_argument_invalid:
        return Failure(code, s.general_argument_invalid);

      case DataSource.general_query_limit_exceeded:
        return Failure(code, s.general_query_limit_exceeded);

      case DataSource.general_query_invalid:
        return Failure(code, s.general_query_invalid);

      case DataSource.general_cursor_not_found:
        return Failure(code, s.general_cursor_not_found);

      case DataSource.user_password_mismatch:
        return Failure(code, s.user_password_mismatch);

      case DataSource.user_phone_not_found:
        return Failure(code, s.user_phone_not_found);

      case DataSource.user_missing_id:
        return Failure(code, s.user_missing_id);

      case DataSource.storage_device_not_found:
        return Failure(code, s.storage_device_not_found);

      case DataSource.storage_file_empty:
        return Failure(code, s.storage_file_empty);

      case DataSource.storage_file_type_unsupported:
        return Failure(code, s.storage_file_type_unsupported);

      case DataSource.storage_invalid_file_size:
        return Failure(code, s.storage_invalid_file_size);

      case DataSource.storage_invalid_content_range:
        return Failure(code, s.storage_invalid_content_range);

      case DataSource.build_not_ready:
        return Failure(code, s.build_not_ready);

      case DataSource.build_in_progress:
        return Failure(code, s.build_in_progress);

      case DataSource.collection_limit_exceeded:
        return Failure(code, s.collection_limit_exceeded);

      case DataSource.document_invalid_structure:
        return Failure(code, s.document_invalid_structure);

      case DataSource.document_missing_payload:
        return Failure(code, s.document_missing_payload);

      case DataSource.attribute_unknown:
        return Failure(code, s.attribute_unknown);

      case DataSource.attribute_not_available:
        return Failure(code, s.attribute_not_available);

      case DataSource.attribute_format_unsupported:
        return Failure(code, s.attribute_format_unsupported);

      case DataSource.attribute_default_unsupported:
        return Failure(code, s.attribute_default_unsupported);

      case DataSource.attribute_limit_exceeded:
        return Failure(code, s.attribute_limit_exceeded);

      case DataSource.attribute_value_invalid:
        return Failure(code, s.attribute_value_invalid);

      case DataSource.index_limit_exceeded:
        return Failure(code, s.index_limit_exceeded);

      case DataSource.project_unknown:
        return Failure(code, s.project_unknown);

      case DataSource.project_invalid_success_url:
        return Failure(code, s.project_invalid_success_url);

      case DataSource.project_invalid_failure_url:
        return Failure(code, s.project_invalid_failure_url);

      case DataSource.project_reserved_project:
        return Failure(code, s.project_reserved_project);

      case DataSource.general_access_forbidden:
        return Failure(code, s.general_access_forbidden);

      case DataSource.general_unauthorized_scope:
        return Failure(code, s.general_unauthorized_scope);

      case DataSource.user_jwt_invalid:
        return Failure(code, s.user_jwt_invalid);

      case DataSource.user_blocked:
        return Failure(code, s.user_blocked);

      case DataSource.user_invalid_token:
        return Failure(code, s.user_invalid_token);

      case DataSource.user_email_not_whitelisted:
        return Failure(code, s.user_email_not_whitelisted);

      case DataSource.user_ip_not_whitelisted:
        return Failure(code, s.user_ip_not_whitelisted);

      case DataSource.user_invalid_credentials:
        return Failure(code, s.user_invalid_credentials);

      case DataSource.user_anonymous_console_prohibited:
        return Failure(code, s.user_anonymous_console_prohibited);

      case DataSource.user_session_already_exists:
        return Failure(code, s.user_session_already_exists);

      case DataSource.user_unauthorized:
        return Failure(code, s.user_unauthorized);

      case DataSource.team_invalid_secret:
        return Failure(code, s.team_invalid_secret);

      case DataSource.team_invite_mismatch:
        return Failure(code, s.team_invite_mismatch);

      case DataSource.project_key_expired:
        return Failure(code, s.project_key_expired);

      case DataSource.domain_verification_failed:
        return Failure(code, s.domain_verification_failed);

      case DataSource.general_unknown_origin:
        return Failure(code, s.general_unknown_origin);

      case DataSource.storage_invalid_file:
        return Failure(code, s.storage_invalid_file);

      case DataSource.general_route_not_found:
        return Failure(code, s.general_route_not_found);

      case DataSource.user_not_found:
        return Failure(code, s.user_not_found);

      case DataSource.user_session_not_found:
        return Failure(code, s.user_session_not_found);

      case DataSource.team_not_found:
        return Failure(code, s.team_not_found);

      case DataSource.team_invite_not_found:
        return Failure(code, s.team_invite_not_found);

      case DataSource.team_membership_mismatch:
        return Failure(code, s.team_membership_mismatch);

      case DataSource.membership_not_found:
        return Failure(code, s.membership_not_found);

      case DataSource.avatar_set_not_found:
        return Failure(code, s.avatar_set_not_found);

      case DataSource.avatar_not_found:
        return Failure(code, s.avatar_not_found);

      case DataSource.avatar_image_not_found:
        return Failure(code, s.avatar_image_not_found);

      case DataSource.avatar_remote_url_failed:
        return Failure(code, s.avatar_remote_url_failed);

      case DataSource.avatar_icon_not_found:
        return Failure(code, s.avatar_icon_not_found);

      case DataSource.storage_file_not_found:
        return Failure(code, s.storage_file_not_found);

      case DataSource.storage_bucket_not_found:
        return Failure(code, s.storage_bucket_not_found);

      case DataSource.function_not_found:
        return Failure(code, s.function_not_found);

      case DataSource.function_runtime_unsupported:
        return Failure(code, s.function_runtime_unsupported);

      case DataSource.build_not_found:
        return Failure(code, s.build_not_found);

      case DataSource.deployment_not_found:
        return Failure(code, s.deployment_not_found);

      case DataSource.execution_not_found:
        return Failure(code, s.execution_not_found);

      case DataSource.database_not_found:
        return Failure(code, s.database_not_found);

      case DataSource.collection_not_found:
        return Failure(code, s.collection_not_found);

      case DataSource.document_not_found:
        return Failure(code, s.document_not_found);

      case DataSource.attribute_not_found:
        return Failure(code, s.attribute_not_found);

      case DataSource.index_not_found:
        return Failure(code, s.index_not_found);

      case DataSource.project_not_found:
        return Failure(code, s.project_not_found);

      case DataSource.webhook_not_found:
        return Failure(code, s.webhook_not_found);

      case DataSource.key_not_found:
        return Failure(code, s.key_not_found);

      case DataSource.platform_not_found:
        return Failure(code, s.platform_not_found);

      case DataSource.domain_not_found:
        return Failure(code, s.domain_not_found);

      case DataSource.variable_not_found:
        return Failure(code, s.variable_not_found);

      case DataSource.user_already_exists:
        return Failure(code, s.user_already_exists);

      case DataSource.user_email_already_exists:
        return Failure(code, s.user_email_already_exists);

      case DataSource.user_phone_already_exists:
        return Failure(code, s.user_phone_already_exists);

      case DataSource.team_invite_already_exists:
        return Failure(code, s.team_invite_already_exists);

      case DataSource.membership_already_confirmed:
        return Failure(code, s.membership_already_confirmed);

      case DataSource.storage_bucket_already_exists:
        return Failure(code, s.storage_bucket_already_exists);

      case DataSource.database_already_exists:
        return Failure(code, s.database_already_exists);

      case DataSource.collection_already_exists:
        return Failure(code, s.collection_already_exists);

      case DataSource.document_already_exists:
        return Failure(code, s.document_already_exists);

      case DataSource.attribute_already_exists:
        return Failure(code, s.attribute_already_exists);

      case DataSource.index_already_exists:
        return Failure(code, s.index_already_exists);

      case DataSource.domain_already_exists:
        return Failure(code, s.domain_already_exists);

      case DataSource.variable_already_exists:
        return Failure(code, s.variable_already_exists);

      case DataSource.user_password_reset_required:
        return Failure(code, s.user_password_reset_required);

      case DataSource.project_provider_disabled:
        return Failure(code, s.project_provider_disabled);

      case DataSource.storage_invalid_range:
        return Failure(code, s.storage_invalid_range);

      case DataSource.general_rate_limit_exceeded:
        return Failure(code, s.general_rate_limit_exceeded);

      case DataSource.general_unknown:
        return Failure(code, s.general_unknown);

      case DataSource.general_server_error:
        return Failure(code, s.general_server_error);

      case DataSource.general_protocol_unsupported:
        return Failure(code, s.general_protocol_unsupported);

      case DataSource.user_count_exceeded:
        return Failure(code, s.user_count_exceeded);

      case DataSource.user_auth_method_unsupported:
        return Failure(code, s.user_auth_method_unsupported);

      case DataSource.project_provider_unsupported:
        return Failure(code, s.project_provider_unsupported);

      case DataSource.general_service_disabled:
        return Failure(code, s.general_service_disabled);

      case DataSource.general_smtp_disabled:
        return Failure(code, s.general_smtp_disabled);

      case DataSource.general_phone_disabled:
        return Failure(code, s.general_phone_disabled);

      case DataSource.cache_error:
        return Failure(code, s.cache_error);

      case DataSource.no_internet_connection:
        return Failure(code, s.no_internet_connection);
      case DataSource.defaulT:
        return Failure(code, s.defaulT);
      default:
        return Failure(code, s.defaulT);
    }
  }
}

enum DataSource {
  general_mock,
  general_argument_invalid,
  general_query_limit_exceeded,
  general_query_invalid,
  general_cursor_not_found,
  user_password_mismatch,
  user_phone_not_found,
  user_missing_id,
  storage_device_not_found,
  storage_file_empty,
  storage_file_type_unsupported,
  storage_invalid_file_size,
  storage_invalid_content_range,
  build_not_ready,
  build_in_progress,
  collection_limit_exceeded,
  document_invalid_structure,
  document_missing_payload,
  attribute_unknown,
  attribute_not_available,
  attribute_format_unsupported,
  attribute_default_unsupported,
  attribute_limit_exceeded,
  attribute_value_invalid,
  index_limit_exceeded,
  project_unknown,
  project_invalid_success_url,
  project_invalid_failure_url,
  project_reserved_project,
  general_access_forbidden,
  general_unauthorized_scope,
  user_jwt_invalid,
  user_blocked,
  user_invalid_token,
  user_email_not_whitelisted,
  user_ip_not_whitelisted,
  user_invalid_credentials,
  user_anonymous_console_prohibited,
  user_session_already_exists,
  user_unauthorized,
  team_invalid_secret,
  team_invite_mismatch,
  project_key_expired,
  domain_verification_failed,
  general_unknown_origin,
  storage_invalid_file,
  general_route_not_found,
  user_not_found,
  user_session_not_found,
  team_not_found,
  team_invite_not_found,
  team_membership_mismatch,
  membership_not_found,
  avatar_set_not_found,
  avatar_not_found,
  avatar_image_not_found,
  avatar_remote_url_failed,
  avatar_icon_not_found,
  storage_file_not_found,
  storage_bucket_not_found,
  function_not_found,
  function_runtime_unsupported,
  build_not_found,
  deployment_not_found,
  execution_not_found,
  database_not_found,
  collection_not_found,
  document_not_found,
  attribute_not_found,
  index_not_found,
  project_not_found,
  webhook_not_found,
  key_not_found,
  platform_not_found,
  domain_not_found,
  variable_not_found,
  user_already_exists,
  user_email_already_exists,
  user_phone_already_exists,
  team_invite_already_exists,
  membership_already_confirmed,
  storage_bucket_already_exists,
  database_already_exists,
  collection_already_exists,
  document_already_exists,
  attribute_already_exists,
  index_already_exists,
  domain_already_exists,
  variable_already_exists,
  user_password_reset_required,
  project_provider_disabled,
  storage_invalid_range,
  general_rate_limit_exceeded,
  general_unknown,
  general_server_error,
  general_protocol_unsupported,
  user_count_exceeded,
  user_auth_method_unsupported,
  project_provider_unsupported,
  general_service_disabled,
  general_smtp_disabled,
  general_phone_disabled,
  cache_error,
  no_internet_connection,
  defaulT
}

final dataSourceValues = EnumDataSourceValues({
  "general_mock": DataSource.general_mock,
  "general_argument_invalid": DataSource.general_argument_invalid,
  "general_query_limit_exceeded": DataSource.general_query_limit_exceeded,
  "general_query_invalid": DataSource.general_query_invalid,
  "general_cursor_not_found": DataSource.general_cursor_not_found,
  "user_password_mismatch": DataSource.user_password_mismatch,
  "user_phone_not_found": DataSource.user_phone_not_found,
  "user_missing_id": DataSource.user_missing_id,
  "storage_device_not_found": DataSource.storage_device_not_found,
  "storage_file_empty": DataSource.storage_file_empty,
  "storage_file_type_unsupported": DataSource.storage_file_type_unsupported,
  "storage_invalid_file_size": DataSource.storage_invalid_file_size,
  "storage_invalid_content_range": DataSource.storage_invalid_content_range,
  "build_not_ready": DataSource.build_not_ready,
  "build_in_progress": DataSource.build_in_progress,
  "collection_limit_exceeded": DataSource.collection_limit_exceeded,
  "document_invalid_structure": DataSource.document_invalid_structure,
  "document_missing_payload": DataSource.document_missing_payload,
  "attribute_unknown": DataSource.attribute_unknown,
  "attribute_not_available": DataSource.attribute_not_available,
  "attribute_format_unsupported": DataSource.attribute_format_unsupported,
  "attribute_default_unsupported": DataSource.attribute_default_unsupported,
  "attribute_limit_exceeded": DataSource.attribute_limit_exceeded,
  "attribute_value_invalid": DataSource.attribute_value_invalid,
  "index_limit_exceeded": DataSource.index_limit_exceeded,
  "project_unknown": DataSource.project_unknown,
  "project_invalid_success_url": DataSource.project_invalid_success_url,
  "project_invalid_failure_url": DataSource.project_invalid_failure_url,
  "project_reserved_project": DataSource.project_reserved_project,
  "general_access_forbidden": DataSource.general_access_forbidden,
  "general_unauthorized_scope": DataSource.general_unauthorized_scope,
  "user_jwt_invalid": DataSource.user_jwt_invalid,
  "user_blocked": DataSource.user_blocked,
  "user_invalid_token": DataSource.user_invalid_token,
  "user_email_not_whitelisted": DataSource.user_email_not_whitelisted,
  "user_ip_not_whitelisted": DataSource.user_ip_not_whitelisted,
  "user_invalid_credentials": DataSource.user_invalid_credentials,
  "user_anonymous_console_prohibited":
      DataSource.user_anonymous_console_prohibited,
  "user_session_already_exists": DataSource.user_session_already_exists,
  "user_unauthorized": DataSource.user_unauthorized,
  "team_invalid_secret": DataSource.team_invalid_secret,
  "team_invite_mismatch": DataSource.team_invite_mismatch,
  "project_key_expired": DataSource.project_key_expired,
  "domain_verification_failed": DataSource.domain_verification_failed,
  "general_unknown_origin": DataSource.general_unknown_origin,
  "storage_invalid_file": DataSource.storage_invalid_file,
  "general_route_not_found": DataSource.general_route_not_found,
  "user_not_found": DataSource.user_not_found,
  "user_session_not_found": DataSource.user_session_not_found,
  "team_not_found": DataSource.team_not_found,
  "team_invite_not_found": DataSource.team_invite_not_found,
  "team_membership_mismatch": DataSource.team_membership_mismatch,
  "membership_not_found": DataSource.membership_not_found,
  "avatar_set_not_found": DataSource.avatar_set_not_found,
  "avatar_not_found": DataSource.avatar_not_found,
  "avatar_image_not_found": DataSource.avatar_image_not_found,
  "avatar_remote_url_failed": DataSource.avatar_remote_url_failed,
  "avatar_icon_not_found": DataSource.avatar_icon_not_found,
  "storage_file_not_found": DataSource.storage_file_not_found,
  "storage_bucket_not_found": DataSource.storage_bucket_not_found,
  "function_not_found": DataSource.function_not_found,
  "function_runtime_unsupported": DataSource.function_runtime_unsupported,
  "build_not_found": DataSource.build_not_found,
  "deployment_not_found": DataSource.deployment_not_found,
  "execution_not_found": DataSource.execution_not_found,
  "database_not_found": DataSource.database_not_found,
  "collection_not_found": DataSource.collection_not_found,
  "document_not_found": DataSource.document_not_found,
  "attribute_not_found": DataSource.attribute_not_found,
  "index_not_found": DataSource.index_not_found,
  "project_not_found": DataSource.project_not_found,
  "webhook_not_found": DataSource.webhook_not_found,
  "key_not_found": DataSource.key_not_found,
  "platform_not_found": DataSource.platform_not_found,
  "domain_not_found": DataSource.domain_not_found,
  "variable_not_found": DataSource.variable_not_found,
  "user_already_exists": DataSource.user_already_exists,
  "user_email_already_exists": DataSource.user_email_already_exists,
  "user_phone_already_exists": DataSource.user_phone_already_exists,
  "team_invite_already_exists": DataSource.team_invite_already_exists,
  "membership_already_confirmed": DataSource.membership_already_confirmed,
  "storage_bucket_already_exists": DataSource.storage_bucket_already_exists,
  "database_already_exists": DataSource.database_already_exists,
  "collection_already_exists": DataSource.collection_already_exists,
  "document_already_exists": DataSource.document_already_exists,
  "attribute_already_exists": DataSource.attribute_already_exists,
  "index_already_exists": DataSource.index_already_exists,
  "domain_already_exists": DataSource.domain_already_exists,
  "variable_already_exists": DataSource.variable_already_exists,
  "user_password_reset_required": DataSource.user_password_reset_required,
  "project_provider_disabled": DataSource.project_provider_disabled,
  "storage_invalid_range": DataSource.storage_invalid_range,
  "general_rate_limit_exceeded": DataSource.general_rate_limit_exceeded,
  "general_unknown": DataSource.general_unknown,
  "general_server_error": DataSource.general_server_error,
  "general_protocol_unsupported": DataSource.general_protocol_unsupported,
  "user_count_exceeded": DataSource.user_count_exceeded,
  "user_auth_method_unsupported": DataSource.user_auth_method_unsupported,
  "project_provider_unsupported": DataSource.project_provider_unsupported,
  "general_service_disabled": DataSource.general_service_disabled,
  "general_smtp_disabled": DataSource.general_smtp_disabled,
  "general_phone_disabled": DataSource.general_phone_disabled
});

class EnumDataSourceValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumDataSourceValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
