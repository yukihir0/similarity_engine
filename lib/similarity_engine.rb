# coding: utf-8

require 'similarity_engine/version'
require 'similarity/cosine_similarity'
require 'similarity/pearson_similarity'
require 'similarity/tanimoto_similarity'
require 'similarity/euclid_similarity'

class SimilarityEngine

    COSINE   = 'cosine'
    PEARSON  = 'pearson'
    TANIMOTO = 'tanimoto'
    EUCLID   = 'euclid'

    INVALID_SIMILARITY_TYPE_ERROR = 'RuntimeError: invalid similarity type'
    
    public
    def initialize(options = {type: COSINE})
        get_similarity(options[:type])
    end

    def analyze(vec_x, vec_y)
        @similarity.calculate(vec_x, vec_y)
    end

    private
    def get_similarity(type)
        case type
        when COSINE
            @similarity = CosineSimilarity.new
        when PEARSON
            @similarity = PearsonSimilarity.new
        when TANIMOTO
            @similarity = TanimotoSimilarity.new
        when EUCLID
            @similarity = EuclidSimilarity.new
        else
            raise INVALID_SIMILARITY_TYPE_ERROR
        end
    end

end

