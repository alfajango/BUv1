require "spec_helper"

describe UserMailer do
  describe "project_creation" do
    let(:mail) { UserMailer.project_creation }

    it "renders the headers" do
      mail.subject.should eq("Project creation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
