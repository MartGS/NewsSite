require 'rails_helper'

RSpec.describe ArticlePolicy, type: :policy do
  let(:user) { create(:user) }

  subject { described_class }

  # permissions :destroy? do
  #   # pending "add some examples to (or delete) #{__FILE__}"
  # end
end
