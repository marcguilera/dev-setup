import 'package:dev_setup/indernal.dart';

class InstallerCollections extends Iterable<InstallerCollection> {
  final Iterable<InstallerCollection> _collections;
  @override
  Iterator<InstallerCollection> get iterator => _collections.iterator;
  Iterable<Installer> get installers {
    Map<String, Installer> map = {};
    _collections.forEach((c) => c.forEach((i) => map[i.name] = i));
    return map.values;
  }
  InstallerCollections(this._collections);
}