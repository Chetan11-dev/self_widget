List<A> filter<A>(List<A> l, bool Function(A) f) {
  List<A> r = [];
  l.forEach((i) {
    if (f(i)) r.add(i);
  });
  return r;
}
