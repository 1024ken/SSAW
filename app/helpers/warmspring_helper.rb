module WarmspringHelper
  def choose_new_or_edit_warmspring(warmspring=nil)
    if action_name == 'new' || action_name == 'confirm'
      confirm_warmspring_index_path
    elsif action_name == 'edit'
      warmspring_path(warmspring)
    end
  end
end
