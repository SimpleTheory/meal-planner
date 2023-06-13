import 'package:ari_utils/ari_utils.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/micro_blocs/shopping_list_bloc.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
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

// <editor-fold desc="Horribly Horribleness">
class StfulAttempt extends StatefulWidget {
  const StfulAttempt({Key? key}) : super(key: key);

  @override
  State<StfulAttempt> createState() => _StfulAttemptState();
}

class _StfulAttemptState extends State<StfulAttempt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      drawer: DietDrawer(context.read<ShoppingListBloc>().state.diet),
      body: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          // print('rebuild');
          // print(state.shoppingList);
          return DragAndDropLists(
            children: state.shoppingList
                .map((entry) => entryList(entry, context))
                .toList(),
            onItemReorder: (int oldItemIndex, int oldListIndex,
                int newItemIndex, int newListIndex) {
              context.read<ShoppingListBloc>().add(ReIndexItem(
                  oldItemIndex: oldItemIndex,
                  oldListIndex: oldListIndex,
                  newItemIndex: newItemIndex,
                  newListIndex: newListIndex));
              setState(() {});
            },
            onListReorder: (int oldListIndex, int newListIndex) {
              context
                  .read<ShoppingListBloc>()
                  .add(ReIndexList(oldListIndex, newListIndex));
              setState(() {});
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
                ]),
            listPadding: const EdgeInsets.all(8.0),
          );
        },
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
// </editor-fold>

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [SaveDietButton(context.read<ShoppingListBloc>().state.diet)],
      ),
      drawer: DietDrawer(context.read<ShoppingListBloc>().state.diet),
      bottomSheet: context.read<ShoppingListBloc>().state.selected.isEmpty
          ? null
          : const SendToBottomSheet(),
      body: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          return CustomScrollView(slivers: [
            DragAndDropLists(
              children: state.shoppingList
                  .map((entry) => entryList(entry, context))
                  .toList(),
              onItemReorder: (int oldItemIndex, int oldListIndex,
                  int newItemIndex, int newListIndex) {
                context.read<ShoppingListBloc>().add(ReIndexItem(
                    oldItemIndex: oldItemIndex,
                    oldListIndex: oldListIndex,
                    newItemIndex: newItemIndex,
                    newListIndex: newListIndex));
              },
              onListReorder: (int oldListIndex, int newListIndex) {
                context
                    .read<ShoppingListBloc>()
                    .add(ReIndexList(oldListIndex, newListIndex));
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
                  ]),
              listPadding: const EdgeInsets.all(8.0),
              sliverList: true,
              scrollController: ScrollController(),
            ),
          ]);
        },
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

DragAndDropList entryList(
    MapEntry<String, List<MealComponent>> entry, BuildContext context) {
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
            child: Row(
              children: [
                Text(
                  entry.key,
                  style: Theme.of(context).primaryTextTheme.titleLarge,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(' - '),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: MatchingIcon(entry.key),
                )
              ],
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
      thickness: 1.5,
    ),
    children: entry.value.map((e) => buildItem(e, context)).toList(),
  );
}

DragAndDropItem buildItem(MealComponent data, BuildContext context) {
  print('building ${data.name}');
  return DragAndDropItem(
      child: ListTile(
    title: Text(data.name),
    subtitle: Text(
      '${data.grams}g',
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
    leading: GetImage(
      data.reference.photo,
      height: 100,
      width: 65,
      cW: 100,
      cH: 100,
      cache: true,
    ),
    selected: context.read<ShoppingListBloc>().state.selected.contains(data),
    onTap: () {
      context.read<ShoppingListBloc>().add(SelectItem(data));
    },
    // shape: const BeveledRectangleBorder(
    //     side: BorderSide(
    //         color: Color.fromRGBO(150, 150, 150, 80),
    //         width: 1
    //     )
    // ),
  ));
}

class MatchingIcon extends StatelessWidget {
  final String text;

  const MatchingIcon(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (text) {
      case 'Good':
        return const Icon(Icons.check);
      case 'Running Low':
        return const Icon(Icons.directions_run);
      case 'Out of Stock':
        return const Icon(Icons.shopping_cart);
      case 'On the Way':
        return const Icon(Icons.airplane_ticket_outlined);
      default:
        return const Icon(Icons.safety_check);
    }
  }
}

class SendToBottomSheet extends StatelessWidget {
  const SendToBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ShoppingListBloc>();
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                bloc.add(SendSelectedItems('Good'));
              },
              icon: const Icon(Icons.check)),
          IconButton(
              onPressed: () {
                bloc.add(SendSelectedItems('Running Low'));
              },
              icon: const Icon(Icons.directions_run)),
          IconButton(
            onPressed: () {
              bloc.add(SendSelectedItems('Out of Stock'));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
              onPressed: () {
                bloc.add(SendSelectedItems('On the Way'));
              },
              icon: const Icon(Icons.airplane_ticket_outlined)),
          IconButton(
              onPressed: () {
                bloc.add(ClearSelectedItems());
              },
              icon: const Icon(Icons.clear_all)),
        ],
      ),
    );
  }
}

// </editor-fold>

