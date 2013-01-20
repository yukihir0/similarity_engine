# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SimilarityEngine do
    context 'init' do
        before(:each) do
            @engine = SimilarityEngine.new
        end

        describe '#initialize' do
            context 'no input' do
                it 'should not raise error' do
                    expect {
                        SimilarityEngine.new
                    }.to_not raise_error
                end
            end

            context 'nil input' do
                it 'should raise error' do
                    expect {
                        SimilarityEngine.new(type: nil)
                    }.to raise_error(RuntimeError, SimilarityEngine::INVALID_SIMILARITY_TYPE_ERROR)
                end
            end

            context 'null string input' do
                it 'should raise error' do
                    expect {
                        SimilarityEngine.new(type: '')
                    }.to raise_error(RuntimeError, SimilarityEngine::INVALID_SIMILARITY_TYPE_ERROR)
                end
            end

            context 'invalid type input' do
                it 'should raise error' do
                    expect {
                        SimilarityEngine.new(type: 'invalid type')
                    }.to raise_error(RuntimeError, SimilarityEngine::INVALID_SIMILARITY_TYPE_ERROR)
                end
            end

            context 'type: COSINE input' do
                it 'should not raise error' do
                    expect {
                        SimilarityEngine.new(type: SimilarityEngine::COSINE)
                    }.to_not raise_error
                end
            end

            context 'type: PEARSON input' do
                it 'should not raise error' do
                    expect {
                        SimilarityEngine.new(type: SimilarityEngine::PEARSON)
                    }.to_not raise_error
                end
            end

            context 'type: Tanimoto input' do
                it 'should not raise error' do
                    expect {
                        SimilarityEngine.new(type: SimilarityEngine::TANIMOTO)
                    }.to_not raise_error
                end
            end

            context 'type: EUCLID input' do
                it 'should not raise error' do
                    expect {
                        SimilarityEngine.new(type: SimilarityEngine::EUCLID)
                    }.to_not raise_error
                end
            end
        end

        describe '#analyze' do
            before(:each) do
                @engine = SimilarityEngine.new
            end
            
            context '2 nil vector input' do
                it 'should raise error' do
                    expect {
                        @engine.analyze(nil, nil)
                    }.to raise_error
                end
            end

            context '1 nil vector input' do
                it 'should raise error' do
                    vec_x = nil
                    vec_y = [1, 2, 3]
                    expect {
                        @engine.analyze(vec_x, vec_y)
                    }.to raise_error
                end

                it 'should raise error' do
                    vec_x = [1, 2, 3]
                    vec_y = nil
                    expect {
                        @engine.analyze(vec_x, vec_y)
                    }.to raise_error
                end
            end
            
            context 'null vector input' do
                it 'should raise error' do
                    vec_x = []
                    vec_y = []
                    expect {
                        @engine.analyze(vec_x, vec_y)
                    }.to raise_error
                end
            end

            context 'defferent demension vector input' do
                it 'should raise error' do
                    vec_x = [1, 2, 3]
                    vec_y = [1, 2]
                    expect {
                        @engine.analyze(vec_x, vec_y)
                    }.to raise_error
                end
            end

            context 'valid vector input' do
                it 'should not raise error' do
                    vec_x = [1, 2, 3]
                    vec_y = [4, 5, 6]
                    expect {
                        @engine.analyze(vec_x, vec_y)
                    }.to_not raise_error
                end
            end
        end
    end
end
