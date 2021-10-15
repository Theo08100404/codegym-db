SELECT id , chatroom_name , description , is_file_sendable,
CASE is_file_sendable WHEN '1' THEN '許可'
WHEN '0' THEN '禁止' ELSE '値が入力されていません' END AS is_file_sendable,
is_direct_chat , create_user_id , created_at , update_user_id , updated_at , is_deleted
FROM chatrooms
WHERE is_deleted <>1 AND description LIKE '%ダイレクトチャット'
ORDER BY id ASC;
