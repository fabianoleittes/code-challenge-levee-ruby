# frozen_string_literal: true

class JobBlueprint < Blueprinter::Base
  identifier :id

  fields \
    :title,
    :partner_id,
    :category_id,
    :status,
    :expires_at,
    :created_at,
    :updated_at
end
