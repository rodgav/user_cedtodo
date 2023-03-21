import 'package:appwrite/appwrite.dart';
import 'package:user_cedtodo/startapp/data/network/constants.dart';

class AppwriteFactory {
  Client getClient() {
    return Client()
        .setEndpoint(Constants.apiEndPoint)
        .setProject(Constants.projectId)
        .setSelfSigned(status: true);
  }
}
