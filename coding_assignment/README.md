Coding Assignment
==================

### File and Folder Explanation

* **data**: folder contains all sample data.
* **avg_movie_rating_mr_job.py**: average movie rating MapReduce program that uses python mrjob library.
* **avg_movie_rating_my_mr_engine.py**: average movie rating MapReduce program that uses my MR engine that I built.
* **my_mr_engine.py**: My MapReduce Engine.
* **word_counter.py**: word counting MapReduce program that uses my MapReduce engine.

### Assumptions
1. word_counter.py takes exactly one input file.
2. avg_move_rating_*.py: takes exactly two input files - movie and rating (order of the files does not matter).
3. movie file has the following keys: id & name.
4. rating file has the following keys: user_id, movie_id & rating.
