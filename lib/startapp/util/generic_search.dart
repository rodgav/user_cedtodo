class GenericSearch {
  String? name;
  String? field;

  GenericSearch({this.name, this.field});

  GenericSearch copyWith({String? name, String? field}) {
    return GenericSearch(
        name: name ?? this.name, field: field ?? this.field);
  }
}