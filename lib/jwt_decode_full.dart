/// `jwt_decode_full` is a package that decodes JWTs and
/// returns a [JWTData] object. The main objective is to provide a
/// simple way to extract the header data as well as the payload data
/// from JWTs.
///
/// You can also extract the `expiration` date, `issuedAt` date, and `isExpired`
/// from the payload if they exist. If not these would simply return null.
///
/// The usage of this package simple:
/// ```dart
/// final jwtData = jwtDecode(myToken);
///
/// print('header: ${jwtData.header}');
/// print('payload: ${jwtData.payload}');
/// print('isExpired: ${jwtData.isExpired}');
/// print('issued date: ${jwtData.issuedAt}');
/// print('expiration date: ${jwtData.expiration}');
/// ```
library jwt_decode_full;

export 'src/jwt_decode.dart';
export 'src/jwt_data.dart';
