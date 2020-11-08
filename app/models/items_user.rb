class ItemsUser < ApplicationRecord
  belongs_to :items
  belongs_to :user
private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
