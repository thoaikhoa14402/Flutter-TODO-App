import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/source/data_source.dart';

final taskDataSourceProvider = Provider<DataSource>((ref) {
  return DataSource();
});
