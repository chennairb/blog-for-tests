require 'spec_helper'

describe "comments/index" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :body => "MyText",
        :author_name => "Author Name",
        :post_id => ""
      ),
      stub_model(Comment,
        :body => "MyText",
        :author_name => "Author Name",
        :post_id => ""
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Author Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
