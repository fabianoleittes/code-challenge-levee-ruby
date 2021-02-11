# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id

  fields \
    :name,
    :email,
    :password_digest,
    :created_at,
    :updated_at
end
