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

  bool get isInstalled => type.isInstalled.any((run) {
    final result = _run(run);
    return result != null && result.isNotEmpty;
  });

  void install() => type.install.forEach(_run);

  String _run(String run) {
    final formatted = _format(run);
    final arr = formatted.split(" ");
    final exec = arr.first;
    final params = arr.length > 1 ? arr.sublist(1) : const [];
    final proc = Process.runSync(exec, params, runInShell: true);
    final  String err = proc.stderr;
    if (err!= null && err.isNotEmpty) {
      throw Exception("Error executing command [$formatted]: $err");
    }
    return proc.stdout;
  }

  String _format(String run) => run
    .replaceAll("{cmd}", cmd)
    .replaceAll("{name}", name);
}