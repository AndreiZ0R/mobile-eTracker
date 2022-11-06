class ItemModel {
  final int id;
  final String name;
  final String description;
  final String createdAt; //created_at
  final String lastRevised; //last_revised
  final int revisionInterval; //days revision_interval
  final String location;

  const ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.lastRevised,
    required this.revisionInterval,
    required this.location,
  });




}