# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
include SimilarityEngineSimilarity

describe SimilarityEngine do
    context 'uninitialized' do
        describe '#initialize' do
            context 'when call' do
                it 'CosineSimilarity' do
                    engine = SimilarityEngine.new
                    engine.instance_eval('@similarity').instance_of?(CosineSimilarity).should be_true
                end
            end
        end
    end

    context 'initialized' do
        before(:each) do
            @engine = SimilarityEngine.new
        end

        describe '#analyze' do
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

        describe '#to_cosine' do
            context 'when call' do
                it 'CosineSimilarity' do
                    @engine.to_cosine
                    @engine.instance_eval('@similarity').instance_of?(CosineSimilarity).should be_true
                end
            end
        end

        describe '#to_pearson' do
            context 'when call' do
                it 'PearsonSimilarity' do
                    @engine.to_pearson
                    @engine.instance_eval('@similarity').instance_of?(PearsonSimilarity).should be_true
                end
            end
        end

        describe '#to_tanimoto' do
            context 'when call' do
                it 'PearsonSimilarity' do
                    @engine.to_tanimoto
                    @engine.instance_eval('@similarity').instance_of?(TanimotoSimilarity).should be_true
                end
            end
        end

        describe '#to_euclid' do
            context 'when call' do
                it 'EuclidSimilarity' do
                    @engine.to_euclid
                    @engine.instance_eval('@similarity').instance_of?(EuclidSimilarity).should be_true
                end
            end
        end
    end
end
