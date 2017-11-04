module AutumnHelper
  def choose_new_or_edit_autumn
    if action_name == 'new' || action_name == 'confirm'
      confirm_autumn_index_path
    elsif action_name == 'edit'
      edit_autumn_path
    end
  end
end
