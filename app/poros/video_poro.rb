class VideoPoro
  attr_reader :id, :title

  def initialize(data, id)
    @title = data[:items].first[:snippet][:title]
    @id = id
  end
end
