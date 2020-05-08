# frozen_string_literal: true

ENV['SEEDING'] = 'true'

@logger = Logger.new(STDOUT)
@logger.formatter = proc { |_severity, _time, _progname, msg| "#{msg}\n" }

@logger.debug '**** SEEDING DATABASE ****'

seeds_dir = Rails.root.join('db/seeds')

@logger.debug '-- Cleaning up database --'

[
  Car,
  Model,
  Manufacturer,
  User
].each(&:destroy_all)

load seeds_dir.join('models.rb')

@logger.debug '**** FINISHED SEEDING DATABASE ****'
