module SummerHelper
  def choose_new_or_edit_summer
    if action_name == 'new' || action_name == 'confirm'
      confirm_summer_index_path
    elsif action_name == 'edit'
      edit_summer_path
    end
  end
end
