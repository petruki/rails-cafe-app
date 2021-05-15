class CourseItem < ApplicationRecord
    belongs_to :course
    belongs_to :category
end
