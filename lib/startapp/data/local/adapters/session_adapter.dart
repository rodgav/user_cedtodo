import 'package:hive_flutter/hive_flutter.dart';
import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/startapp/application/constants.dart';

part 'session_adapter.g.dart';

@HiveType(typeId: Constants.sessionCacheAdapterTypeId)
class SessionCacheAdapter extends HiveObject {
  @HiveField(0)
  models.Session session;
  @HiveField(1)
  DateTime dateTime;

  SessionCacheAdapter({required this.session, required this.dateTime});
}

class SessionAdapter extends TypeAdapter<models.Session> {
  @override
  models.Session read(BinaryReader reader) {
    final map = reader.readMap();
    return models.Session(
      $id: map['\$id'].toString(),
      $createdAt: map['\$createdAt'].toString(),
      userId: map['userId'].toString(),
      expire: map['expire'].toString(),
      provider: map['provider'].toString(),
      providerUid: map['providerUid'].toString(),
      providerAccessToken: map['providerAccessToken'].toString(),
      providerAccessTokenExpiry: map['providerAccessTokenExpiry'].toString(),
      providerRefreshToken: map['providerRefreshToken'].toString(),
      ip: map['ip'].toString(),
      osCode: map['osCode'].toString(),
      osName: map['osName'].toString(),
      osVersion: map['osVersion'].toString(),
      clientType: map['clientType'].toString(),
      clientCode: map['clientCode'].toString(),
      clientName: map['clientName'].toString(),
      clientVersion: map['clientVersion'].toString(),
      clientEngine: map['clientEngine'].toString(),
      clientEngineVersion: map['clientEngineVersion'].toString(),
      deviceName: map['deviceName'].toString(),
      deviceBrand: map['deviceBrand'].toString(),
      deviceModel: map['deviceModel'].toString(),
      countryCode: map['countryCode'].toString(),
      countryName: map['countryName'].toString(),
      current: map['current'],
    );
  }

  @override
  int get typeId => Constants.sessionAdapterTypeId;

  @override
  void write(BinaryWriter writer, models.Session obj) {
    writer.writeMap({
      "\$id": obj.$id,
      "\$createdAt": obj.$createdAt,
      "userId": obj.userId,
      "expire": obj.expire,
      "provider": obj.provider,
      "providerUid": obj.providerUid,
      "providerAccessToken": obj.providerAccessToken,
      "providerAccessTokenExpiry": obj.providerAccessTokenExpiry,
      "providerRefreshToken": obj.providerRefreshToken,
      "ip": obj.ip,
      "osCode": obj.osCode,
      "osName": obj.osName,
      "osVersion": obj.osVersion,
      "clientType": obj.clientType,
      "clientCode": obj.clientCode,
      "clientName": obj.clientName,
      "clientVersion": obj.clientVersion,
      "clientEngine": obj.clientEngine,
      "clientEngineVersion": obj.clientEngineVersion,
      "deviceName": obj.deviceName,
      "deviceBrand": obj.deviceBrand,
      "deviceModel": obj.deviceModel,
      "countryCode": obj.countryCode,
      "countryName": obj.countryName,
      "current": obj.current,
    });
  }
}
