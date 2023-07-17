 
class ModelsUtils {
  static String userNameInitials({required String name}) {
    final List<String> nameSplit = name
        .split(RegExp(r'(\s)+'))
        .where((element) => element.replaceAll(' ', '').isNotEmpty)
        .toList();
    final firstInitial = nameSplit.isNotEmpty
        ? nameSplit.first.substring(0, 1).toUpperCase()
        : '';
    final secondInitial =
        nameSplit.length > 1 ? nameSplit[1].substring(0, 1).toUpperCase() : '';
    return '$firstInitial$secondInitial';
  }

  static String userFirstAndSecondName({required String name}) {
    final List<String> nameSplit = name
        .split(RegExp(r'(\s)+'))
        .where((element) => element.replaceAll(' ', '').isNotEmpty)
        .toList();
    final firstInitial = nameSplit.isNotEmpty ? nameSplit.first : '';
    final secondInitial = nameSplit.length > 1 ? nameSplit[1] : '';
    return firstInitial + (secondInitial.isNotEmpty ? ' $secondInitial' : '');
  }
}
