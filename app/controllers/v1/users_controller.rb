# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def create
      save_user
    end

    private

    def build_user
      yield(User.new(user_params))
    end

    def save_user
      build_user do |user|
        if user.save
          respond_with_json(
            UserBlueprint.render(
              user,
              root: :user
            ), :created
          )
        else
          respond_with_errors(user)
        end
      end
    end

    def user_params
      params
        .require(:user)
        .permit(
          :name,
          :email,
          :password,
          :password_confirmation
        )
    end
  end
end
