module APIHelper
  def should_assign_attribute(subject, method, value)
    subject.send(method).should eq(value)
  end

  def fixture(resource)
    path = File.join(Bittrex.root, "spec/fixtures/#{resource}.json")
    JSON.parse File.read(path)
  end
end

