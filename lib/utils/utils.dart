
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
    T2 Function(T2 existingSameKeyValue, T2 newSameKeyValue) combinator){
  Map<T1, T2> result = {};
  for (E entry in list){
    T1 key = keyizer(entry);
    T2 value = valueizer(entry);
    if (result[key] == null){
      result[key] = value;
    }
    else{
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