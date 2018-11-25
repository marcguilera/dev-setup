import 'package:dev_setup/indernal.dart';

class FileReader {
  FileReader._();
  static Map read(String path) {
    final yamlString = File(path).readAsStringSync();
    return loadYaml(yamlString);
  }
}