void main() {
  final s = Solution();
  //final haystack = "sadbutsad", needle = "sad";
  //final haystack = "leetcode", needle = "leeto";
  //final haystack = 'hello', needle = 'll';
  //final haystack = 'aaaaa', needle = 'bba';
  //final haystack = 'a', needle = 'a';
  //final haystack = 'mississippi', needle = 'issip';
  //final haystack = 'mississippi', needle = 'pi';
  //final haystack = 'mississippi', needle = 'sipp';
  final haystack = 'mississippi', needle = 'issipi';
  print('__result__: ${s.strStr(haystack, needle)}');
}

class Solution {
  int strStr(String haystack, String needle) {
    int left = 0;
    int right = 0;

    while (left < haystack.length) {
      if (right < needle.length && haystack[left] == needle[right]) {
        right++;
      } else if (right < needle.length && haystack[left] != needle[right]) {
        var temp = right;
        right = 0;

        print('__iteration');
        print(left);
        print(temp);
        left = left - temp;
        print('newLeft $left');
      }

      left++;

      if (right == needle.length) {
        return left - needle.length;
      }


    }

    return -1;
  }
}