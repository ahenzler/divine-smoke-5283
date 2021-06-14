class Plant < ApplicationRecord
  has_many :plots_plants
  has_many :plots, through: :plots_plants
  has_many :gardens, through: :plots
end