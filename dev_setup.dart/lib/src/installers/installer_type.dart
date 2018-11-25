import 'package:meta/meta.dart';

class InstallerType {
  final List<String> install;
  final List<String> isInstalled;
  const InstallerType({
    @required this.install,
    @required this.isInstalled
  });
}