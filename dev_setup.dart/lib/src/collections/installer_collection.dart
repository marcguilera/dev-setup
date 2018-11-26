import 'package:dev_setup/indernal.dart';

class InstallerCollection extends Iterable<Installer> {
  final String name;
  final Iterable<Installer> _installers;

  @override
  Iterator<Installer> get iterator => _installers.iterator;

  const InstallerCollection({
    @required String name,
    bool isPrivate,
    Iterable<Installer> installers
  }): this.name = name,
      this._installers = installers ?? const [];

  @override
  String toString() => name;

}