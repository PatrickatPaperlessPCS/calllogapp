class AdminController < ApplicationController
  def useradmin
  	@users = current_admin.users
  end
end
