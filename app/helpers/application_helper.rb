require 'json'

module ApplicationHelper
  attr_accessor :instance, :edit_columns

  # 読み込んで
  def jload(json_file_path)
    open(json_file_path) do |io|
      JSON.load(io)
    end
  end

# 更新して
# json_data['hoge'] = 'fuga'

# 保存する
  def jsave(json_file_path)
    open(json_file_path, 'w') do |io|
      JSON.dump(json_data, io)
    end
  end
end
