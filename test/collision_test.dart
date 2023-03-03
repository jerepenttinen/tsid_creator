import 'dart:collection';

import 'package:test/test.dart';
import 'package:tsid_creator/tsid_creator.dart';

void main() {
  test('test collisions', () {
    final nodeBits = 8;
    final iterationCount = 1000000;

    final Map<int, int> tsidMap = HashMap();

    final factory = TsidFactory(nodeBits: nodeBits);

    for (int i = 0; i < iterationCount; i++) {
      final tsid = factory.generate().toInt();
      if (tsidMap.putIfAbsent(tsid, () => tsid) != tsid) {
        fail('Collision detected');
      }
    }
  });
}
