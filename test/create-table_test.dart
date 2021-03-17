import 'package:flutter_test/flutter_test.dart';
import 'package:sudo_sql_builder/sudo_sql_builder.dart';

void main() {
  test('create simple create table query', () {
    final SQLCreateTableBuilder builder = SQLCreateTableBuilder(
      'table',
    );
    final String result = builder.build();

    expect(result, "CREATE TABLE table");
  });
}
