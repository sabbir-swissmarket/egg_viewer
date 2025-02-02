// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:epg_viewer/helper/enum_data.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/screens/program_screen/utils/program_utils.dart';
import 'package:epg_viewer/screens/program_screen/view/program_screen.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const programs = [
  ProgramModel(
    channel: 'Channel 1',
    title: 'Program 1',
    startTime: '20250131011000 +0100',
    endTime: '20250131011000 +0100',
    description: 'Description 1',
  ),
  ProgramModel(
    channel: 'Channel 2',
    title: 'Program 2',
    startTime: '20250201025300 +0100',
    endTime: '20250201033800 +0100',
    description: 'Description 2',
  ),
];

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
  });

  group("Program Screen Widget Test", () {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    testWidgets('ProgramScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          onGenerateRoute: (settings) {
            if (settings.name == '/program_screen') {
              return MaterialPageRoute(
                builder: (context) {
                  locator.get<SizeConfig>().init(context);
                  return const ProviderScope(child: ProgramScreen());
                },
                settings: const RouteSettings(arguments: programs),
              );
            }
            return null;
          },
          initialRoute: '/program_screen',
        ),
      );

      await tester.pump();

      expect(find.text('Programs'), findsOneWidget);
      expect(find.text('Program 1'), findsOneWidget);
      expect(find.text('Program 2'), findsOneWidget);

      // Check search functionality
      await tester.enterText(find.byType(TextField), 'Program 1');
      await tester.pump();

      expect(find.widgetWithText(TextField, 'Program 1'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
            (widget) => widget is Text && widget.data == 'Program 1'),
        findsOneWidget,
      );
      expect(find.text('Program 2'), findsNothing);

      // Check sorting functionality Newest to oldest
      await tester.tap(find.byIcon(Icons.filter_alt));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Newest to Oldest'));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
            (widget) => widget is Text && widget.data == 'Program 2'),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
            (widget) => widget is Text && widget.data == 'Program 1'),
        findsOneWidget,
      );

      // Check sorting functionality Oldest to newest
      await tester.tap(find.byIcon(Icons.filter_alt));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Oldest to Newest'));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
            (widget) => widget is Text && widget.data == 'Program 1'),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
            (widget) => widget is Text && widget.data == 'Program 2'),
        findsOneWidget,
      );

      // Check the filter by date functionality
      await tester.tap(find.byIcon(Icons.filter_alt));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Filter By Date'));
      await tester.pumpAndSettle();

      await tester.tap(find.text("1"));
      await tester.pumpAndSettle();

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
            (widget) => widget is Text && widget.data == 'Program 2'),
        findsOneWidget,
      );
    });
  });

  group("Program Screen Unit test", () {
    late ProgramUtils programUtils;
    const args = programs;
    setUp(() {
      programUtils = locator.get<ProgramUtils>();
    });

    test('Search program function filters programs correctly', () {
      // Test search with matching text
      final result = programUtils.searchPrograms(
          args, programs, 'Program 1', SortOrder.none);
      expect(result.length, 1);
      expect(result[0].title, 'Program 1');

      // Test search with non-matching text
      final emptyResult = programUtils.searchPrograms(
          args, programs, 'Program 5', SortOrder.none);
      expect(emptyResult.isEmpty, true);
    });

    test("Sort programs function sorts program correctly", () {
      // Test sorting from newest to oldest
      final newestToOldest =
          programUtils.sortPrograms(args, SortOrder.newestToOldest);
      expect(newestToOldest[0].title, 'Program 2');
      expect(newestToOldest[1].title, 'Program 1');

      // Test sorting from oldest to newest
      final oldestToNewest =
          programUtils.sortPrograms(args, SortOrder.oldestToNewest);
      expect(oldestToNewest[0].title, 'Program 1');
      expect(oldestToNewest[1].title, 'Program 2');
    });

    test("Filter program function filters program correctly", () {
      // Test filtering by date
      final filteredPrograms =
          programUtils.filterProgramsByDate(args, DateTime(2025, 02, 01));
      expect(filteredPrograms.length, 1);
      expect(filteredPrograms[0].title, 'Program 2');
    });
  });
}
