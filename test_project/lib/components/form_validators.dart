class InputValidators {
  Function creditCardNumber = (String? value) {
    if (value!.length < 3) return '';
    return null;
  };

  Function cardValidityPeriod = (String? value) {
    if (value!.length < 5) return 'Incorrect month/year format';

    if (int.parse(value.substring(0, 2)) < 1 ||
        int.parse(value.substring(0, 2)) > 12 ||
        int.parse(value.substring(0, 2)) < DateTime.now().month ||
        int.parse(value.substring(3)) < DateTime.now().year % 100) return '';

    return null;
  };

  Function cvv = (String? value) {
    if (value!.length < 3) return '';
    return null;
  };

  Function cardHolderName = (String? value) {
    if (value!.length < 3 || !value.contains(' ')) return '';
    return null;
  };

  Function email = (String? value) {
    if (!value!.contains('@') ||
        !value.contains('.') ||
        value.indexOf('@') + 1 == value.indexOf('.') ||
        value.endsWith('.') ||
        value.split('.')[1].length < 2) return '';

    return null;
  };

  Function city = (String? value) {
    if (value!.length < 3) return '';
    return null;
  };

  Function phone = (String? value) {
    if (value!.length < 10) return '';
    return null;
  };
}
