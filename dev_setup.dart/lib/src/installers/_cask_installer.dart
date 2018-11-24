part of 'installer.dart';

class _CaskInstaller extends _InstallerBase {
  _CaskInstaller(String name, {String cmd}):
        super(name, cmd: cmd);
  @override
  Future install() => _run("brew", ["cask", "install", name]);
}