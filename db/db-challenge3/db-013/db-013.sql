BEGIN;
UPDATE members
SET is_deleted = '1' , created_at = CURRENT_TIMESTAMP
WHERE (phonenumber is null OR phonenumber = '') AND (cellphonenumber is null OR cellphonenumber = '');
COMMIT;
