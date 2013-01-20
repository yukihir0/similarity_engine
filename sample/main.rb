# coding: utf-8

require 'similarity_engine'
require_relative 'utility/vector_convertor'

LADY     = 'Lady in the Water'
SNAKES   = 'Snakes on a Plane'
JUST     = 'Just My Luck'
SUPERMAN = 'Superman Returns'
YOU      = 'You, Me and Dupree'
NIGHT    = 'The Night Listener'

lisa_rose =        { LADY     => 2.5, 
                     SNAKES   => 3.5,
                     JUST     => 3.0,
                     SUPERMAN => 3.5,
                     YOU      => 2.5,
                     NIGHT    => 3.0
                   }
gene_seymour =     { LADY     => 3.0,
                     SNAKES   => 3.5,
                     JUST     => 1.5,
                     SUPERMAN => 5.0,
                     NIGHT    => 3.0,
                     YOU      => 3.5
                   }
michael_phillips = { LADY     => 2.5,
                     SNAKES   => 3.0,
                     SUPERMAN => 3.5,
                     NIGHT    => 4.0
                   }
claudia_puig =     { SNAKES   => 3.5,
                     JUST     => 3.0,
                     NIGHT    => 4.5,
                     SUPERMAN => 4.0,
                     YOU      => 2.5
                   }
mick_lasalle =     { LADY     => 3.0,
                     SNAKES   => 4.0,
                     JUST     => 2.0,
                     SUPERMAN => 3.0,
                     NIGHT    => 3.0,
                     YOU      => 2.0
                   }
jack_matthews =    { LADY     => 3.0,
                     SNAKES   => 4.0,
                     NIGHT    => 3.0,
                     SUPERMAN => 5.0,
                     YOU      => 3.5
                   }
toby =             { SNAKES   => 4.5,
                     YOU      => 1.0,
                     SUPERMAN => 4.0
                   }

critics = [ lisa_rose,
            gene_seymour,
            michael_phillips,
            claudia_puig,
            mick_lasalle,
            jack_matthews,
            toby ]

def print_matrix(type, critics)
    convertor = VectorConvertor.new
    engine    = SimilarityEngine.new(type: type)

    print_header(type)

    critics.map { |row|
        critics.map { |column|
            vec_x, vec_y = convertor.same_dimension_vec(row, column)
            similarity   = engine.analyze(vec_x, vec_y)
            print "% .5f "%similarity
        }
        puts
    }

    print_footer(type)
end

def print_header(type)
    puts "--- #{type} ---"
end

def print_footer(type)
    puts "-"*(type.length + 8), ''
end


# main
print_matrix(SimilarityEngine::COSINE, critics)
print_matrix(SimilarityEngine::PEARSON, critics)
print_matrix(SimilarityEngine::TANIMOTO, critics)
print_matrix(SimilarityEngine::EUCLID, critics)

