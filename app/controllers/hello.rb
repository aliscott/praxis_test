module V1
  class Hello
    include Praxis::Controller

    implements V1::ApiResources::Hello

    HELLO_WORLD = [ 'Hello world!', 'Привет мир!', 'Hola mundo!', '你好世界!', 'こんにちは世界！' ]

    def index(**params)
      response.headers['Content-Type'] = 'application/json'
      response.body = HELLO_WORLD.to_json
      response
    end

    def show(id:, **other_params)
      hello = HELLO_WORLD[id]
      if hello
        response.body = { id: id, data: hello }
      else
        self.response = Praxis::Responses::NotFound.new
      end
      response.headers['Content-Type'] = 'application/json'
      response
    end

    def test_get(d:, **other_params)
      response.body = { d: d }
      response.headers['Content-Type'] = 'application/json'
      response
    end

    def test_post(**other_params)
      response.body = { d: request.payload.d }
      response.headers['Content-Type'] = 'application/json'
      response
    end
  end
end
