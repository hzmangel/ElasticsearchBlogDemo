require 'elasticsearch/model'

class Blog < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :author

  def as_indexed_json(options = {})
    as_json(
      only: [
        :title,
        :content,
        :created_at,
        :updated_at,
      ],
      include: [
        :author
      ]
    )
  end
end
