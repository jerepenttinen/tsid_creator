class Tsid {
  Tsid(this._n);

  final int _n;

  int toInt() => _n;

  @override
  String toString() {
    return '${_a[(_n >> 60) & 31]}${_a[(_n >> 55) & 31]}${_a[(_n >> 50) & 31]}${_a[(_n >> 45) & 31]}${_a[(_n >> 40) & 31]}${_a[(_n >> 35) & 31]}${_a[(_n >> 30) & 31]}${_a[(_n >> 25) & 31]}${_a[(_n >> 20) & 31]}${_a[(_n >> 15) & 31]}${_a[(_n >> 10) & 31]}${_a[(_n >> 5) & 31]}${_a[_n & 31]}';
  }

  @override
  int get hashCode => _n.hashCode;

  @override
  bool operator ==(Object other) => other is Tsid && _n == other._n;
}

const _a = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'J',
  'K',
  'M',
  'N',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];
