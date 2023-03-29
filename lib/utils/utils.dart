import 'package:ari_utils/ari_utils.dart';

E? sum<E>(Iterable<E> iter){
  if (iter.isEmpty){return null;}
  for (EnumListItem<E> enumListItem in enumerateList(iter.toList())) {
    if (enumListItem.index == 0){
      E adder = enumListItem.value;
      continue;
    }
    if (adder != null){
    adder = enumListItem.value + adder;}

  }
}