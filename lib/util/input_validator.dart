class InputValidator {
  final String input;
  late String error;

  InputValidator(this.input);

  String validate() {
    return error;
  }

  InputValidator nonEmpty(String errorMessage) {
    error = (input.isEmpty ? errorMessage : null)!;
    return this;
  }

  InputValidator minLength(int length, String errorMessage) {
    error = (input.length < length ? errorMessage : null)!;
    return this;
  }

  InputValidator maxLength(int length, String errorMessage) {
    error = (input.length > length ? errorMessage : null)!;
    return this;
  }
}
