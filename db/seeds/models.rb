# frozen_string_literal: true

@logger.debug '-- Adding manufacturers and models --'

file = File.read(Rails.root.join('db/seeds', 'fixtures/models.json'))
manufacturers_hash = JSON.parse(file)

manufacturers_hash.each do |manufacturer, models|
  models.map! { |model| { name: model } }
  Manufacturer.create!(name: manufacturer).tap do |record|
    record.models.create(models)
  end
end
