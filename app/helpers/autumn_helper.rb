module AutumnHelper
  def choose_new_or_edit_autumn(autumn=nil)
    if action_name == 'new' || action_name == 'confirm'
      confirm_autumn_index_path
    elsif action_name == 'edit'
      autumn_path(autumn)
    end
  end
end
