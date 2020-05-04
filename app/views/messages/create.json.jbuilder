json.id      @message.id
json.content @message.content 
json.date    @message.created_at.strftime("%Y/%m/%d %H:%M")
json.user_name @message.user.nickname
json.user_id @message.user.id
json.user_image @message.user.image
