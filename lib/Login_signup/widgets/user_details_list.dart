import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserDetailsList extends StatefulWidget {
  _UserDetailsListState _animatedListSampleState = _UserDetailsListState();

  @override
  _UserDetailsListState createState() => _animatedListSampleState;

  void insert() {
    _animatedListSampleState.insert();
  }

  void remove() {
    _animatedListSampleState._remove();
  }
}

class _UserDetailsListState extends State<UserDetailsList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  ListModel<Map<String, Object>> _list;

  Map<dynamic, Object> _selectedItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<Map<String, Object>>(
      listKey: _listKey,
      initialItems: <Map<String, Object>>[
        {'title': 'Email', 'icon': Icons.mail_outline, 'obscure': false},
        {'title': 'Password', 'icon': Icons.lock_outline, 'obscure': true},
      ],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(Map<dynamic, Object> item, BuildContext context,
      Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      selected: false,
    );
  }

  // Insert the "name textfield" into the list model.
  void insert() {
    _list.insert(
      0,
      {'title': 'Name', 'icon': Icons.person_outline, 'obscure': false},
    );
  }

  // Remove the "name textfield" from the list model.
  void _remove() {
    _list.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: _buildItem,
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
        index,
        (BuildContext context, Animation<double> animation) =>
            removedItemBuilder(removedItem, context, animation),
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected = false})
      : assert(animation != null),
        assert(item != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final Map<dynamic, Object> item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline4;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 80.0,
            child: TextField(
              obscureText: item['obscure'],
              decoration: InputDecoration(
                  prefixIcon: Icon(item['icon']),
                  labelText: item['title'],
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true),
            ),
          ),
        ),
      ),
    );
  }
}
