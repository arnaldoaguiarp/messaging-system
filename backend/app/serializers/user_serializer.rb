class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :active

  # Custom attribute: Created a method with the same name
  attribute :member_since

  # Conditional attribute: Only appears if the condition is true
  attribute :last_login_at, if: :is_admin?

  belongs_to :role

  # Custom Methods

  def member_since
    # 'object' refers to the User instance being serialized
    object.created_at.strftime("%d/%m/%Y")
  end

  def is_admin?
    # 'scope' is an object passed from the controller (usually current_user).
    # This allows us to have permission-based logic inside the serializer.
    scope && scope.admin?
  end
end
