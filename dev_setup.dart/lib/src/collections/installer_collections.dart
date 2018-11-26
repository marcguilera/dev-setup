import 'package:dev_setup/indernal.dart';

class InstallerCollections extends Iterable<InstallerCollection> {
  final Iterable<InstallerCollection> _collections;
  @override
  Iterator<InstallerCollection> get iterator => _collections.iterator;
  Iterable<Installer> get installers => toDistinct(_collections.expand((x) => x), (x) => x.name);
  InstallerCollections(this._collections);
}