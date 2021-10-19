/// Thrown if during the load books process if a failure occurs.
class QueryBooksFailure implements Exception {
  const QueryBooksFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error message.
  final String message;
}
