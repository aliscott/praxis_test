module V1
  module ApiResources
    class Hello
      include Praxis::ResourceDefinition

      media_type V1::MediaTypes::Hello
      version '1.0'

      routing do
        prefix '/api/hello'
      end

      action :index do
        use :versionable

        routing do
          get ''
        end
        response :ok
      end

      action :show do
        use :versionable

        routing do
          get '/:id'
        end
        params do
          attribute :id, Integer, required: true, min: 0
        end
        response :ok
        response :not_found
      end

      action :test_get do
        use :versionable

        routing do
          get '/test/get'
        end
        params do
          attribute :d, String, required: true
        end
        response :ok
      end

      action :test_post do
        use :versionable

        routing do
          post '/test/post'
        end
        payload do
          attribute :d, String, required: true
        end
        response :ok
      end
    end
  end
end
