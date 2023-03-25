class BaseIdsModel {
  final String collectionId;
  final String databaseId;
  final DateTime createdAt;
  final DateTime updatedAt;

  BaseIdsModel(
      {required this.collectionId,
      required this.databaseId,
      required this.createdAt,
      required this.updatedAt});
}

class BaseTotalModel {
  final int total;

  BaseTotalModel({required this.total});
}
