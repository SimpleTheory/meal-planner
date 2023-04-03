class APIError implements Exception {
  final String message;

  APIError(this.message);

  @override
  String toString() {
    return "APIError: $message";
  }
}
class InvalidKey extends APIError{
  InvalidKey(super.message);
}
class FoodNotFound extends APIError{
  FoodNotFound(super.message);
}

// TODO create function that properly raises error according to the situation for API calls.