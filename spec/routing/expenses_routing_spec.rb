require 'rails_helper'

RSpec.describe ExpensesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories/1/expenses').to route_to('expenses#index', category_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/categories/1/expenses/new').to route_to('expenses#new', category_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/categories/1/expenses/1').to route_to('expenses#show', id: '1', category_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/categories/1/expenses/1/edit').to route_to('expenses#edit', id: '1', category_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/categories/1/expenses').to route_to('expenses#create', category_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/categories/1/expenses/1').to route_to('expenses#update', id: '1', category_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/categories/1/expenses/1').to route_to('expenses#update', id: '1', category_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/categories/1/expenses/1').to route_to('expenses#destroy', id: '1', category_id: '1')
    end
  end
end
