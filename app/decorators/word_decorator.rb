class WordDecorator < Draper::Decorator
  delegate_all

 class << self
    def fetch_words
      words = $redis.get "words"
      if words.nil?
        words = Word.all.to_json
        $redis.set "words", words
      end
      @words = JSON.load words
    end
  end
end
