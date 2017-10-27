import re

from my_mr_engine import MyMREngine


WORD_RE = re.compile(r"[\w']+")

def mapper(input_file):
    result_lst = []
    contents = ""
    with open(input_file, 'r') as f:
        for line in f:
            contents += line

    for word in WORD_RE.findall(contents):
        result_lst.append((word, 1))

    return result_lst

def reducer(word_count_info):
    key, occurrence = word_count_info
    return key, sum(occurrence)

if __name__ == "__main__":
    import sys
    import operator

    input_file_lst = [sys.argv[1]]

    mapper_reducer = MyMREngine(mapper, reducer)

    word_count_result = mapper_reducer(input_file_lst)
    word_count_result.sort(key=operator.itemgetter(1))
    word_count_result.reverse()

    for w in word_count_result:
        print("Word: {}, Occurrences: {}".format(w[0], w[1]))

