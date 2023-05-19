import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import '../temp_dummy_data.dart';
import 'package:nutrition_app/domain.dart';

// // <editor-fold desc="Horz Example">
//
// class HorizontalExample extends StatefulWidget {
//   const HorizontalExample({Key? key}) : super(key: key);
//
//   @override
//   State createState() => _HorizontalExample();
// }
//
// class InnerList {
//   final String name;
//   List<String> children;
//   InnerList({required this.name, required this.children});
// }
//
// class _HorizontalExample extends State<HorizontalExample> {
//   late List<InnerList> _lists;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _lists = List.generate(9, (outerIndex) {
//       return InnerList(
//         name: outerIndex.toString(),
//         children: List.generate(12, (innerIndex) => '$outerIndex.$innerIndex'),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: DietDrawer(diet),
//       appBar: AppBar(
//         title: const Text('Shopping List'),
//       ),
//       body: DragAndDropLists(
//         children: List.generate(_lists.length, (index) => _buildList(index)),
//         onItemReorder: _onItemReorder,
//         onListReorder: _onListReorder,
//         axis: Axis.horizontal,
//         listWidth: 150,
//         listDraggingWidth: 150,
//         listDecoration: const BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.all(Radius.circular(7.0)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.black45,
//               spreadRadius: 3.0,
//               blurRadius: 6.0,
//               offset: Offset(2, 3),
//             ),
//           ],
//         ),
//         listPadding: const EdgeInsets.all(8.0),
//       ),
//     );
//   }
//
//   _buildList(int outerIndex) {
//     var innerList = _lists[outerIndex];
//     return DragAndDropList(
//       header: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
//                 color: Colors.pink,
//               ),
//               padding: const EdgeInsets.all(10),
//               child: Text(
//                 'Header ${innerList.name}',
//                 style: Theme.of(context).primaryTextTheme.titleLarge,
//               ),
//             ),
//           ),
//         ],
//       ),
//       footer: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius:
//                 BorderRadius.vertical(bottom: Radius.circular(7.0)),
//                 color: Colors.pink,
//               ),
//               padding: const EdgeInsets.all(10),
//               child: Text(
//                 'Footer ${innerList.name}',
//                 style: Theme.of(context).primaryTextTheme.titleLarge,
//               ),
//             ),
//           ),
//         ],
//       ),
//       leftSide: const VerticalDivider(
//         color: Colors.pink,
//         width: 1.5,
//         thickness: 1.5,
//       ),
//       rightSide: const VerticalDivider(
//         color: Colors.pink,
//         width: 1.5,
//         thickness: 1.5,
//       ),
//       children: List.generate(innerList.children.length,
//               (index) => _buildItem(innerList.children[index])),
//     );
//   }
//
//   _buildItem(String item) {
//     return DragAndDropItem(
//       child: ListTile(
//         title: Text(item),
//       ),
//     );
//   }
//
//   _onItemReorder(
//       int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
//     setState(() {
//       var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
//       _lists[newListIndex].children.insert(newItemIndex, movedItem);
//     });
//   }
//
//   _onListReorder(int oldListIndex, int newListIndex) {
//     setState(() {
//       var movedList = _lists.removeAt(oldListIndex);
//       _lists.insert(newListIndex, movedList);
//     });
//   }
// }
// // </editor-fold>

// <editor-fold desc="Attempt">

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List'),),
      drawer: DietDrawer(diet),
    body: DragAndDropLists(
      children: diet.shoppingList.entries.map((entry) => entryList(entry, context)).toList(),
      onItemReorder: (int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
        // var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
        // _lists[newListIndex].children.insert(newItemIndex, movedItem);
      },
      onListReorder: (int oldListIndex, int newListIndex) {
        // var movedList = _lists.removeAt(oldListIndex);
        // _lists.insert(newListIndex, movedList);
      },
      // axis: Axis.horizontal,
      listWidth: 150,
      listDraggingWidth: 150,
      listDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 3.0,
              blurRadius: 6.0,
              offset: Offset(2, 3),
            ),
          ]
      ),
      listPadding: const EdgeInsets.all(8.0),
    ),
    //   body: InteractiveViewer(
    //     panEnabled: false,
    //     minScale: .001,
    //     maxScale: 2,
    //     boundaryMargin: const EdgeInsets.all(80),
    //     child: DragAndDropLists(
    //       children: diet.shoppingList.entries.map((entry) => entryList(entry, context)).toList(),
    //       onItemReorder: (int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    //           // var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
    //           // _lists[newListIndex].children.insert(newItemIndex, movedItem);
    //       },
    //       onListReorder: (int oldListIndex, int newListIndex) {
    //         // var movedList = _lists.removeAt(oldListIndex);
    //         // _lists.insert(newListIndex, movedList);
    // },
    //       axis: Axis.horizontal,
    //       listWidth: 150,
    //       listDraggingWidth: 150,
    //       listDecoration: BoxDecoration(
    //         color: Theme.of(context).primaryColor,
    //         borderRadius: const BorderRadius.all(Radius.circular(7.0)),
    //         boxShadow: const <BoxShadow>[
    //           BoxShadow(
    //             color: Colors.black45,
    //             spreadRadius: 3.0,
    //             blurRadius: 6.0,
    //             offset: Offset(2, 3),
    //           ),
    //         ]
    //       ),
    //       listPadding: const EdgeInsets.all(8.0),
    //     ),
    //   )
    );
  }
}

DragAndDropList entryList(MapEntry<String, List<MealComponent>> entry, BuildContext context){
  return DragAndDropList(
    header: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
              color: Colors.green,
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              entry.key,
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
        ),
      ],
    ),
    // footer: Row(
    //   children: <Widget>[
    //     Expanded(
    //       child: Container(
    //         decoration: const BoxDecoration(
    //           borderRadius:
    //           BorderRadius.vertical(bottom: Radius.circular(7.0)),
    //           color: Colors.pink,
    //         ),
    //         padding: const EdgeInsets.all(10),
    //         child: Text(
    //           'Footer ${innerList.name}',
    //           style: Theme.of(context).primaryTextTheme.headline6,
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    leftSide: const VerticalDivider(
      color: Colors.green,
      width: 1.5,
      thickness: 1.5,
    ),
    rightSide: const VerticalDivider(
      color: Colors.green,
      width: 1.5,
      thickness: 1.5,
    ),
    footer: const Divider(
      color: Colors.green,
      height: 1.5,
      thickness: 1.5,),
    children: entry.value.map((e) => buildItem(e)).toList(),
  );
}
DragAndDropItem buildItem(MealComponent data) =>
    DragAndDropItem(
        child: ListTile(
            title: Text('${data.name} ${data.grams}g'),
            // shape: const BeveledRectangleBorder(
            //     side: BorderSide(
            //         color: Color.fromRGBO(150, 150, 150, 80),
            //         width: 1
            //     )
            // ),
        )
    );
// </editor-fold>

/// DragAndDropLists
///   [DragAndDropList]
///     [DragAndDropItem]