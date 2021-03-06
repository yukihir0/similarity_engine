# SimilarityEngine [![Build Status](https://travis-ci.org/yukihir0/similarity_engine.png?branch=master)](https://travis-ci.org/yukihir0/similarity_engine) [![Coverage Status](https://coveralls.io/repos/yukihir0/similarity_engine/badge.svg?branch=master&service=github)](https://coveralls.io/github/yukihir0/similarity_engine?branch=master)

'similarity_engine' provides feature for calculating similarity of vector such as Cosine-similarity.

## Requirements

- ruby >= 2.0

## Install

Add this line to your application's Gemfile:

```
gem 'similarity_engine', :github => 'yukihir0/similarity_engine'
```

And then execute:

```
% bundle install
```

## How to use

```
vec_x = [1, 2, 3]
vec_y = [2, 4, 6]

engine = SimilarityEngine.new
similarity = engine.analyze(vec_x, vec_y)
puts similarity
```

For more information, please see [here](https://github.com/yukihir0/similarity_engine/blob/master/sample/main.rb).

## License

Copyright &copy; 2013 yukihir0
