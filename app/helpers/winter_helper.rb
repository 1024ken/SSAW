module WinterHelper
  def choose_new_or_edit_winter
    if action_name == 'new' || action_name == 'confirm'
      confirm_winter_index_path
    elsif action_name == 'edit'
      edit_winter_path
    end
  end
end
