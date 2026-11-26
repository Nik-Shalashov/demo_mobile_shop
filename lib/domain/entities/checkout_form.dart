import 'package:demo_mobile_shop/domain/entities/checkout_field.dart';

class CheckoutForm {
  final String name;
  final String email;
  final String phone;
  final String address;

  const CheckoutForm({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.address = '',
  });

  static const empty = CheckoutForm();

  String? get nameError {
    if (name.trim().isEmpty) return 'Введите имя';
    return null;
  }

  String? get emailError {
    final value = email.trim();
    if (value.isEmpty) return 'Введите email';
    if (!_emailRegex.hasMatch(value)) return 'Некорректный email';
    return null;
  }

  String? get phoneError {
    final value = phone.trim();
    if (value.isEmpty) return 'Введите телефон';
    final digits = value.replaceAll(_nonDigitRegex, '');
    if (digits.length < _minPhoneDigits) {
      return 'Минимум $_minPhoneDigits цифр';
    }
    return null;
  }

  String? get addressError {
    if (address.trim().isEmpty) return 'Введите адрес';
    return null;
  }

  Map<CheckoutField, String> get errors {
    final result = <CheckoutField, String>{};

    final nameErr = nameError;
    if (nameErr != null) result[CheckoutField.name] = nameErr;

    final emailErr = emailError;
    if (emailErr != null) result[CheckoutField.email] = emailErr;

    final phoneErr = phoneError;
    if (phoneErr != null) result[CheckoutField.phone] = phoneErr;

    final addressErr = addressError;
    if (addressErr != null) result[CheckoutField.address] = addressErr;

    return result;
  }

  bool get isValid =>
      nameError == null &&
      emailError == null &&
      phoneError == null &&
      addressError == null;

  CheckoutForm copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    return CheckoutForm(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutForm &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          address == other.address;

  @override
  int get hashCode => Object.hash(name, email, phone, address);

  static const int _minPhoneDigits = 10;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _nonDigitRegex = RegExp(r'\D');
}