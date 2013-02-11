# coding: utf-8
require File.expand_path('spec/spec_helper')

describe BaseSimilarity do
    context 'initialized' do
        describe '#calculate' do
            before(:each) do
                @similarity = BaseSimilarity.new
            end

            context 'not array(nil) input' do
                it 'should raise error' do
                    expect {
                        @similarity.calculate(nil, nil)
                    }.to raise_error(RuntimeError, BaseSimilarity::NOT_ARRAY_ERROR)
                end
            end

            context 'not array(string) input' do
                it 'should raise error' do
                    expect {
                        @similarity.calculate('a', 'b')
                    }.to raise_error(RuntimeError, BaseSimilarity::NOT_ARRAY_ERROR)
                end
            end

            context 'not array(integer) input' do
                it 'should raise error' do
                    expect {
                        @similarity.calculate(1, 2)
                    }.to raise_error(RuntimeError, BaseSimilarity::NOT_ARRAY_ERROR)
                end
            end
            
            context 'null vector input' do
                it 'should raise error' do
                    vec_x = []
                    vec_y = []
                    expect {
                        @similarity.calculate(vec_x, vec_y)
                    }.to raise_error(RuntimeError, BaseSimilarity::NULL_VECTOR_ERROR)
                end
            end

            context 'defferent dimension vector input' do
                it 'should raise error' do
                    vec_x = [1, 2, 3]
                    vec_y = [1, 2]
                    expect {
                        @similarity.calculate(vec_x, vec_y)
                    }.to raise_error(RuntimeError, BaseSimilarity::DEFFERENT_DIMENSION_ERROR)
                end
            end

            context 'valid vector input' do
                it 'should raise error' do
                    vec_x = [1, 2, 3]
                    vec_y = [1, 2, 3]
                    expect {
                        @similarity.calculate(vec_x, vec_y)
                    }.to raise_error(RuntimeError, BaseSimilarity::ABSTRACT_METHOD_CALL_ERROR)
                end
            end
        end
    end
end
