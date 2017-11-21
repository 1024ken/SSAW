module WinterHelper
  def choose_new_or_edit_winter(winter=nil)
    if action_name == 'new' || action_name == 'confirm'
      confirm_winter_index_path
    elsif action_name == 'edit'
      winter_path(winter)
    end
  end
end
