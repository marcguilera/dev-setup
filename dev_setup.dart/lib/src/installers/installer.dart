import 'dart:io';
import 'package:dev_setup/dev_setup.dart';
import 'package:meta/meta.dart';

class Installer {

  final String name;
  final String cmd;
  final Iterable<String> bash;
  final InstallerType type;

  const Installer({
    @required InstallerType type,
    @required String name,
    String cmd,
    Iterable<String> bash
  }): this.name = name,
      this.cmd = cmd ?? name,
      this.bash = bash ?? const [],
      this.type = type;

  bool get isInstalled {
    final result = _run(cmd: "command", args: ["-v", cmd]);
    return result != null && result.isNotEmpty;
  }

  void install() {
    _run(cmd: type.cmd, args: type.args.toList()..add(name));
  }

  static String _run({String cmd, List<String> args = const []}) {
    final proc = Process.runSync(cmd, args, runInShell: true);
    final  String err = proc.stderr;
    if (err!= null && err.isNotEmpty) {
      throw Exception("Error executing command [$cmd ${args.join(" ")}]: $err");
    }
    return proc.stdout;
  }
}