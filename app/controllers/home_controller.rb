class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :require_admin

  def index
    if Conference.count == 0
      redirect_to new_conference_path and return
    end
    @audits = Audit.reorder("created_at DESC").limit(5)
  end
end
