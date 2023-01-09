import 'dart:convert';
import 'dart:math';

class Code_Creator{
    static final Random _random = Random.secure();

    static String CreateCryptoRandomString([int length = 16]) {
        var values = List<int>.generate(length, (i) => _random.nextInt(256));

        return base64Url.encode(values);
    }
}