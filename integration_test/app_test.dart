import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:hydrated_bloc_integration_test_example/main.dart' as app;

import 'hydrated_bloc.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      final Finder fab = find.byTooltip('Increment');
      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('tap on the floating action button, verify counter 2',
        (WidgetTester tester) async {
      await mockHydratedStorage(() async {
        await tester.pumpWidget(const app.MyApp());
        await tester.pumpAndSettle();
        expect(find.text('0'), findsOneWidget);
        final Finder fab = find.byTooltip('Increment');
        await tester.tap(fab);
        await tester.pumpAndSettle();
        expect(find.text('1'), findsOneWidget);
      });
    });
  });
}
