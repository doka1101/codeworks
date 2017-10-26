from mrjob.job import MRJob

class MRAvgMovieRating(MRJob):

    def convert_str_to_dict(self,line):
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

    def mapper(self, _, line):
        line_dict = self.convert_str_to_dict(line)

        rating = 0.0
        id = 0
        name = ""

        # grab id of the movie, and corresponding rating(s)
        if "rating" in line_dict.keys():
             id = line_dict["movie_id"]
             rating = line_dict["rating"]

        # grab id of the movie, and corresponding title
        if "name" in  line_dict.keys():
             id = line_dict["id"]
             name = line_dict["name"]

        yield id, (name, rating)

    def reducer(self, id, val):
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


if __name__ == '__main__':
    MRAvgMovieRating.run()

