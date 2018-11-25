import 'package:meta/meta.dart';

class Command {
  final String exec;
  final Iterable<String> args;

  const Command({
    @required this.exec,
    Iterable<String> args
  }): this.args = args ?? const[];
}