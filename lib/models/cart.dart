import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  late CatalogModel _cataog;

  final List<int> _itemIds = [];
  CatalogModel get catalog => _cataog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _cataog = newCatalog;
  }

  //get items in the cart:

  List<Item> get items => _itemIds.map((id) => _cataog.getByid(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
  // add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
