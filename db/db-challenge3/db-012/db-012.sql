BEGIN;
UPDATE chatrooms
SET is_file_sendable = '0' , update_user_id = '1' , updated_at = CURRENT_TIMESTAMP
WHERE chatrooms.create_user_id <> 1 AND chatrooms.is_direct_chat = 0;
COMMIT;
