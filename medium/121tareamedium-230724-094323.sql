-- 1. Cuantos Post hay - 1050
select
    count(*) as total
from
    posts;
-- 2. Cuantos Post publicados hay - 543
select
    count(*) as total
from
    posts
where
    published = TRUE;
-- 3. Cual es el Post mas reciente
-- 544 - nisi commodo officia...2024-05-30 00:29:21.277
select
    *
from
    posts
order by
    created_at DESC
LIMIT
    1;
-- 4. Quiero los 10 usuarios con más post, cantidad de posts, id y nombre
/*
4	1553	Jessie Sexton
3	1400	Prince Fuentes
3	1830	Hull George
3	470	Traci Wood
3	441	Livingston Davis
3	1942	Inez Dennis
3	1665	Maggie Davidson
3	524	Lidia Sparks
3	436	Mccoy Boone
3	2034	Bonita Rowe
*/
select
    count(*) as number_posts,
    a.user_id,
    a."name"
from
    users a
    inner join posts b on a.user_id = b.created_by
group by
    a.user_id
order by
    number_posts DESC
limit
    10;
-- 5. Quiero los 5 post con más "Claps" sumando la columna "counter"
/*
692	sit excepteur ex ipsum magna fugiat laborum exercitation fugiat
646	do deserunt ea
542	do
504	ea est sunt magna consectetur tempor cupidatat
502	amet exercitation tempor laborum fugiat aliquip dolore
*/
select
    sum(b.counter) as counter_claps,
    a.title
from
    posts a
    inner join claps b on a.post_id = b.post_id
GROUP by
    b.post_id,
    a.title
order by
    counter_claps desc
LIMIT
    5;
-- 6. Top 5 de personas que han dado más claps (voto único no acumulado ) *count
/*
7	Lillian Hodge
6	Dominguez Carson
6	Marva Joyner
6	Lela Cardenas
6	Rose Owen
*/
select
    count(*) as total_claps,
    a."name"
from
    users a
    inner join claps b on a.user_id = b.user_id
group by
    a."name"
order by
    total_claps desc
limit
    5;
-- 7. Top 5 personas con votos acumulados (sumar counter)
/*
437	Rose Owen
394	Marva Joyner
386	Marquez Kennedy
379	Jenna Roth
364	Lillian Hodge
*/
select
    sum(b.counter) as total_claps,
    a."name"
from
    users a
    inner join claps b on a.user_id = b.user_id
group by
    a."name"
order by
    total_claps desc
limit
    5;
-- 8. Cuantos usuarios NO tienen listas de favoritos creada
-- 329
select
    count(*)
from
    users a
    left join user_lists b on a.user_id = b.user_id
where
    b.user_id is null;
-- 9. Quiero el comentario con id #1
-- Y en el mismo resultado, quiero sus respuestas (visibles e invisibles)
-- Tip: union
/*
1	    648	1905	elit id...
3058	583	1797	tempor mollit...
4649	51	1842	laborum mollit...
4768	835	1447	nostrud nulla...
*/
select
    *
from
    "comments"
where
    comment_id = 1
union
select
    *
from
    "comments"
where
    comment_parent_id = 1;
-- ** 10. Avanzado
-- Investigar sobre el json_agg y json_build_object
-- Crear una única linea de respuesta, con las respuestas
-- del comentario con id 1 (comment_parent_id = 1)
-- Mostrar el user_id y el contenido del comentario
-- Salida esperada:
/*
"[{""user"" : 1797, ""comment"" : ""tempor mollit aliqua dolore cupidatat dolor tempor""}, {""user"" : 1842, ""comment"" : ""laborum mollit amet aliqua enim eiusmod ut""}, {""user"" : 1447, ""comment"" : ""nostrud nulla duis enim duis reprehenderit laboris voluptate cupidatat""}]"
*/
select
    json_agg(
        json_build_object('user', user_id, 'comment', "content")
    )
from
    "comments"
where
    comment_parent_id = 1;
-- ** 11. Avanzado
-- Listar todos los comentarios principales (no respuestas)
-- Y crear una columna adicional "replies" con las respuestas en formato JSON
SELECT
    *,
    (
        select
            json_agg(
                json_build_object('user', user_id, 'comment', "content")
            )
        from
            "comments" b
        where
            b.comment_parent_id = a.comment_id
    ) as replies
from
    "comments" a
where
    comment_parent_id is null;





