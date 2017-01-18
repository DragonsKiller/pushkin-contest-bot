class Quiz < ApplicationRecord
    before_create :level_chooser

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
          self.answer = poem.title
          answer_sender(self.answer)
        end
      end
    end

    def answer_sender(answer)
      uri = URI("http://pushkin.rubyroidlabs.com/quiz")
      parameters = {
          answer:  answer,
          token:   '3ed02bb8ad74f3afa33b21a3de7929f4',
          task_id: self.id
        }
        Net::HTTP.post_form(uri, parameters)
    end
end
