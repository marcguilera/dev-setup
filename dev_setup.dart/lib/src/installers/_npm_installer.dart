part of 'installer.dart';

class _NpmInstaller extends _InstallerBase {
  _NpmInstaller(String name, {String cmd}) : super(name, cmd: cmd);

  @override
  Future install() => _run("npm", ["install", "-g", name]);
}
