class WordService
  def initialize word
    @word = word
  end

  def save
    if @word.save
      CacheService.new(@word).save_word_to_cache
      true
    else
      false
    end
  end

  def update word_params
    if @word.update_attributes word_params
      CacheService.new(@word).update_word_to_cache
      true
    else
      false
    end
  end

  def destroy
    if @word.valid?
      CacheService.new(@word).delete_word_from_cache
      @word.destroy
      true
    else
      false
    end
  end
end
