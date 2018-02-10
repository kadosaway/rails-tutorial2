class Molecule::TopicsController < ApplicationController
  def list_columns
    %i(id name explanation updated_at created_at action)
  end
end
