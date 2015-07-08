# coding: utf-8
require 'similarity_engine/similarity/base_similarity'

module SimilarityEngineSimilarity
  class CosineSimilarity < BaseSimilarity
    public
    def initilize
    end

    protected
    def do(vec_x, vec_y)
      nume = inner_product(vec_x, vec_y)
      deno = abs(vec_x) * abs(vec_y)

      deno == 0.0 ? 0.0 : nume / deno
    end
  end
end
