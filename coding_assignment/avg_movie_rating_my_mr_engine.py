from my_mr_engine import MyMREngine


def mapper(file1, file2):
    file1_dict_lst = [convert_str_to_dict(x.strip()) for x in open(file1) if len(x) > 0]
    file2_dict_lst = [convert_str_to_dict(x.strip()) for x in open(file2) if len(x) > 0]

    movie_rating_dict_lst = join_movie_rating_dataset(file1_dict_lst, file2_dict_lst)

    for info in movie_rating_dict_lst:
        movie_title = info["movie_title"]
        rating = info["rating"]
        print(movie_title + ", " + rating)
        yield movie_title, rating


def reducer(id, val):
    movie_name = ''
    num_elements = 0
    total_score = 0.0

    for v in val:
        if len(v[0]) > 0:
            movie_name = v[0]
        else:
            num_elements += 1
            total_score += v[1]

    yield movie_name, total_score / num_elements


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


def join_movie_rating_dataset(dict_lst1, dict_lst2):
    movie_rating_lst = []
    is_dict1_movie_dataset = "id" in dict_lst1[0].keys()

    movie_dataset = dict_lst2
    rating_dataset = dict_lst1
    if is_dict1_movie_dataset:
        movie_dataset = dict_lst1
        rating_dataset = dict_lst2

    for rating_info in rating_dataset:
        r_id = rating_info["movie_id"]
        rating = rating_info["rating"]
        movie_rating_dict = {}

        for movie_info in movie_dataset:
            m_id = movie_info["id"]
            movie_title = movie_info["name"]

            if r_id == m_id:
                movie_rating_dict["movie_title"] = movie_title
                movie_rating_dict["rating"] = rating
                movie_rating_lst.append(movie_rating_dict)

    return movie_rating_lst


if __name__ == '__main__':
    import sys

    input_file1 = sys.argv[1]
    input_file2 = sys.argv[2]

    mapper = MyMREngine(mapper, reducer)

    word_counts = mapper(input_file1, input_file2)
