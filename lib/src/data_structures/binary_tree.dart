void main() {
  final binaryTree = createBinaryTree();
  print(binaryTree);

}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.left = one;
  one.left = zero;
  one.right = five;
  seven.right = nine;
  nine.left = eight;

  return seven;
}

class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? left;
  BinaryNode<T>? right;

  String _diagram(
      BinaryNode<T>? node, [
        String top = '',
        String root = '',
        String bottom = '',
      ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.left == null && node.right == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.right,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.left,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }

  @override
  String toString() => _diagram(this);
}
