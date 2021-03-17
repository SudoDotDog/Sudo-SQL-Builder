import 'package:sudo_sql_builder/src/data-type.dart';

class SQLCreateTableColumn {
  final String name;

  final bool primaryKey;
  final SQLDataType dataType;

  SQLCreateTableColumn(
    this.name,
    this.dataType, {
    this.primaryKey = false,
  });

  String build() {
    if (this.primaryKey) {
      return "${this.name} ${this.dataType.toString()} PRIMARY KEY";
    }
    return "${this.name} ${this.dataType.toString()}";
  }
}

class SQLCreateTableBuilder {
  final String tableName;

  final List<SQLCreateTableColumn> columns = [];

  SQLCreateTableBuilder(
    this.tableName, {
    List<SQLCreateTableColumn> columns,
  }) {
    if (columns != null) {
      this.columns.addAll(columns);
    }
  }

  void addColumn(SQLCreateTableColumn column) {
    this.columns.add(column);
  }

  String build() {
    if (this.columns.length == 0) {
      return "CREATE TABLE ${this.tableName};";
    }

    final String builtColumns = this.columns.map((SQLCreateTableColumn column) {
      return column.build();
    }).join(', ');

    return "CREATE TABLE ${this.tableName} ($builtColumns);";
  }
}
