CREATE TABLE votes (
  id INTEGER PRIMARY KEY,
  voterId INTEGER,
  candidateId INTEGER
);

INSERT INTO votes (voterId, candidateId) VALUES (1, 1);
INSERT INTO votes (voterId, candidateId) VALUES (2, 1);
INSERT INTO votes (voterId, candidateId) VALUES (3, 1);
INSERT INTO votes (voterId, candidateId) VALUES (4, 2);
INSERT INTO votes (voterId, candidateId) VALUES (5, 4);
INSERT INTO votes (voterId, candidateId) VALUES (6, 4);
INSERT INTO votes (voterId, candidateId) VALUES (8, 1);