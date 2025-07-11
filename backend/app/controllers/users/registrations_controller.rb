class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 201, message: "Signed up successfully." },
        # data: { user: resource }
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :created
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
