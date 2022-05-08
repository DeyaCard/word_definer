require 'rspec'
require 'word'
require 'definition'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("will return an empty array when there are no words") do
      expect(Word.all).to eq([])
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("cat", nil)
      word.save()
      word2 = Word.new("dog", nil)
      word2.save()
      expect(Word.all).to eq([word, word2])
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("cow", nil)
      word2 = Word.new("cow", nil)
      expect(word).to eq(word2)
    end
  end

  


  describe('.clear') do
    it("clears all words") do
      word = Word.new("")
