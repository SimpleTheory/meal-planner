// import 'package:flutter/material.dart';
// import '../temp_dummy_data.dart';
// import '../utils/local_widgets.dart';
//
// class ShoppingListPage extends StatelessWidget {
//
//   const ShoppingListPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(diet.name)),
//       drawer: dietDrawer(diet, context),
//       body: Placeholder(),
//     );
//   }
// }
//
// // DragTarget with title on top
// // Draggable
//
// // Widget dragTarget(String title){
// //
// // }
//
// Widget draggable(String data) =>
//   LayoutBuilder(builder: (context, constraints)=>
//       Draggable<String>(
//           feedback: dragBody(data, drag: true),
//           childWhenDragging: dragBody(data, drag: true),
//           child: dragBody(data),
//       )
//   );
//
// Container dragBody( String data, {bool drag=false}){
//   return Container(
//       color: !drag ? Colors.green : const Color.fromRGBO(76, 175, 80, 33), // 76 175 80
//       padding: const EdgeInsets.all(8),
//       child: Text(data, style: TextStyle(color: !drag ? Colors.white : const Color.fromRGBO(255, 255, 255, 33)))
//   );
// }

import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/utils/local_widgets.dart';

import '../temp_dummy_data.dart';

class HorizontalExample extends StatefulWidget {
  const HorizontalExample({Key? key}) : super(key: key);

  @override
  State createState() => _HorizontalExample();
}

class InnerList {
  final String name;
  List<String> children;
  InnerList({required this.name, required this.children});
}

class _HorizontalExample extends State<HorizontalExample> {
  late List<InnerList> _lists;

  @override
  void initState() {
    super.initState();

    _lists = List.generate(9, (outerIndex) {
      return InnerList(
        name: outerIndex.toString(),
        children: List.generate(12, (innerIndex) => '$outerIndex.$innerIndex'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DietDrawer(diet),
      appBar: AppBar(
        title: const Text('Horizontal'),
      ),
      body: DragAndDropLists(
        children: List.generate(_lists.length, (index) => _buildList(index)),
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        axis: Axis.horizontal,
        listWidth: 150,
        listDraggingWidth: 150,
        listDecoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 3.0,
              blurRadius: 6.0,
              offset: Offset(2, 3),
            ),
          ],
        ),
        listPadding: const EdgeInsets.all(8.0),
      ),
    );
  }

  _buildList(int outerIndex) {
    var innerList = _lists[outerIndex];
    return DragAndDropList(
      header: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
                color: Colors.pink,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                'Header ${innerList.name}',
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
          ),
        ],
      ),
      footer: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(7.0)),
                color: Colors.pink,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                'Footer ${innerList.name}',
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
          ),
        ],
      ),
      leftSide: const VerticalDivider(
        color: Colors.pink,
        width: 1.5,
        thickness: 1.5,
      ),
      rightSide: const VerticalDivider(
        color: Colors.pink,
        width: 1.5,
        thickness: 1.5,
      ),
      children: List.generate(innerList.children.length,
              (index) => _buildItem(innerList.children[index])),
    );
  }

  _buildItem(String item) {
    return DragAndDropItem(
      child: ListTile(
        title: Text(item),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
      _lists[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _lists.removeAt(oldListIndex);
      _lists.insert(newListIndex, movedList);
    });
  }
}