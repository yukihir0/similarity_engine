# coding: utf-8
require 'similarity/base_similarity'

module SimilarityEngineSimilarity
    class EuclidSimilarity < BaseSimilarity

        public
        def initialize
        end

        protected
        def do(vec_x, vec_y)
            1.0 / (1.0 + euclid_distance(vec_x, vec_y))
        end
    end
end
