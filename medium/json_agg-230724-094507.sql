CREATE
OR REPLACE FUNCTION comment_replies(id INTEGER) RETURNS json LANGUAGE plpgsq
$function$ 
DECLARE result json;
BEGIN
	select
	    json_agg(
	        json_build_object(
	            'user',
	            comments.user_id,
	            'comment',
	            comments.content
	        )
	    ) into result
	from
	    comments
	where
	    comment_parent_id = id;
	return result
END;
$function$
select
    comment_replies(1);