# coding: utf-8

require 'similarity/common_algorithm'

class BaseSimilarity
    include CommonAlgorithm

    NOT_ARRAY_ERROR            = 'RuntimeError: not array error' 
    NULL_VECTOR_ERROR          = 'RuntimeError: null vector error'
    DEFFERENT_DIMENSION_ERROR  = 'RuntimeError: defferent dimeision error'
    ABSTRACT_METHOD_CALL_ERROR = 'RuntimeError: not override error'

    public
    def initialize
    end

    def calculate(vec_x, vec_y)
        raise NOT_ARRAY_ERROR if is_not_array?(vec_x, vec_y)
        raise NULL_VECTOR_ERROR if is_null_vector?(vec_x, vec_y)
        raise DEFFERENT_DIMENSION_ERROR if is_defferent_demension?(vec_x, vec_y)
        
        self.do(vec_x, vec_y)
    end

    protected
    # abstract template method
    def do(vec_x, vec_y)
        raise ABSTRACT_METHOD_CALL_ERROR 
    end

    private
    def is_not_array?(vec_x, vec_y)
        !( vec_x.instance_of?(Array) && vec_y.instance_of?(Array) )
    end

    def is_defferent_demension?(vec_x, vec_y)
        vec_x.length != vec_y.length
    end
    
    def is_null_vector?(vec_x, vec_y)
        vec_x.empty? || vec_y.empty?
    end
end
