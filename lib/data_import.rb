# frozen_string_literal: true

class DataImport
  def self.call
    new.call
  end

  def call
    file.each do |row|
      Recipe.create(JSON.parse(row).deep_symbolize_keys)
    end
  end

  def file
    @file ||= File.open('public/recipes.json')
  end
end
