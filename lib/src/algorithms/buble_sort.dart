/// Bubble sort algorithm Time Complexity: O(n^2), Space Complexity: O(1)
void main() {
  final List<int> list = [5, 3, 6, 2, 10];
  bubbleSort(list);
  print(list);
}

void bubbleSort(List<int> input) {
  for (int i = 0; i < input.length; i++) {
    for (int j = 0; j < input.length - i - 1; j++) {
      if (input[j] > input[j + 1]) {
        int temp = input[j];
        input[j] = input[j + 1];
        input[j + 1] = temp;
      }
    }
  }
}