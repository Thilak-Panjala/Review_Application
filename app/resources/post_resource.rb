class PostResource < JSONAPI::Resource
    has_one :movie
end
