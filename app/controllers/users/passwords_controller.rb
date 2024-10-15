class Users::PasswordsController < Devise::PasswordsController
  def create
    super do |resource|
      if resource.errors.empty?
        flash[:notice] = I18n.t("devise.passwords.user.send_instructions")
      end
    end
  end
end
