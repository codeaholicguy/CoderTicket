require 'rails_helper'

describe EventsController, :type => :routing do
  it 'routes to #index' do
    expect(get: '/events').to route_to('events#index')
  end

  it 'routes to #show' do
    expect(get: '/events/1').to route_to('events#show', id: "1")
  end

  it 'route to #new' do
    expect(get: '/events/new').to route_to('events#new')
  end

  it 'route to #edit' do
    expect(get: '/events/1/edit').to route_to('events#edit', id: "1")
  end

  it 'route to #my-events' do
    expect(get: '/my-events').to route_to('events#my_events')
  end

  it 'route to #publish' do
    expect(get: '/publish').to route_to('events#publish')
  end
end
