BEGIN;
DELETE entries.*
FROM entries
RIGHT JOIN members
ON entries.user_id = members.id
WHERE members.is_deleted = '1';
COMMIT;
