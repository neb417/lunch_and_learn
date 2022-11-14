class RecipePoro
  attr_reader :url, :title, :image

  def initialize(data)
    @url = data[:recipe][:uri]
    @title = data[:recipe][:label]
    @image = data[:recipe][:image]
  end
end
