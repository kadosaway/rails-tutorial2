class Molecule::CommentsController < ApplicationController
  def list_columns
    %i(topic_name id name explanation updated_at created_at)
  end

  def edit_columns
    %i(topic_id name explanation)
  end

  def show_columns
    %i(id topic_name name explanation updated_at created_at)
  end
end
