import 'package:dev_setup/dev_setup.dart';
import 'package:meta/meta.dart';

class InstallerType {
  final Iterable<Command> install;
  final Iterable<Command> isInstalled;
  const InstallerType({
    @required this.install,
    @required this.isInstalled
  });
}