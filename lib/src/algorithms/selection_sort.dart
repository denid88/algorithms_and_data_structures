/// Selection Sort complexity O(n^2), Space Complexity: O(1)
void main() {
  final List<int> list = [5, 3, 6, 2, 10];
  selectionSort(list);
  print(list);
}

void selectionSort(List<int> input) {
  int minIndex = 0;
  int temp = 0;

  for (int i = 0; i < input.length; i++) {
    minIndex = i;

    for (int j = i + 1; j < input.length; j++) {
      if (input[j] < input[minIndex]) {
        minIndex = j;
      }
    }

    temp = input[i];
    input[i] = input[minIndex];
    input[minIndex] = temp;
  }
}