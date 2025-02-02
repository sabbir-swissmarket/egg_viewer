// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:epg_viewer/api_services/api_services.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/channel_model/channel_model.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/screens/home/provider/home_provider.dart';
import 'package:epg_viewer/screens/home/view/home.dart';
import 'package:epg_viewer/utils/app_constant.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'home_screen_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
  });
  group('Home Screen Widget Tests', () {
    testWidgets('Renders home screen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Home(),
          ),
        ),
      );
      expect(find.byType(Home), findsOneWidget);
      expect(find.text('EPG Viewer'), findsOneWidget);
    });

    test('Home provider initial state is correct', () {
      final container = ProviderContainer();
      expect(container.read(homeScreenProvider),
          isA<AsyncValue<List<ChannelModel>>>());
    });

    testWidgets('Displays loader while fetching channels',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeScreenProvider.overrideWith((ref) => Future.value([])),
          ],
          child: const MaterialApp(home: Home()),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Displays channels after fetching channels successfully',
        (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      const mockChannel = ChannelModel(
        id: '1',
        name: 'Test Channel',
        url: 'https://example.com/stream',
        icon: 'https://example.com/icon.png',
        programs: [
          ProgramModel(
            channel: '1',
            title: 'Sample Program',
            description: 'This is a sample program.',
            startTime: '20250131011000 +0100',
            endTime: '20250131011000 +0100',
          ),
        ],
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeScreenProvider
                .overrideWith((ref) => Future.value([mockChannel])),
          ],
          child: MaterialApp(
            home: Builder(
              builder: (context) {
                locator.get<SizeConfig>().init(context);
                return Scaffold(key: scaffoldKey, body: const Home());
              },
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text("Channels"), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text("Test Channel"), findsOneWidget);
    });

    testWidgets('Displays error message when fetch fails',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeScreenProvider
                .overrideWith((ref) => Future.error('Error fetching data')),
          ],
          child: const MaterialApp(home: Home()),
        ),
      );

      await tester.pump();
      expect(find.textContaining('Error: Error fetching data'), findsOneWidget);
    });
  });

  group("Test the API Service", () {
    late MockDio mockDio;
    late ApiServices apiServices;

    setUp(() {
      mockDio = MockDio();
      apiServices = ApiServices(dio: mockDio);
    });

    test('getXMLFileRequest returns successful response', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: AppConstant.apiUrl),
        statusCode: 200,
        data: '<xml>Test Data</xml>',
      );

      when(mockDio.get(AppConstant.apiUrl)).thenAnswer(
        (_) async => Future.value(mockResponse),
      );

      final result = await apiServices.getXMLFileRequest();

      expect(result, isNotNull);
      expect(result?.statusCode, equals(200));
      expect(result?.data, contains('<xml>Test Data</xml>'));
    });

    test('getXMLFileRequest handles error response', () async {
      final mockErrorResponse = Response(
        requestOptions: RequestOptions(path: AppConstant.apiUrl),
        statusCode: 404,
        data: 'Not Found',
      );

      when(mockDio.get(AppConstant.apiUrl)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: AppConstant.apiUrl),
          response: mockErrorResponse,
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await apiServices.getXMLFileRequest();

      expect(result, isNotNull);
      expect(result?.statusCode, equals(404));
      expect(result?.data, equals('Not Found'));
    });
  });
}
