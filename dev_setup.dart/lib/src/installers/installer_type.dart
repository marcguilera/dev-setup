import 'package:meta/meta.dart';

class InstallerType {
  final String name;
  final String cmd;
  final Iterable<String> args;
  const InstallerType({
    @required String name,
    String cmd,
    Iterable<String> args
  }): this.name = name,
      this.cmd = cmd ?? name,
      this.args = args ?? const [];
}