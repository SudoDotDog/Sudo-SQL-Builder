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

  test('create column added create table query - factory', () {
    final SQLCreateTableBuilder builder = SQLCreateTableBuilder(
      'table',
      columns: [
        SQLCreateTableColumn(
          'id',
          SQLDataType.integer,
          primaryKey: true,
        ),
        SQLCreateTableColumn(
          'first',
          SQLDataType.text,
        ),
      ],
    );
    final String result = builder.build();

    expect(result, "CREATE TABLE table (id INTEGER PRIMARY KEY, first TEXT);");
  });

  test('create column added create table query - waterfall', () {
    final SQLCreateTableBuilder builder = SQLCreateTableBuilder('table')
      ..addColumn(
        SQLCreateTableColumn(
          'id',
          SQLDataType.integer,
          primaryKey: true,
        ),
      )
      ..addColumn(
        SQLCreateTableColumn(
          'first',
          SQLDataType.text,
        ),
      );
    final String result = builder.build();

    expect(result, "CREATE TABLE table (id INTEGER PRIMARY KEY, first TEXT);");
  });

  test('create column added create table query - combined', () {
    final SQLCreateTableBuilder builder =
        SQLCreateTableBuilder('table', columns: [
      SQLCreateTableColumn(
        'id',
        SQLDataType.integer,
        primaryKey: true,
      ),
    ])
          ..addColumn(
            SQLCreateTableColumn(
              'first',
              SQLDataType.text,
            ),
          );
    final String result = builder.build();

    expect(result, "CREATE TABLE table (id INTEGER PRIMARY KEY, first TEXT);");
  });
}
