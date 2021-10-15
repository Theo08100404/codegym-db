SELECT COUNT(chats.chat) AS 投稿数 , chatrooms.chatroom_name
FROM chatrooms
JOIN chats ON chatrooms.id = chats.chatroom_id 
JOIN members
ON chatrooms.create_user_id = members.id
WHERE members.is_deleted <> 1 AND chats.is_deleted <> 1 
GROUP BY chatrooms.chatroom_name
ORDER BY `投稿数` DESC
