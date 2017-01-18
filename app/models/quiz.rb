class Quiz < ApplicationRecord
    before_create :level_chooser

    def level_chooser
      @poems = Poem.all
      case self.level
      when 1
       first_level
      end
      answer_sender
    end

    def first_level
      @poems.each do |poem|
        if poem.context == self.question
          self.answer = poem.title
        end
      end
    end

    def answer_sender
      uri = URI("http://pushkin.rubyroidlabs.com/quiz")
      parameters = {
          answer:  self.answer,
          token:   '3ed02bb8ad74f3afa33b21a3de7929f4',
          task_id: self.user_id
        }
        Net::HTTP.post_form(uri, parameters)
    end
end
