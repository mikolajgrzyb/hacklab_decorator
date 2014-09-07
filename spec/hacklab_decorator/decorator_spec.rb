require 'spec_helper'

describe HacklabDecorator::Decorator do

  let(:project) { create_project }
  let(:product) { double('Product') }
  protect_class HacklabDecorator::Decorator

  context 'InstanceMethods' do
    subject {
      HacklabDecorator::Decorator.new(project)
    }


    it '#object' do
      expect(subject.object).to eq project
    end

    it '#h' do
      view_context = double('view_context')
      controller = ActionController::Base.new
      RequestStore.store[:current_controller] = controller
      expect(controller).to receive(:view_context).and_return(view_context)
      expect(subject.h).to eq(view_context)
    end
  end

  context 'ClassMethods' do

    subject {HacklabDecorator::Decorator.new(product)}

    it '.delegagte_all' do
      HacklabDecorator::Decorator.delegate_all

      items = 5
      my_block = -> {}

      expect(product).to receive(:name)
      expect(product).to receive(:description)
      expect(product).to receive(:price)
      expect(product).to receive(:buy).with(items, my_block)
      expect(product).to receive(:to_s).never
      expect { subject.some_method}.to raise_error(NameError)


      subject.name
      subject.description
      subject.price
      subject.buy(items, my_block)
      subject.to_s
    end

  end



end

