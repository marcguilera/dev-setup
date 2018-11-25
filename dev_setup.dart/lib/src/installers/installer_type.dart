import 'package:dev_setup/indernal.dart';

class InstallerType {
  final Iterable<Command> install;
  final Iterable<Command> isInstalled;
  const InstallerType({
    @required this.install,
    @required this.isInstalled
  });
}