class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length 
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif count >= @size
      @cache.shift
    end
    @cache << el
  end

  def show
    p @cache
    nil
  end
end
