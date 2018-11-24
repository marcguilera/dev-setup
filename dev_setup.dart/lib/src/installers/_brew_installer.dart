part of 'installer.dart';

class _BrewInstaller extends _InstallerBase {
  _BrewInstaller(String name, {String cmd}) : super(name, cmd: cmd);
  @override
  Future install() => _run("brew", ["install", name]);
}