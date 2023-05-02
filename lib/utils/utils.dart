import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

/// List: List to combine elements of
/// Keyizer: Function to get key from an element of the list.
///
/// Valueizer: Function to get map's value from an element of a list relative
/// its key from keyizer.
///
/// Combinator: Function to combine derived values of two list elements whose
/// keyizer function returned the same key.
///
/// Example use case
/// ```dart
/// class Wallet{
///   owner string;
///   value int;
///   Wallet(this.owner, this.string)
/// }
///
/// List<Wallet> wallets = [
///   Wallet('A', 1),
///   Wallet('A', 1),
///   Wallet('A', 1),
///   Wallet('B', 1),
///   Wallet('B', 1),
///   Wallet('B', 1)
///   ];
///
/// // Generics wont show in code example but are (in order): Wallet, String, int
///
/// combineListValuesToMap<Wallet, String, int>(
///   wallets,
///   (Wallet elemToKey) => elemToKey.owner,
///   (Wallet elemToValue) => elemToValue.value,
///   (int existingSameKeyValue, int newSameKeyValue) => existingSameKeyValue + newSameKeyValue
/// )
/// // The above Returns {'A': 3, 'B': 3}
/// ```
Map<T1, T2> combineListValuesToMap<E, T1, T2>
    (List<E> list,
    T1 Function(E elemToKey) keyizer,
    T2 Function(E elemToValue) valueizer,
    T2 Function(T2 existingSameKeyValue, T2 newSameKeyValue) combinator) {
  Map<T1, T2> result = {};
  for (E entry in list) {
    T1 key = keyizer(entry);
    T2 value = valueizer(entry);
    if (result[key] == null) {
      result[key] = value;
    }
    else {
      result[key] = combinator(result[key] as T2, value);
    }
  }
  return result;
}

Iterable<T> flatten<T>(Iterable<dynamic> iterable) sync* {
  for (final element in iterable) {
    if (element is Iterable<dynamic>) {
      yield* flatten<T>(element);
    } else {
      yield element as T;
    }
  }
}

bool isMobile() => Platform.isAndroid || Platform.isIOS;

extension ColumnPadding on Column{
  Column pad(EdgeInsetsGeometry padding) =>
      Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        children: children.map((e) => Padding(padding: padding, child: e)).toList(),
      );
}

List<Padding> padWidgets(List<Widget> widgets, EdgeInsetsGeometry padding)=>
    widgets.map((e) => Padding(padding: padding, child: e)).toList();

extension RowPadding on Row{
  Row pad(EdgeInsetsGeometry padding) =>
      Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textBaseline: textBaseline,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        children: children.map((e) => Padding(padding: padding, child: e)).toList(),
      );
}

// TODO ADD ERRORS
Image getImage(Uri? uri, {double? width, double? height}){
  if (uri == null){
    return Image.file(File('cache/images/null.png'), width: width, height: height,);
  }
  // try{
  if (uri.scheme == 'file'){
    return Image.file(File(uri.path), width: width, height: height,);
    }
  else{
    return Image.network(uri.toString(), width: width, height: height,);
    }
  // } catch{}
}
final emoji = EmojiParser();
final olive = emoji.get('olive').code;
final butter = emoji.get('butter').code;