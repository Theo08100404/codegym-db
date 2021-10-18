BEGIN;
UPDATE tasks
SET is_finished = '1' , update_user_id = '1' , updated_at = CURRENT_TIMESTAMP
WHERE created_at between '2020/4/26 09:00' AND '2020/4/26 11:30' AND is_deleted <> 1;
COMMIT;
