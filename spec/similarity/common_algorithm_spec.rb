# coding: utf-8
require File.expand_path('spec/spec_helper')

describe CommonAlgorithm do
    include CommonAlgorithm
    context 'init' do
        describe '#sum' do
            context 'vec input' do
                it 'should be expected value' do
                    list = []

                    #[ vec, expect]
                    list << [ [1, 2, 3], 6 ]
                    list << [ [0.1, 0.2, 0.3], 0.6 ]
                    list << [ [0.111, 0.222, 0.333], 0.666 ]
                    list << [ (1..100).to_a, 5050 ]

                    list.map { |l|
                        sum(l[0]).should be_within(0.001).of(l[1])
                    }
                end
            end
        end

        describe '#sum_square' do
            context 'vec input' do
                it 'should be expected value' do
                    list = []

                    # [vec, expect]
                    list << [ [1, 2, 3], 14 ]
                    list << [ [0.1, 0.2, 0.3], 0.14 ]
                    list << [ [0.111, 0.222, 0.333], 0.172 ]
                    list << [ (1..100).to_a, 338350 ]

                    list.map { |l|
                        sum_square(l[0]).should be_within(0.001).of(l[1])
                    }
                end
            end
        end

        describe '#abs' do
            context 'vec input' do
                it 'should be expected value' do
                    list = []

                    # [vec, expect]
                    list << [ [1, 2, 3], 3.741 ]
                    list << [ [0.1, 0.2, 0.3], 0.374 ]
                    list << [ [0.111, 0.222, 0.333], 0.415 ]
                    list << [ (1..100).to_a, 581.678 ]

                    list.map { |l|
                        abs(l[0]).should be_within(0.001).of(l[1])
                    }
                end
            end
        end

        describe '#sum_dff_square' do
            context 'vec_x, vec_y input' do
                it 'should be expected value' do
                    list = []

                    # [vec_x, vec_y, expect]
                    list << [ [1, 2, 3],
                              [2, 4, 6],
                              14 ]

                    list << [ [0.1, 0.2, 0.3],
                              [0.2, 0.4, 0.6],
                              0.14 ]

                    list << [ [0.111, 0.222, 0.333],
                              [0.222, 0.444, 0.666],
                              0.172 ]

                    list << [ (1..100).to_a,
                              (1..100).to_a.map { |i| i = i * 2 }, 
                              338350 ]

                    list.map { |l|
                        sum_diff_square(l[0], l[1]).should be_within(0.001).of(l[2])
                    }
                end
            end
        end

        describe '#euclid_distance' do
            context 'vec_x, vec_y input' do
                it 'should be expected value' do
                    list = []

                    # [vec_x, vec_y, expect]
                    list << [ [1, 2, 3],
                              [2, 4, 6],
                              3.741 ]

                    list << [ [0.1, 0.2, 0.3],
                              [0.2, 0.4, 0.6],
                              0.374 ]

                    list << [ [0.111, 0.222, 0.333],
                              [0.222, 0.444, 0.666],
                              0.415 ]

                    list << [ (1..100).to_a,
                              (1..100).to_a.map { |i| i = i * 2 },
                              581.678 ]
                    
                    list.map { |l|
                        euclid_distance(l[0], l[1]).should be_within(0.001).of(l[2])
                    }
                end
            end
        end

        describe '#inner_product' do
            context 'vec_x, vec_y input' do
                it 'should be expected value' do
                    list = []

                    # [vec_x, vec_y, expect]
                    list << [ [1, 2, 3],
                              [3, 2, 1],
                              10 ]

                    list << [ [0.1, 0.2, 0.3],
                              [0.3, 0.2, 0.1],
                              0.1 ]

                    list << [ [0.111, 0.222, 0.333],
                              [0.333, 0.222, 0.111],
                              0.123 ]
            
                    list << [ (1..100).to_a,
                              (1..100).to_a,
                              338350 ]

                    list.map { |l|
                        inner_product(l[0], l[1]).should be_within(0.001).of(l[2])
                    }
                end
            end
        end
    end
end
