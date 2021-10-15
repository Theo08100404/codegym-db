SELECT members.user_name AS 参加ユーザー , chatrooms.chatroom_name AS 参加チャットルーム , substring(entries.created_at , 1 , 10) AS 参加日時
FROM entries
JOIN members
ON entries.user_id = members.id
JOIN chatrooms
ON entries.chatroom_id = chatrooms.id
WHERE members.is_deleted <> 1 AND chatrooms.is_deleted <> 1
ORDER BY 参加日時;
