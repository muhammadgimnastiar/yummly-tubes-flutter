// ignore_for_file: prefer_const_declarations

final String tableItems = 'Items';

class ItemField {
  static final String id = '_id';
  static final String item_name = 'item_name';
  static final String description = 'description';
  static final String available = 'available';
  static final String price_per_unit = 'price_per_unit';
  static final String unit_id = 'unit_id';
  static final String item_type_id = 'item_type_id';
  static final String fee = 'fee';
}

class Items {
  final int? id;
  final String? item_name;
  final String? description;
  final bool? available;
  final double? price_per_unit;
  final double? fee;
  final int? unit_id;
  final int? item_type_id;

  const Items(
      {this.id,
      this.available,
      this.description,
      this.fee,
      this.item_name,
      this.item_type_id,
      this.price_per_unit,
      this.unit_id});
}
