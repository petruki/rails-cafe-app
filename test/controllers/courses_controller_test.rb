require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get courses_path
    assert_response :success
  end

  test "should delete a course - Can Delete" do
    course = courses(:can_delete)
    
    assert_difference("Course.count", -1) do
      delete course_url(course)
    end

    assert_redirected_to courses_path

    # Validate DB
    p_unit = PricingUnit.where(course_id: course.id).count
    assert p_unit == 0
  end

  test "should not delete a course - Reason: associated to a course" do
    course = courses(:spaghetti)
    
    assert_difference("Course.count", 0) do
      delete course_url(course)
    end

    assert_redirected_to courses_path
  end

  test "should create a course" do
    assert_difference("Course.count", +1) do
      post "/courses", params: { course: { name: "New course" } }
    end

    # Validate DB
    assert Course.where(name: "New course").count == 1
  end

  test "should edit a course" do
    course = courses(:spaghetti)
    assert_difference("Course.where(name: 'Edited course').count", 1) do
      patch "/courses/#{course.id}", params: { course: { name: "Edited course" } }
    end
  end
end
