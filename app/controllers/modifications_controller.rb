class ModificationsController < ApplicationController
  # def create
  #   @notification = Notification.find(params[:notification_id])
  #   @modification = Modification.new(modification_params)
  #   @modification.notification = @notification
  #   @modification.user = current_user
  #   if @modification.save
  #     NotificationChannel.broadcast_to(
  #       @notification,
  #       {
  #         modification_html: render_to_string(partial: "modification", locals: { modification: @modification }),
  #         sender_id: @modification.user.id
  #       }
  #     )
  #     head :ok
  #     # redirect_to notification_path(@notification, anchor: "modification#{@message.id}")
  #   else
  #     render "notifications/show", status: :unprocessable_entity
  #   end
  # end

  # private

  # def message_params
  #   params.require(:message).permit(:content)
  # end
end
