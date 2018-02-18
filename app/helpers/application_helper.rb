require 'json'

module ApplicationHelper
  attr_accessor :edit_columns, :list_columns
  attr_writer :topic

  def top_menus
    %i(molecule_topics molecule_cals molecule_logins)
  end

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

  def topic
    @topic ||= Molecule::Topic.find_by(id: params[:topic_id])
  end

  def render_cal(day)
    cal = Molecule::Cal.by_date(day)
    wday = Time.new(year,month,day).wday
    render 'cal', day: day, wday: wday, cal: cal
  end

  def login_page?
    controller_path == 'devise/sessions' && action_name == 'new'
  end

  def session_button
    boss_signed_in? ? link_to(t('.logout'), destroy_boss_session_path, method: :delete, class: 'btn btn-default') : login_button
  end

  def login_button
    link_to t('.login'), :new_boss_session, class: 'btn btn-default'
  end
end
