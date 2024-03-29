# Use this file to define your response templates and traits.
#
# For example, to define a response template:
#   response_template :custom do |media_type:|
#     status 200
#     media_type media_type
#   end
Praxis::ApiDefinition.define do
  response_template :not_found do
    status 404
  end
  trait :versionable do
    headers do
      header :X_Api_Version, String, values: ['1.0'], required: true
    end
  end
end
