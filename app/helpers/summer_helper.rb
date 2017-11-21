module SummerHelper
  def choose_new_or_edit_summer(summer=nil)
    if action_name == 'new' || action_name == 'confirm'
      confirm_summer_index_path
    elsif action_name == 'edit'
      summer_path(summer)
    end
  end
end
