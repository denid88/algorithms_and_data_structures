void main() {
  final List<String> listNames = ['Denys', 'Ivan', 'John'];
  final LinkedList<String> linkedList = LinkedList.fromList(listNames);
  linkedList.insertAfter('Ivan', 'Kaban');
}

class Node<T> {
  late T value;
  late Node<T>? next;

  Node({
    required this.value,
    this.next,
  });

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<T> {
  Node<T>? head;

  bool get isEmpty => head == null;

  static fromList<T>(List<T> list) {
    final LinkedList<T> linkedList = LinkedList();
    for (final T element in list) {
      linkedList.add(element);
    }
    return linkedList;
  }

  void add(T value) {
    final Node<T> newNode = Node(value: value);

    if (isEmpty) {
      head = newNode;
      return;
    }

    Node? current = head;
    while (current?.next != null) {
      current = current!.next;
    }

    current!.next = newNode;
  }

  void insertAfter(T target, T value) {
    final newNode = Node(value: value);
    if (head == null) {
      head = newNode;
      return;
    }

    Node<T>? current = head;

    while (current != null) {
      if (current.value == target) {
        newNode.next = current.next;
        current.next = newNode;
        return;
      }

      current = current.next;
    }
  }

  Node<T>? nodeAtIndex(int index) {
    if (index < 0 || head == null) {
      return null;
    }

    Node<T>? current = head;
    int currentIndex = 0;

    while (current != null && currentIndex < index) {
      current = current.next;
      currentIndex++;
    }

    return current;
  }

  void removeLast() {
    if (head == null) return;

    if (head?.next == null) {
      head = null;
      return;
    }

    Node<T>? current = head;

    while (current?.next?.next != null) {
      current = current!.next;
    }

    current!.next = null;
  }

  void removeAtIndex(int index) {
    if (index < 0 || head == null) {
      return;
    }

    if (index == 0) {
      head = head!.next; // Если индекс 0, удаляем головной узел
      return;
    }

    Node<T>? current = head;
    Node<T>? previous;
    int currentIndex = 0;

    while (current != null && currentIndex < index) {
      previous = current;
      current = current.next;
      currentIndex++;
    }

    if (current != null) {
      previous!.next = current.next;
    }
  }

  // Вывод содержимого списка
  void printList() {
    Node<T>? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}