# coding: utf-8
require  'similarity_engine/similarity/base_similarity'

module SimilarityEngineSimilarity
  class PearsonSimilarity < BaseSimilarity

    public
    def initialize
    end

    protected
    def do(vec_x, vec_y)
      n = vec_x.length

      sum_x = sum(vec_x)
      sum_y = sum(vec_y)

      sum_sq_x = sum_square(vec_x)
      sum_sq_y = sum_square(vec_y)

      sum_xy = inner_product(vec_x, vec_y)

      sxx = sum_sq_x - (sum_x**2 / n)
      syy = sum_sq_y - (sum_y**2 / n)
      sxy = sum_xy   - (sum_x * sum_y / n)

      deno = Math.sqrt(sxx * syy)

      if deno == 0.0
        return 0.0
      else
        return sxy / deno
      end
    end
  end
end
