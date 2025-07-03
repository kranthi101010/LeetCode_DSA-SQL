class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:

        final_word=""
        if(len(word1)>=len(word2)):
            for i in range(len(word2)):
                final_word=final_word+word1[i]
                final_word=final_word+word2[i]
            final_word=final_word+word1[i+1:]
        else:
            for i in range(len(word1)):
                final_word=final_word+word1[i]
                final_word=final_word+word2[i]
            final_word=final_word+word2[i+1:]
        return final_word