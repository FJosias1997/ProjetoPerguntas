class Helper {
  static List<String> returnListaString(String list) {
    final removedBrackets = list.substring(1, list.length - 1);
    List<String> result = removedBrackets.split(',');
    return result;
  }
}
