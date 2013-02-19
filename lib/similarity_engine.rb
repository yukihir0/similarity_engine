# coding: utf-8
require 'similarity_engine/version'
require 'similarity_engine/similarity/cosine_similarity'
require 'similarity_engine/similarity/pearson_similarity'
require 'similarity_engine/similarity/tanimoto_similarity'
require 'similarity_engine/similarity/euclid_similarity'

class SimilarityEngine
    include SimilarityEngineSimilarity

    public
    def initialize
        to_cosine
    end

    def analyze(vec_x, vec_y)
        @similarity.calculate(vec_x, vec_y)
    end

    def to_cosine
        @similarity = CosineSimilarity.new
        self
    end

    def to_pearson
        @similarity = PearsonSimilarity.new
        self
    end

    def to_tanimoto
        @similarity = TanimotoSimilarity.new
        self
    end

    def to_euclid
        @similarity = EuclidSimilarity.new
        self
    end
end
