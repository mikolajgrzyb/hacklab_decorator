require 'spec_helper'

describe HacklabDecorator::Decoratable do
  subject {create_project}

  describe '#decorate' do
    it 'returns object decorator' do
      expect(subject.decorate).to be_a(ProjectDecorator)
      expect(subject.decorate.object).to eq subject
    end

    it 'with option' do
      expect(subject.decorate(with: MyProjectDecorator)).to be_a(MyProjectDecorator)
    end
  end



end