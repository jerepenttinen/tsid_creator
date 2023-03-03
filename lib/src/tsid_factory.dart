import 'dart:math';

import 'package:tsid_creator/tsid_creator.dart';

class TsidFactory {
  static const nodeBits256 = 8;
  static const nodeBits1024 = 10;
  static const nodeBits4096 = 12;

  static const randomBits = 22;
  static const randomMask = 0x3FFFFF;

  TsidFactory({int nodeBits = nodeBits1024, int? node}) {
    _nodeBits = nodeBits;

    _counterBits = randomBits - _nodeBits;
    _counterMask = randomMask >> _nodeBits;
    _nodeMask = randomMask >> _counterBits;

    _node = _getNode(node) & _nodeMask;
    _counter = _getRandomCounter();
  }
  int _counter = 0;
  int _lastTime = DateTime.now().toUtc().millisecondsSinceEpoch;

  int _node = 0;

  late final int _nodeBits;
  late final int _counterBits;

  late final int _nodeMask;
  late final int _counterMask;

  final int _customEpoch =
      DateTime.utc(2020, DateTime.january, 1).millisecondsSinceEpoch;

  final _random = Random.secure();

  Tsid generate() {
    final time = _getTime() << randomBits;
    final node = _node << _counterBits;
    final counter = _counter & _counterMask;

    return Tsid(time | node | counter);
  }

  int _getTime() {
    var time = DateTime.now().toUtc().millisecondsSinceEpoch;
    if (time <= _lastTime) {
      _counter++;
      final carry = _counter >> _counterBits;
      _counter &= _counterMask;
      time = _lastTime + carry;
    } else {
      _counter = _getRandomCounter();
    }

    _lastTime = time;

    return time - _customEpoch;
  }

  int _getNode(int? node) {
    final mask = 0x3FFFFF;
    node ??= _random.nextInt(1 << 32);
    return node & mask;
  }

  int _getRandomCounter() => _random.nextInt(1 << 32) & _counterMask;
}
