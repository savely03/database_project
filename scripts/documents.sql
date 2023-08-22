----------------------------------------------------------------
CREATE TABLE DOCUMENT
(
    id              BIGSERIAL PRIMARY KEY,
    document_number BIGINT   NOT NULL,
    version         BIGINT   NOT NULL,
    is_active       SMALLINT NOT NULL CHECK ( is_active >= 0 AND is_active <= 1 ),
    UNIQUE (document_number, version)
);

CREATE UNIQUE INDEX unique_is_active
    ON DOCUMENT ((case when is_active = 1 then document_number end));
----------------------------------------------------------------


----------------------------------------------------------------
CREATE TABLE DOCUMENT
(
    id              BIGSERIAL PRIMARY KEY,
    document_number BIGINT NOT NULL,
    version         BIGINT NOT NULL,
    is_active       BOOLEAN,
    UNIQUE (document_number, version),
    UNIQUE (document_number, is_active),
    CHECK (is_active)
);
----------------------------------------------------------------







