require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("snake", nil)
    @word.save()
  end

  describe('#==') do
    is("is the same definition if it has the attributes as another definition") do
      definition = Definition.new("cold-blooded animal", @word.id, nil)
      definition2 = Definition.new("cold-blooded animal", @word.id, nil)
      expect(definition).to eq(definition2)
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("cold-blooded animal", @word.id, nil)
      definition.save()
      definition2 = Definition.new("reptile", @word.id, nil)
      definition2.save()
      expect(Definition.all).to eq([definition, definition2])
    end
  end

  describe('.clear') do
    it("will clear all definitions") do
      definition = Definition.new("cold-blooded animal", @word.id, nil)
      definition.save()
      definition2 = Definition.new("reptile", @word.id, nil)
      definition2.save()
      Definition.clear
      expect(Definition.all).to eq([])
    end
  end

  describe('#save')
    it("saves a definition") do
      definition = Definition.new("cold-bloodedc animal", @word.id, nil)
      definition.save()
      expect(Definition.all).to eq([definition])
    end
  end

  describe('.') do
    it("returns a list of all definitions") do
      definition = Definition.new("cold-blooded animal", @word.id, nil)
      definition.save()
      definition2 = Definition.new("reptile", @word.id, nil)
      definition2.save()
      expect(Definition.all).to eq([definition, definition2])
    end
  end





