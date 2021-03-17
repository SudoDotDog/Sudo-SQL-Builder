class SQLDataType {
  final String dataType;

  const SQLDataType(this.dataType);

  static const SQLDataType integer = const SQLDataType('integer');
  static const SQLDataType text = const SQLDataType('text');

  factory SQLDataType.fromString(String dataType) {
    switch (dataType) {
      case 'integer':
        return SQLDataType.integer;
      case 'text':
        return SQLDataType.text;
    }
    return null;
  }

  String toString() {
    return this.dataType.toUpperCase();
  }
}
