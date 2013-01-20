# coding: utf-8

module CommonAlgorithm
    def sum(vec)
        vec.inject(0.0) { |sum, v|
            sum += v
        }
    end

    def sum_square(vec)
        vec.inject(0.0) { |sum, v|
            sum += v**2
        }
    end

    def abs(vec)
        Math::sqrt(sum_square(vec))
    end

    def sum_diff_square(vec_x, vec_y)
        sum = 0.0
        vec_x.zip(vec_y) { |x, y|
            sum += (x - y)**2
        }
        sum
    end

    def euclid_distance(vec_x, vec_y)
        Math::sqrt(sum_diff_square(vec_x, vec_y))
    end

    def inner_product(vec_x, vec_y)
        result = 0.0
        vec_x.zip(vec_y) { |x, y|
            result += x * y
        }
        result 
    end
end
