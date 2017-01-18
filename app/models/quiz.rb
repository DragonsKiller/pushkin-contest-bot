class Quiz < ApplicationRecord
    before_create :level_chooser
    API = '3ed02bb8ad74f3afa33b21a3de7929f4'
    def level_chooser
      @poems = Poem.all
      case self.level
      when 1
       first_level
      end
    end

    def first_level
      @poems.each do |poem|
        if poem.context == Unicode::downcase(self.question)
          self.answer = Unicode::upcase(poem.title[0]) + poem.title.delete(poem.title[0])
          answer_sender(self.answer)
        end
      end
    end

    def answer_sender(answer)
      uri = URI("http://pushkin.rubyroidlabs.com/quiz")
      parameters = {
          answer:  answer,
          token:   API,
          task_id: self.id
        }
        Net::HTTP.post_form(uri, parameters)
    end
end
