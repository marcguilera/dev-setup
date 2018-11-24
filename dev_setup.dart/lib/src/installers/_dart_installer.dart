part of 'installer.dart';

class _DartInstaller extends _InstallerBase {
  _DartInstaller(String name, {String cmd}) : super(name, cmd: cmd);
  @override
  Future install() => _run("pub", ["global", "activate", name]);
}