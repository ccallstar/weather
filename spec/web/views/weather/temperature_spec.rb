require_relative '../../../spec_helper'

describe Web::Views::Weather::Temperature do
	let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/weather/temperature.html.erb') }
  let(:view)      { Web::Views::Weather::Temperature.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays a temperature' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
