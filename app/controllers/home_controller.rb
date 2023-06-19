# frozen_string_literal: true

# Controller responsible for handling home-related actions and views.
class HomeController < ApplicationController
  def index
    @theme = dark_mode_enabled? ? 'Dark' : 'Light'
  end

  private

  def dark_mode_enabled?
    user = StatsigUser.new(user_id: '1')
    Statsig.check_gate(user, 'dark_mode_enabled')
  end
end
