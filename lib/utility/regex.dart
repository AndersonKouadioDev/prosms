bool isEmailValid(email) =>
    email != null &&
    !email.isEmpty &&
    email.length >= 3 &&
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

bool isValid(thing) => thing != null && !thing.isEmpty && thing.length >= 3;

bool isPhoneValid(phone) =>
    phone != null &&
    !phone.isEmpty &&
    phone.length >= 8 &&
    phone.length <= 20 &&
    RegExp(r"^\+[0-9.]+").hasMatch(phone);
