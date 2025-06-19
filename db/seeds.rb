require 'faker'


Message.destroy_all
Grade.destroy_all
Submission.destroy_all
Assignment.destroy_all
Enrollment.destroy_all
Course.destroy_all
Project.destroy_all
Student.destroy_all
Teacher.destroy_all
User.destroy_all


5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'teacher'
  )
  Teacher.create!(
    user: user,
    department: Faker::Educator.subject
  )
end


10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    role: 'student'
  )
  student = Student.create!(
    user: user,
    student_number: Faker::Number.unique.number(digits: 6).to_s,
    grade_level: rand(9..12)
  )

  
  2.times do
    Project.create!(
      student: student,
      title: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph,
      approved: [true, false].sample
    )
  end
end

Teacher.all.each do |teacher|
  2.times do
    Course.create!(
      title: Faker::Educator.course_name,
      code: Faker::Alphanumeric.alpha(number: 4).upcase,
      teacher: teacher
    )
  end
end


Course.all.each do |course|
  Student.all.sample(5).each do |student|
    Enrollment.create!(course: course, student: student)
  end
end


Course.all.each do |course|
  2.times do
    Assignment.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      course: course,
      due_date: Faker::Date.forward(days: 30)
    )
  end
end


Assignment.all.each do |assignment|
  assignment.course.students.each do |student|
    submission = Submission.create!(
      assignment: assignment,
      student: student,
      content: Faker::Lorem.paragraph,
      submitted_at: Faker::Time.backward(days: 5)
    )
    Grade.create!(
      submission: submission,
      score: rand(60..100),
      comment: Faker::Lorem.sentence
    )
  end
end


User.all.to_a.combination(2).to_a.sample(10).each do |sender, receiver|
  Message.create!(
    sender: sender,
    receiver: receiver,
    subject: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    sent_at: Faker::Time.backward(days: 3)
  )
end
