# frozen_string_literal: true

class DataImport
  def self.call
    new.call
  end

  def call
    file.each do |row|
      row_data = JSON.parse(row).deep_symbolize_keys
      row_data[:ingredient_text] = row_data[:ingredients].join(' ')
      Recipe.create(row_data)
    end
  end

  def file
    @file ||= File.open('public/recipes.json')
  end
end
