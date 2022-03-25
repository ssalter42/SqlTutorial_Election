select '1. Who is club member #5?';

select name
  from clubMembers
 where id = 5;

select '2. What is club member #5''s favorite color?';

select favoriteColor
  from clubMembers
 where id = 5;

select '3. Whose favorite color is blue?';

select name
  from clubMembers
 where favoriteColor = 'blue';

select '4. Who doesn''t have a favorite color?';

select name
  from clubMembers
 where favoriteColor is null;

select '5. How many club members are there?';

select count(*)
  from clubMembers;

select '6. How many club members are in 10th grade?';

select count(*)
  from clubMembers
 where grade = 10;

select '7. Who did club member #6 vote for?';

select c.name
  from votes v
  join clubMembers c on c.id = v.candidateId
 where v.voterId = 6;

select '8. Who did Beth vote for?';

select c2.name
  from votes v
  join clubMembers c1 on c1.id = v.voterId
  join clubMembers c2 on c2.id = v.candidateId
 where c1.name = 'Beth';

select '9. Who voted for Beth?';

select c1.name
  from votes v
  join clubMembers c1 on c1.id = v.voterId
  join clubMembers c2 on c2.id = v.candidateId
 where c2.name = 'Beth';

select '10. Who voted for themselves?';

select c.name
  from votes v
  join clubMembers c on c.id = v.candidateId
 where v.candidateId = v.voterId;

select '11. Who didn''t vote?';

select name
  from clubMembers
  where id not in (select voterId from votes);

select '12. What are the election results?';

select c.name, count(*) voteCount
  from votes v
  join clubMembers c on c.id = v.candidateId
  group by candidateId
  order by count(*) desc;

select '13. Extra Credit: Who won the election?';

select c.name
  from votes v
  join clubMembers c on c.id = v.candidateId
 group by candidateId
  order by count(*) desc limit 1;
/* or */
select c.name 
  from votes v
  join clubMembers c on c.id = v.candidateId
 group by candidateId
having count(*) = (select max(voteCount) 
                     from (select count(*) voteCount 
                             from votes 
                            group by candidateId));

select '14. Add a club member named Isabel with id 9 in grade 8 whose favorite color is purple.';

INSERT INTO clubMembers (id, name, grade, favoriteColor)
  VALUES (9, 'Isabel', 8, 'purple');

select '15. Change Isabel''s favorite color to green.';

UPDATE clubMembers
   SET favoriteColor = 'green'
 WHERE name = 'Isabel';

select '16. Record that Isabel voted for Beth.';

INSERT INTO votes (voterId, candidateId)
  VALUES ((select id from clubMembers where name = 'Isabel'),
          (select id from clubMembers where name = 'Beth'));
/* or */
INSERT INTO votes (voterId, candidateId)
  VALUES (9, 2);

select '17. Change Isabel''s vote to be for Dana.';

UPDATE votes
   SET candidateId = (select id from clubMembers where name = 'Dana')
 WHERE voterId = (select id from clubMembers where name = 'Isabel');
/* or */
UPDATE votes
   SET candidateId = 4
 WHERE voterId = 9;

select '18. Remove Isabel''s vote.';

DELETE FROM votes
 WHERE voterId = (select id from clubMembers where name = 'Isabel');
/* or */
DELETE FROM votes
 WHERE voterId = 9;
