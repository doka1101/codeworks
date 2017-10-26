import re

from my_mr_engine import MyMREngine


class WordCounter(MyMREngine):
    WORD = re.compile(r"[\w']+")

    def mapper(self, line):
        for word in WORD_RE.findall(line):
            yield (word, 1)

    def reducer(self, key, entries):
        return key, sum(entries)
