class Definition 
  attn_reader :id
  attn_accessot :name, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@total_rows +- 1
  end
  