import 'package:dev_setup/dev_setup.dart';
import 'package:meta/meta.dart';

class InstallerCollection {
  final String name;
  final bool isHidden;
  final Iterable<Installer> installers;

  const InstallerCollection({
    @required String name,
    bool isPrivate,
    Iterable<Installer> installers
  }): this.name = name,
      this.isHidden = isPrivate ?? false,
      this.installers = installers ?? const [];
}