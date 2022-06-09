/// `JWTData` is a class that contains the header, payload of a JWT.
/// By using the `isExpired`, `issuedAt`, and `expiration` getters, you can
/// easily extract the calculated results for these properties.
class JWTData {
  JWTData({required this.header, required this.payload});
  final Map<String, dynamic> header;
  final Map<String, dynamic> payload;

  bool? get isExpired {
    final exp = payload['exp'] as int?;
    return exp == null
        ? null
        : exp < DateTime.now().millisecondsSinceEpoch / 1000;
  }

  DateTime? get issuedAt {
    final iat = payload['iat'] as int?;
    return iat == null ? null : DateTime.fromMillisecondsSinceEpoch(iat * 1000);
  }

  DateTime? get expiration {
    final exp = payload['exp'] as int?;
    return exp == null ? null : DateTime.fromMillisecondsSinceEpoch(exp * 1000);
  }
}
