json.extract! quiz, :id, :question, :answer, :level, :user_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)