// <editor-fold desc="Redesign">
class RedesignShoppingPage extends StatelessWidget {
  const RedesignShoppingPage({super.key});


  List<CategoryExpansions> _makeChildren(
      List<MapEntry<String, List<MealComponent>>> shoppingList) {
    List<CategoryExpansions> result = [];
    for (EnumListItem<MapEntry<String, List<MealComponent>>> index_entry
        in enumerateList(shoppingList)) {
      result.add(CategoryExpansions(
        name: index_entry.v.key,
        items: index_entry.v.value,
        index: index_entry.i,
        key: Key('CategoryExpansions: ${index_entry.i}'),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping List'),
          actions: [
            SaveDietButton(context.read<ShoppingListBloc>().state.diet)
          ],
        ),
        drawer: DietDrawer(context.read<ShoppingListBloc>().state.diet),
        bottomSheet: context.read<ShoppingListBloc>().state.selected.isEmpty
            ? null
            : const SendToBottomSheet(),
        body: BlocBuilder<ShoppingListBloc, ShoppingListState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [SliverReorderableList(
                onReorder: (int oldIndex, int newIndex) {
                  context
                      .read<ShoppingListBloc>()
                      .add(ReIndexList(oldIndex, newIndex));
                },
                itemBuilder: (context, index) => CategoryExpansions(
                  name: state.shoppingList[index].key,
                  items: state.shoppingList[index].value,
                  index: index,
                  key: Key('CategoryExpansions: $index'),
                ),
                itemCount: state.shoppingList.length,
              ),]
            );
          },
        ));
  }
}

class CategoryExpansions extends StatelessWidget {
  final int index;
  final String name;
  final List<MealComponent> items;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: MatchingIcon(name),
      title: Center(child: Text(name)),
      children: [
        CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverReorderableList(
              itemBuilder: (context, index) => KeepAlive(
                  keepAlive: true,
                  child: ShoppingItem(
                    items[index],
                    key: ValueKey<MealComponent>(items[index]),
                  )),
              itemCount: items.length,
              onReorder: (int oldIndex, int newIndex) {
                context.read<ShoppingListBloc>().add(ReorderWithinList(
                    listIndex: index, oldIndex: oldIndex, newIndex: newIndex));
              },
            )
          ],
        )
      ],
    );
  }

  // <editor-fold desc="Construction">
  const CategoryExpansions(
      {required this.name,
      required this.items,
      required this.index,
      super.key});

  factory CategoryExpansions.entry(
          MapEntry<String, List<MealComponent>> entry, int index) =>
      CategoryExpansions(name: entry.key, items: entry.value, index: index);
// </editor-fold>
}

class CategoryExpansionsStful extends StatefulWidget {
  final int index;
  final String name;
  final List<MealComponent> items;


  // <editor-fold desc="Construction">
  const CategoryExpansionsStful(
      {required this.name,
        required this.items,
        required this.index,
        super.key});

  factory CategoryExpansionsStful.entry(
      MapEntry<String, List<MealComponent>> entry, int index) =>
      CategoryExpansionsStful(name: entry.key, items: entry.value, index: index);
// </editor-fold>

  @override
  State<CategoryExpansionsStful> createState() => _CategoryExpansionsStfulState();
}

class _CategoryExpansionsStfulState extends State<CategoryExpansionsStful> with AutomaticKeepAliveClientMixin {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!_isExpanded) {
      return ListTile(
        leading: MatchingIcon(widget.name),
        title: Center(child: Text(widget.name)),
        trailing: Transform.flip(
            flipY: _isExpanded, child: const Icon(Icons.expand_more)),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        // children: [
        //   CustomScrollView(
        //     physics: const ClampingScrollPhysics(),
        //     slivers: [
        //       SliverReorderableList(
        //         itemBuilder: (context, index) => KeepAlive(
        //             keepAlive: true,
        //             child: ShoppingItem(
        //               items[index],
        //               key: ValueKey<MealComponent>(items[index]),
        //             )),
        //         itemCount: items.length,
        //         onReorder: (int oldIndex, int newIndex) {
        //           context.read<ShoppingListBloc>().add(ReorderWithinList(
        //               listIndex: index, oldIndex: oldIndex, newIndex: newIndex));
        //         },
        //       )
        //     ],
        //   )
        // ],
      );
    }
    else {
      // TODO
      return Placeholder();
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


// class ShoppingItem extends StatelessWidget {
//   final MealComponent mc;
//
//   const ShoppingItem(this.mc, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
class ShoppingItem extends StatefulWidget {
  final MealComponent mc;

  const ShoppingItem(this.mc, {super.key});

  @override
  State<StatefulWidget> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      title: Text(widget.mc.name),
      subtitle: Text(
        '${widget.mc.grams}g',
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      leading: GetImage(
        widget.mc.reference.photo,
        height: 100,
        width: 65,
        cW: 100,
        cH: 100,
        cache: true,
      ),
      selected:
          context.read<ShoppingListBloc>().state.selected.contains(widget.mc),
      onTap: () {
        context.read<ShoppingListBloc>().add(SelectItem(widget.mc));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// </editor-fold>

/// DragAndDropLists
///   [DragAndDropList]
///     [DragAndDropItem]
