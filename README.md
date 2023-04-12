# Fajax

2022 © Bikramaditya Meher

[![Pub](https://img.shields.io/pub/v/fajax.svg)](https://pub.dartlang.org/packages/fajax) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/bikram0000/fajax/blob/main/LICENSE)

A plugin for web to hit apis with help of ajax and php without CORS issue in server side on release build. Note it will only work on release build.


Add this to your pubspec.yaml file.
```yaml
fajax: ^1.0.0
```

To use Fajax you need to call below code in your State<MyApp> because first time it will import js file to index.html
```dart
  final _fajaxPlugin = Fajax();
```

To make a request
```dart
 late http.Response response;
    if (kIsWeb && kReleaseMode) {
      try {
        await Fajax().makeRequest(
            fajaxModel: FajaxModel(
              baseUrl: "https://geolocation-db.com/json",
              body: {},
              params: {},
              headers: {},
              method: "GET",
            ),
            onSuccess: (fajaxResult) {
              try {
                response = http.Response(
                  fajaxResult.response.toString(),
                  fajaxResult.info['http_code'],
                );
              } catch (e) {
                print("error on json decode $e :: end of error");
              }
            },
            onError: (p0) {
              print("error on get $p0");
              response = http.Response(
                "Something went wrong !!",
                404,
              );
            });
      } catch (e) {
        print("Error on getting data from fajax :: $e lllll ");
        response = http.Response(
          "Something went wrong !!",
          -1,
        );
      }
    }
    else {
      response = await http
          .get(Uri.parse("https://geolocation-db.com/json"), headers: {});
      log('RESPONSE : ${response.statusCode}\n :: $url  || ${response.body}');
    }
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

for more information and please checkout example folder.