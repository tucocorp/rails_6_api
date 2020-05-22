require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  # User signup test suite
  describe 'POST /api/v1/signup' do
    let(:password) { Faker::Internet.password }
    let(:valid_attributes) { { name: Faker::Name.name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password, password_confirmation: password}.to_json }

    context 'when valid request' do
      before { post '/api/v1/signup', params: valid_attributes, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(Message.account_created)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/api/v1/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(Message.invalid_validations)
      end
    end
  end
end
