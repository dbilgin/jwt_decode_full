import 'package:jwt_decode_full/jwt_decode_full.dart';
import 'package:test/test.dart';

const rs256 =
    'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.NHVaYe26MbtOYhSKkoKYdFVomg4i8ZJd8_-RU8VNbftc4TSMb4bXP3l3YlNWACwyXPGffz5aXHc6lty1Y2t4SWRqGteragsVdZufDn5BlnJl9pdR_kdVFUsra2rWKEofkZeIC4yWytE58sMIihvo9H1ScmmVwBcQP6XETqYd0aSHp1gOa9RdUPDvoXQ5oqygTqVtxaDr6wUFKrKItgBMzWIdNZ6y7O9E0DhEPTbE9rfBo6KTFsHAZnMg4k68CDp2woYIaXbmYTWcvbzIuHO7_37GT79XdIwkm95QJ7hYC9RiwrV7mesbY4PAahERJawntho0my942XheVLmGwLMBkQ';
const hs512 =
    'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.VFb0qJ1LRg_4ujbZoRMXnVkUgiuKq5KxWqNdbKq_G9Vvz-S1zZa9LPxtHWKa64zDl2ofkT8F6jBt_K4riU-fPg';
const ps256WithExpiration =
    'eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoxNTE3MjM5MDIyfQ.bYr7VB4XfnNzxzdMeRJpP5IK9xTMmHPzeLhFh4ndnpgXE4_pE1iGx_q3i7eMqbeWVMK-BzxkCN8KNKxRib1XaVRzD0MTRaebFXDL5zbPjTU0ZzP24PThzsu4RuqTrTBifbW04wMar_4jdjImNYUnK61dYOXZoOtEOCeZdcNMrf_jaMcSJ8B0bQvbMf07X6aKZ9RN9YqSn51De5GgqlwUq_22hac5gDpfg3kpeah1eq1uzJXze78dXPOZUtSga3bFLnCrdQ-QwRivJ6F_8VHlCIHvFW8HqRixSeZWtWwyPYFo93dpm0jkpISXwSCfoxor1-5Bnivnqtccaost6LoohQ';

void main() {
  group('decode', () {
    test("rs256 token", () {
      final data = jwtDecode(rs256);
      expect(data.header['alg'], 'RS256');
      expect(data.payload['name'], 'John Doe');
      expect(data.isExpired, isNull);
      expect(data.expiration, isNull);
      expect(data.issuedAt, DateTime.fromMillisecondsSinceEpoch(1516239022000));
    });

    test("hs512 token", () {
      final data = jwtDecode(hs512);
      expect(data.header['alg'], 'HS512');
      expect(data.payload['name'], 'John Doe');
      expect(data.isExpired, isNull);
      expect(data.expiration, isNull);
      expect(data.issuedAt, DateTime.fromMillisecondsSinceEpoch(1516239022000));
    });

    test("ps256 token with expiration", () {
      final data = jwtDecode(ps256WithExpiration);
      expect(data.header['alg'], 'PS256');
      expect(data.payload['name'], 'John Doe');
      expect(data.isExpired, true);
      expect(
        data.expiration,
        DateTime.fromMillisecondsSinceEpoch(1517239022000),
      );
      expect(data.issuedAt, DateTime.fromMillisecondsSinceEpoch(1516239022000));
    });
  });

  group('invalid token', () {
    test("throws format exception without dots", () {
      expect(() => jwtDecode(rs256.replaceAll('.', '')), throwsFormatException);
    });

    test("throws format exception", () {
      expect(() => jwtDecode('in.val.id'), throwsFormatException);
    });
  });
}
