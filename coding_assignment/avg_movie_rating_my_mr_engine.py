from my_mr_engine import MyMREngine
import numpy as np


def mapper(movie_ratings):
    result_lst = []
    result_lst.append((movie_ratings[0], movie_ratings[1]))
    return result_lst

def reducer(movie_rating_info):
    movie_title, ratings = movie_rating_info
    return (movie_title, np.mean(ratings))

def convert_str_to_dict(line):
    """
    Function converts input string to dictionary object. Assumes line has a dictionary like
    structure.
    :param line: input string
    :return: converted dict object
    """
    contents = line[1:-1].strip()  # strip off leading { and trailing }
    items = contents.split(',')  # each individual item looks like key:value
    pairs = [item.split(':', 1) for item in items]  # ("key","value"), both strings
    line_dict = dict((k.strip(), eval(v)) for (k, v) in pairs)  # evaluate values but not strings

    return line_dict

def join_dataset(input_file1, input_file2):

    file1_contents = [convert_str_to_dict(x.strip()) for x in open(input_file1).readlines()
                      if len(x) > 0]
    file2_contents = [convert_str_to_dict(x.strip()) for x in open(input_file2).readlines()
                      if len(x) > 0]

    movie_rating_lst = []
    is_file1_movie_dataset = "id" in file1_contents[0].keys()

    movie_dataset = file2_contents
    rating_dataset = file1_contents
    if is_file1_movie_dataset:
        movie_dataset = file1_contents
        rating_dataset = file2_contents

    for rating_info in rating_dataset:
        r_id = rating_info["movie_id"]
        rating = rating_info["rating"]

        for movie_info in movie_dataset:
            m_id = movie_info["id"]
            movie_title = movie_info["name"]

            if r_id == m_id:
                movie_rating_lst.append((movie_title, rating))

    return movie_rating_lst

if __name__ == '__main__':
    import sys

    input_file1 = sys.argv[1]
    input_file2 = sys.argv[2]

    movie_rating_lst = join_dataset(input_file1, input_file2)
    mapper_reducer = MyMREngine(mapper, reducer)
    avg_movie_ratings = mapper_reducer(movie_rating_lst)

    for movie_rating in avg_movie_ratings:
        print("Movie: {}, Avg. Rating: {}".format(movie_rating[0], movie_rating[1]))
