extension StringFormate on String {
  String imageProductFormate() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }

  String toCapitalized() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

 String convertLongString() {
  final words = split(' ');
  
  // Check if the text has fewer than two words
  if (words.length <= 2) {
    return this; // Return the original text if there are fewer than two words
  }
  
  final shortString = words.sublist(0, words.length - 2).join(' ');
  return shortString;
}

}
