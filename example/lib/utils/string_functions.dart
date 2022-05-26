String sanitize(String input) {
  input = input.toLowerCase().trim();
  if (input.isEmpty) {
    throw Error();
  }
  return input;
}
