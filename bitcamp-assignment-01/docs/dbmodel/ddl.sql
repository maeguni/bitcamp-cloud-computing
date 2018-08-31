-- ȸ��
DROP TABLE IF EXISTS P2_MEMB RESTRICT;

-- ����
DROP TABLE IF EXISTS P2_BIZCARD RESTRICT;

-- ȸ��
CREATE TABLE P2_MEMB (
    MNO   INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
    EMAIL VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
    NAME  VARCHAR(50)  NOT NULL COMMENT '�̸�', -- �̸�
    PWD   VARCHAR(255) NOT NULL COMMENT '��ȣ' -- ��ȣ
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE P2_MEMB
    ADD CONSTRAINT PK_P2_MEMB -- ȸ�� �⺻Ű
        PRIMARY KEY (
            MNO -- ȸ����ȣ
        );

-- ȸ�� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P2_MEMB
    ON P2_MEMB ( -- ȸ��
        EMAIL ASC -- �̸���
    );

-- ȸ�� �ε���
CREATE INDEX IX_P2_MEMB
    ON P2_MEMB( -- ȸ��
        NAME ASC -- �̸�
    );

ALTER TABLE P2_MEMB
    MODIFY COLUMN MNO INTEGER NOT NULL AUTO_INCREMENT COMMENT 'ȸ����ȣ';

-- ����
CREATE TABLE P2_BIZCARD (
    BCNO  INTEGER     NOT NULL COMMENT '���Թ�ȣ', -- ���Թ�ȣ
    NAME  VARCHAR(50) NOT NULL COMMENT '�̸�', -- �̸�
    MTEL  VARCHAR(30) NOT NULL COMMENT '�޴���ȭ', -- �޴���ȭ
    TEL   VARCHAR(30) NULL     COMMENT '�Ϲ���ȭ', -- �Ϲ���ȭ
    FAX   VARCHAR(30) NULL     COMMENT '�ѽ�', -- �ѽ�
    EMAIL VARCHAR(40) NULL     COMMENT '�̸���', -- �̸���
    MEMO  TEXT        NULL     COMMENT '�޸�', -- �޸�
    MNO   INTEGER     NULL     COMMENT 'ȸ����ȣ' -- ȸ����ȣ
)
COMMENT '����';

-- ����
ALTER TABLE P2_BIZCARD
    ADD CONSTRAINT PK_P2_BIZCARD -- ���� �⺻Ű
        PRIMARY KEY (
            BCNO -- ���Թ�ȣ
        );

-- ���� �ε���
CREATE INDEX IX_P2_BIZCARD
    ON P2_BIZCARD( -- ����
        NAME ASC -- �̸�
    );

ALTER TABLE P2_BIZCARD
    MODIFY COLUMN BCNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '���Թ�ȣ';

-- ����
ALTER TABLE P2_BIZCARD
    ADD CONSTRAINT FK_P2_MEMB_TO_P2_BIZCARD -- ȸ�� -> ����
        FOREIGN KEY (
            MNO -- ȸ����ȣ
        )
        REFERENCES P2_MEMB ( -- ȸ��
            MNO -- ȸ����ȣ
        );