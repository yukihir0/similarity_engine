# coding: utf-8
require 'similarity_engine/similarity/base_similarity'

module SimilarityEngineSimilarity
  class TanimotoSimilarity < BaseSimilarity

    public
    def initialize
    end

    protected
    def do(vec_x, vec_y)
      sum_sq_x = sum_square(vec_x)
      sum_sq_y = sum_square(vec_y)

      sum_xy = inner_product(vec_x, vec_y)
      deno   = sum_sq_x + sum_sq_y - sum_xy

      deno == 0.0 ? 0.0 : sum_xy / deno
    end
  end
end
