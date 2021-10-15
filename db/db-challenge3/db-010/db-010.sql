SELECT members.user_name , MAX(chats.created_at) , chatrooms.chatroom_name
FROM members
JOIN chats
ON members.id = chats.chat_user_id
JOIN chatrooms
ON chats.chatroom_id = chatrooms.id
WHERE members.is_deleted <> 1 AND chats.is_deleted <> 1
GROUP BY chatrooms.chatroom_name
ORDER BY chatrooms.id;
