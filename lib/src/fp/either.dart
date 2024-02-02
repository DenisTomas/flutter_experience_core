sealed class Either<L, R> {}

class Left<L, R> extends Either {
  final L value;
  Left(this.value);
}

class Right<L, R> extends Either {
  final R value;
  Right(this.value);
}
