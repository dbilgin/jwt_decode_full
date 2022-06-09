import 'dart:convert';

import 'jwt_data.dart';

/// `jwtDecode` provides a way to decode different types of JWTs and
/// extract their payloads, headers, expiration dates, and issued dates and
/// whether they are expired or not.
///
/// You can use this function to decode a JWT and return a [JWTData] object:
/// ```dart
/// final jwtData = jwtDecode(myToken);
///
/// print('header: ${jwtData.header}');
/// print('payload: ${jwtData.payload}');
/// print('isExpired: ${jwtData.isExpired}');
/// print('issued date: ${jwtData.issuedAt}');
/// print('expiration date: ${jwtData.expiration}');
/// ```
JWTData jwtDecode(String token) {
  final splitToken = token.split('.');
  if (splitToken.length != 3) {
    throw const FormatException('Invalid token');
  }

  final headerEncoded = splitToken[0];
  final payloadEncoded = splitToken[1];

  final normalizedHeader = base64.normalize(headerEncoded);
  final headerString = utf8.decode(base64.decode(normalizedHeader));
  final decodedHeader = jsonDecode(headerString) as Map<String, dynamic>;

  final normalizedPayload = base64.normalize(payloadEncoded);
  final payloadString = utf8.decode(base64.decode(normalizedPayload));
  final decodedPayload = jsonDecode(payloadString) as Map<String, dynamic>;

  return JWTData(header: decodedHeader, payload: decodedPayload);
}
