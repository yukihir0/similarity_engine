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
           
            if deno == 0.0
                return 0.0       
            else
                return nume / deno
            end
        end
    end
end
