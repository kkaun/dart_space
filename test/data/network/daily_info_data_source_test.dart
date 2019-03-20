import 'dart:io';
import 'package:dart_space/data/model/daily_info/daily_info_search_result.dart';
import 'package:dart_space/data/network/daily_info_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';

class MockClient extends Mock implements http.Client {}

void main() {

  String fixture(String name) => File('test/data/fixtures/$name.json').readAsStringSync();

  MockClient mockClient;
  DailyInfoDataSource dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = DailyInfoDataSource(mockClient);
  });

  group('requestDailyInfo', () {
    test(
      'returns DailyInfoSearchResult when the call completes successfully',
      () async {
        when(
          mockClient.get(
            argThat(
              startsWith('https://api.nasa.gov/planetary/apod'),
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
                fixture('search_result'),
                200,
                headers: {'content-type': 'application/json; charset=utf-8'},
              ),
        );

        DailyInfoSearchResult result = await dataSource.searchDailyInfo('2018-12-16');

        expect(result, TypeMatcher<DailyInfoSearchResult>());
        expect(result.copyright, 'Ruslan MerzlyakovRMS Photography');
        expect(result.title, startsWith('Comet Wirtanen Passes'));
      }
    );
  }
  );

  test('throws an error on bad request', () async {
      when(
        mockClient.get(
          argThat(
            startsWith('https://api.nasa.gov/planetary/apod'),
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(fixture('error'), 400),
      );

      expect(
        () => dataSource.searchDailyInfo('323131'),
        throwsA(TypeMatcher<DailyInfoSearchResult>()),
      );
  }
  );

  // test('makes an HTTP request to a proper URL', () {
  //     when(
  //       mockClient.get(
  //         argThat(
  //           startsWith('https://api.nasa.gov/planetary/apod'),
  //         ),
  //       ),
  //     ).thenAnswer(
  //       (_) async => http.Response(
  //             fixture('search_result'),
  //             200,
  //             headers: {'content-type': 'application/json; charset=utf-8'},
  //           ),
  //     );
  // }
  // );
}