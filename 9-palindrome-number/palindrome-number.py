class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            return False
        else:
            k=str(x)
            print(k)
            if str(k[::-1])==str(k[::]):
                return True
            else:
                return False
        