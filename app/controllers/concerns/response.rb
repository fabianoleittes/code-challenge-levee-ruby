module Response
  def respond_with_json(resource, status = :ok)
    render json: resource, status: status
  end

  def respond_with_errors(resource, status = :unprocessable_entity)
    errors = { errors: resource.errors.messages }

    render json: errors,
           status: status
  end
end
