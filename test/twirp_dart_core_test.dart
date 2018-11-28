import 'dart:convert';

import 'package:twirp_dart_core/twirp_dart_core.dart';
import 'package:test/test.dart';

void main() {
  group('Twirp Core Tests', () {
    test('Test exception parsing', () {
      var jsonString = r"""
    {
      "msg": "A twirp exception has occurred",
      "code": "10",
      "meta": {
          "key": "value",
          "key2": "value2"
       }
    }
    """;
      var e = new TwirpJsonException.fromJson(json.decode(jsonString));
      expect(e.code, equals("10"));
      expect(e.message, equals("A twirp exception has occurred"));
      var meta = e.meta as Map<String, dynamic>;
      expect(meta.keys.length, equals(2));
    });
  });
}
