# coding: utf-8
require File.expand_path('spec/spec_helper')
include SimilarityEngineSimilarity

describe CosineSimilarity do
    context 'initialized' do
        before(:each) do
            @similarity = CosineSimilarity.new
        end

        describe '#initialize' do
            context 'kind_of?' do
                it 'should be kind of BaseSimilarity' do
                    @similarity.kind_of?(BaseSimilarity).should be_truthy
                end
            end
        end
        
        describe '#calculate' do
            context 'call' do
                it 'should not raise error' do
                    vec_x = [1, 2, 3]
                    vec_y = [1, 2, 3]
                    expect {
                        @similarity.calculate(vec_x, vec_y)
                    }.to_not raise_error
                end
            end

            context 'vec_x, vec_y input' do
                it 'should be expected value' do
                    list = []
                    
                    # [vec_x, vec_y, expect]
                    list << [ [1, 2, 3],
                              [1, 2, 3],
                              1.0 ]

                    list << [ [0.1, 0.2, 0.3],
                              [0.1, 0.2, 0.3],
                              1.0 ]

                    list << [ [1, 2, 3],
                              [-1, -2, -3],
                              -1.0 ]

                    list << [ [0.1, 0.2, 0.3],
                              [-0.1, -0.2, -0.3],
                              -1.0 ]

                    list << [ [0.789, 0.515, 0.335, 0.0],
                              [0.832, 0.555, 0.0, 0.0],
                              0.942 ]

                    list << [ [0.789, 0.515, 0.335, 0.0],
                              [0.524, 0.465, 0.405, 0.588],
                              0.788 ]

                    list << [ [0.832, 0.555, 0.0, 0.0],
                              [0.524, 0.465, 0.405, 0.588],
                              0.694 ]

                    list << [ [35, 20, 63, 59, 14, 44, 42, 25, 73, 38, 56, 69, 28, 46],
                              [47, 62, 36, 40, 58, 46, 50, 57, 38, 44, 40, 32, 54, 48],
                              0.846 ]

                    list.map { |l|
                        @similarity.calculate(l[0], l[1]).should be_within(0.001).of(l[2])
                    }
                end
            end
        end
    end
end
