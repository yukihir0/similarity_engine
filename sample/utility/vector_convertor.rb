# coding: utf-8

class VectorConvertor
    public
    def initialize
    end

    def same_dimension_vec(hash_x, hash_y)
        keys  = union_keys(hash_x, hash_y)
        vec_x = fix_vector_dimension(keys, hash_x)
        vec_y = fix_vector_dimension(keys, hash_y)
        return vec_x, vec_y
    end

    private
    def union_keys(hash_x, hash_y)
        (hash_x.keys + hash_x.keys).uniq.sort
    end

    def fix_vector_dimension(keys, hash)
        keys.inject(Array.new) { |vec, key|
            if hash.keys.include?(key)
                vec << hash[key]
            else
                vec << 0
            end
        }
    end
end

