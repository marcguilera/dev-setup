Iterable<T> toDistinct<T, S>(Iterable<T> iterable, S convert(T event)) {
  final map = Map<S, T>();
  iterable.forEach((value) => map[convert(value)] = value);
  return map.values;
}