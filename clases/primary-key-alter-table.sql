SELECT code, code2 FROM country;

DELETE FROM country WHERE code = 'NLD' AND code2 = 'NA';

ALTER TABLE country ADD PRIMARY KEY (code);