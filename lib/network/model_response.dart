/*
* Developer: Abubakar Abdullahi
* Date: 16/07/2022
*/
abstract class Result<T> {
}

class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

class Error<T> extends Result<T> {
  final Exception exception;
  Error(this.exception);
}