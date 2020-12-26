require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    user = User.create(email: 'aaa@aa.aa', password: 'cccccc')

    user.cards.create(title: 'abc', content: "abc123")
    user.cards.create(title: 'xyz', content: "123")
    user.cards.create(title: '中文', content: "測試")
  end

  it "可搜尋關鍵字" do
    # Arrange
    # Act
    result = Card.search('123')

    # Assert
    expect(result.count).to be 2
  end
end
