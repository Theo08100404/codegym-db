BEGIN;
UPDATE chatrooms 
SET is_file_sendable = '0' , update_user_id = '1' , updated_at =CURRENT_TIMESTAMP
WHERE chatrooms.is_deleted = 0 AND chatrooms.id NOT IN(
SELECT chatroomsB.id 
FROM
(SELECT chatrooms.id FROM entries
 LEFT OUTER JOIN chatrooms 
 ON entries.chatroom_id = chatrooms.id
 WHERE EXISTS(SELECT * FROM members WHERE entries.user_id =1 = members.id =1) AND chatrooms.is_deleted = 0 ) AS chatroomsB );
 COMMIT;
