import 'package:jwt_decode_full/jwt_decode_full.dart';

const myToken =
    'eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoxNTE3MjM5MDIyfQ.bYr7VB4XfnNzxzdMeRJpP5IK9xTMmHPzeLhFh4ndnpgXE4_pE1iGx_q3i7eMqbeWVMK-BzxkCN8KNKxRib1XaVRzD0MTRaebFXDL5zbPjTU0ZzP24PThzsu4RuqTrTBifbW04wMar_4jdjImNYUnK61dYOXZoOtEOCeZdcNMrf_jaMcSJ8B0bQvbMf07X6aKZ9RN9YqSn51De5GgqlwUq_22hac5gDpfg3kpeah1eq1uzJXze78dXPOZUtSga3bFLnCrdQ-QwRivJ6F_8VHlCIHvFW8HqRixSeZWtWwyPYFo93dpm0jkpISXwSCfoxor1-5Bnivnqtccaost6LoohQ';

void main() {
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
}
