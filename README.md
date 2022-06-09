# Dashed Color Circle

[![Pub Version](https://img.shields.io/pub/v/jwt_decode_full?color=blueviolet)](https://pub.dev/packages/jwt_decode_full)

A JWT decoder that allows you to extract all the necessary data like the header, payload, expiration date and issued date from a JWT.

## Installation

Add `jwt_decode_full` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

<h1>Usage</h1>

```dart
  final jwtData = jwtDecode(myToken);

  print('header: ${jwtData.header}');
  print('payload: ${jwtData.payload}');
  print('isExpired: ${jwtData.isExpired}');
  print('issued date: ${jwtData.issuedAt}');
  print('expiration date: ${jwtData.expiration}');

  /// Result:
  ///
  /// header: {alg: PS256, typ: JWT}
  /// payload: {sub: 1234567890, name: John Doe, admin: true, iat: 1516239022, exp: 1517239022}
  /// isExpired: true
  /// issued date: 2018-01-18 02:30:22.000
  /// expiration date: 2018-01-29 16:17:02.000
```

For more detailed examples you can check out the [example project](https://github.com/dbilgin/jwt_decode_full/tree/master/example).
