module WarmspringHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_warmspring_index_path
    elsif action_name == 'edit'
      edit_warmspring_path
    end
  end
end
