part of 'installer.dart';

abstract class _InstallerBase implements Installer {

  @override
  final String name;
  final String cmd;
  String get bashProfile => null;

  _InstallerBase(String name, {String cmd}):
      this.name = name,
      this.cmd = cmd ?? name;

  @override
  Future<bool> get isInstalled async {
    final result = await _run("command", ["-v", cmd]);
    return result != null && result.isNotEmpty;
  }

  Future<String> _run(String cmd, [List<String> arguments = const []]) async {
    final proc = await Process.run(cmd, arguments, runInShell: true);
    final  String err = proc.stderr;
    if (err!= null && err.isNotEmpty) {
      throw Exception("Error executing command: $err");
    }
    return proc.stdout;
  }
}


