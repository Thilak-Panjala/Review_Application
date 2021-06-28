class MovieResource < JSONAPI::Resource
    attributes :title,:director,:rating
    has_many :posts
    model_name 'Movie'
    filters :title,:director,:rating
end
