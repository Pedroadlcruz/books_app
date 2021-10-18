class QueryBooksFailure implements Exception {
  const QueryBooksFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error message.
  final String message;
}
