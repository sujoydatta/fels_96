every 30.day, at: "7:30 am" do
  runner "UserMailer.monthly_statistics.deliver"
end
