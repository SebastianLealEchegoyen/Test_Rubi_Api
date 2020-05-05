class Task < ApplicationRecord
    validates :name, presence: true
    validates :dueDate, presence: true
end
