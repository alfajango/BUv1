def seedthanks
  feedback = Feedback.last
  thanks = Thank.create!(feedback: feedback,
  						created: Time.now)

  puts "THANKS"
end