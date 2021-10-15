SELECT members.user_name , chatrooms.chatroom_name , chatsA.created_at 
FROM chats AS chatsA 
JOIN (SELECT chatroom_id , MAX(created_at) AS 最新投稿
FROM chats
WHERE chats.is_deleted <> 1 
GROUP BY chatroom_id) AS chatsB 
ON chatsA.chatroom_id = chatsB.chatroom_id 
AND chatsA.created_at = chatsB.最新投稿 
JOIN members 
ON chatsA.chat_user_id = members.id 
JOIN chatrooms ON chatsA.chatroom_id = chatrooms.id 
WHERE members.is_deleted <> 1 
ORDER BY chatrooms.id;
