-- ������û
DROP TABLE IF EXISTS P1_APPL RESTRICT;

-- �л�
DROP TABLE IF EXISTS P1_SUDO RESTRICT;

-- ����
DROP TABLE IF EXISTS P1_TCH RESTRICT;

-- ���ǽ�
DROP TABLE IF EXISTS P1_CLS_ROOM RESTRICT;

-- �Ŵ���
DROP TABLE IF EXISTS P1_MGR RESTRICT;

-- ������������
DROP TABLE IF EXISTS P1_OPEN_CORS RESTRICT;

-- ������Ʈ
DROP TABLE IF EXISTS P1_PRJ RESTRICT;

-- ����
DROP TABLE IF EXISTS P1_SUB RESTRICT;

-- ���ǰ���
DROP TABLE IF EXISTS P1_TGH_SUB RESTRICT;

-- ������Ʈ������
DROP TABLE IF EXISTS P1_PRJ_MEM RESTRICT;

-- ������������
DROP TABLE IF EXISTS P1_CORS_SUB RESTRICT;

-- ��������������
DROP TABLE IF EXISTS P1_CORS_STUD RESTRICT;

-- ���ǽǻ���
DROP TABLE IF EXISTS P1_CLR_PHOT RESTRICT;

-- �ּ�
DROP TABLE IF EXISTS P1_ADDR RESTRICT;

-- ��������
DROP TABLE IF EXISTS P1_CORS RESTRICT;

-- ȸ��
DROP TABLE IF EXISTS P1_MEMB RESTRICT;

-- ������û
CREATE TABLE P1_APPL (
    ANO  INTEGER NOT NULL COMMENT '������û��ȣ', -- ������û��ȣ
    OCNO INTEGER NOT NULL COMMENT '��������������ȣ', -- ��������������ȣ
    SNO  INTEGER NOT NULL COMMENT '�л���ȣ', -- �л���ȣ
    RDT  DATE    NOT NULL COMMENT '��û��', -- ��û��
    STAT INTEGER NULL     DEFAULT 0 COMMENT '����' -- ����
)
COMMENT '������û';

-- ������û
ALTER TABLE P1_APPL
    ADD CONSTRAINT PK_P1_APPL -- ������û �⺻Ű
        PRIMARY KEY (
            ANO -- ������û��ȣ
        );

-- ������û ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_APPL
    ON P1_APPL ( -- ������û
        OCNO ASC -- ��������������ȣ
    );

ALTER TABLE P1_APPL
    MODIFY COLUMN ANO INTEGER NOT NULL AUTO_INCREMENT COMMENT '������û��ȣ';

-- �л�
CREATE TABLE P1_SUDO (
    SNO      INTEGER      NOT NULL COMMENT '�л���ȣ', -- �л���ȣ
    WORK     CHAR(1)      NOT NULL COMMENT '��������', -- ��������
    ADRNO    INTEGER      NULL     COMMENT '�ּҹ�ȣ', -- �ּҹ�ȣ
    DET_ADDR VARCHAR(255) NULL     COMMENT '���ּ�', -- ���ּ�
    LAT_SHOL VARCHAR(50)  NOT NULL COMMENT '�����з�', -- �����з�
    MAJ      VARCHAR(50)  NOT NULL COMMENT '����' -- ����
)
COMMENT '�л�';

-- �л�
ALTER TABLE P1_SUDO
    ADD CONSTRAINT PK_P1_SUDO -- �л� �⺻Ű
        PRIMARY KEY (
            SNO -- �л���ȣ
        );

-- �л� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_SUDO
    ON P1_SUDO ( -- �л�
    );

-- ����
CREATE TABLE P1_TCH (
    MNO    INTEGER NOT NULL COMMENT '�����ȣ', -- �����ȣ
    HR_PAY INTEGER NOT NULL COMMENT '�����' -- �����
)
COMMENT '����';

-- ����
ALTER TABLE P1_TCH
    ADD CONSTRAINT PK_P1_TCH -- ���� �⺻Ű
        PRIMARY KEY (
            MNO -- �����ȣ
        );

-- ���� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_TCH
    ON P1_TCH ( -- ����
    );

-- ���ǽ�
CREATE TABLE P1_CLS_ROOM (
    CLRNO  INTEGER     NOT NULL COMMENT '���ǽǹ�ȣ', -- ���ǽǹ�ȣ
    LOC    VARCHAR(50) NOT NULL COMMENT '����', -- ����
    TITL   VARCHAR(50) NOT NULL COMMENT '���ǽǸ�', -- ���ǽǸ�
    MX_QTY INTEGER     NOT NULL COMMENT '�ִ�����ο�' -- �ִ�����ο�
)
COMMENT '���ǽ�';

-- ���ǽ�
ALTER TABLE P1_CLS_ROOM
    ADD CONSTRAINT PK_P1_CLS_ROOM -- ���ǽ� �⺻Ű
        PRIMARY KEY (
            CLRNO -- ���ǽǹ�ȣ
        );

-- ���ǽ� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_CLS_ROOM
    ON P1_CLS_ROOM ( -- ���ǽ�
        LOC ASC,  -- ����
        TITL ASC  -- ���ǽǸ�
    );

ALTER TABLE P1_CLS_ROOM
    MODIFY COLUMN CLRNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '���ǽǹ�ȣ';

-- �Ŵ���
CREATE TABLE P1_MGR (
    MGNO INTEGER     NOT NULL COMMENT '�Ŵ�����ȣ', -- �Ŵ�����ȣ
    POSI VARCHAR(50) NOT NULL COMMENT '����' -- ����
)
COMMENT '�Ŵ���';

-- �Ŵ���
ALTER TABLE P1_MGR
    ADD CONSTRAINT PK_P1_MGR -- �Ŵ��� �⺻Ű
        PRIMARY KEY (
            MGNO -- �Ŵ�����ȣ
        );

-- �Ŵ��� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_MGR
    ON P1_MGR ( -- �Ŵ���
    );

-- ������������
CREATE TABLE P1_OPEN_CORS (
    OCNO   INTEGER     NOT NULL COMMENT '��������������ȣ', -- ��������������ȣ
    CNO    VARCHAR(50) NULL     COMMENT '�������', -- �������
    SDT    DATE        NOT NULL COMMENT '������', -- ������
    EDT    DATE        NOT NULL COMMENT '������', -- ������
    TOT_HR INTEGER     NOT NULL COMMENT '�����ð�', -- �����ð�
    DAY_HR INTEGER     NOT NULL COMMENT '�ϱ����ð�', -- �ϱ����ð�
    CLRNO  INTEGER     NULL     COMMENT '���ǽǹ�ȣ', -- ���ǽǹ�ȣ
    CRNO   INTEGER     NOT NULL COMMENT '����������ȣ', -- ����������ȣ
    MGNO   INTEGER     NULL     COMMENT '�Ŵ�����ȣ' -- �Ŵ�����ȣ
)
COMMENT '������������';

-- ������������
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT PK_P1_OPEN_CORS -- ������������ �⺻Ű
        PRIMARY KEY (
            OCNO -- ��������������ȣ
        );

ALTER TABLE P1_OPEN_CORS
    MODIFY COLUMN OCNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '��������������ȣ';

-- ������Ʈ
CREATE TABLE P1_PRJ (
    PNO  INTEGER      NOT NULL COMMENT '������Ʈ��ȣ', -- ������Ʈ��ȣ
    OCNO INTEGER      NOT NULL COMMENT '��������������ȣ', -- ��������������ȣ
    TITL VARCHAR(255) NOT NULL COMMENT '������Ʈ��', -- ������Ʈ��
    CONT TEXT         NOT NULL COMMENT '����', -- ����
    SDT  DATE         NULL     COMMENT '������', -- ������
    EDT  DATE         NULL     COMMENT '������' -- ������
)
COMMENT '������Ʈ';

-- ������Ʈ
ALTER TABLE P1_PRJ
    ADD CONSTRAINT PK_P1_PRJ -- ������Ʈ �⺻Ű
        PRIMARY KEY (
            PNO -- ������Ʈ��ȣ
        );

-- ������Ʈ �ε���
CREATE INDEX IX_P1_PRJ
    ON P1_PRJ( -- ������Ʈ
        TITL ASC -- ������Ʈ��
    );

ALTER TABLE P1_PRJ
    MODIFY COLUMN PNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '������Ʈ��ȣ';

-- ����
CREATE TABLE P1_SUB (
    SNO  INTEGER      NOT NULL COMMENT '�����ȣ', -- �����ȣ
    TITL VARCHAR(255) NOT NULL COMMENT '�����', -- �����
    CONT TEXT         NOT NULL COMMENT '���񼳸�' -- ���񼳸�
)
COMMENT '����';

-- ����
ALTER TABLE P1_SUB
    ADD CONSTRAINT PK_P1_SUB -- ���� �⺻Ű
        PRIMARY KEY (
            SNO -- �����ȣ
        );

-- ���� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_SUB
    ON P1_SUB ( -- ����
        TITL ASC -- �����
    );

ALTER TABLE P1_SUB
    MODIFY COLUMN SNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '�����ȣ';

-- ���ǰ���
CREATE TABLE P1_TGH_SUB (
    SNO INTEGER NOT NULL COMMENT '�����ȣ', -- �����ȣ
    MNO INTEGER NOT NULL COMMENT '�����ȣ' -- �����ȣ
)
COMMENT '���ǰ���';

-- ���ǰ���
ALTER TABLE P1_TGH_SUB
    ADD CONSTRAINT PK_P1_TGH_SUB -- ���ǰ��� �⺻Ű
        PRIMARY KEY (
            SNO, -- �����ȣ
            MNO  -- �����ȣ
        );

-- ������Ʈ������
CREATE TABLE P1_PRJ_MEM (
    PNO INTEGER NOT NULL COMMENT '������Ʈ��ȣ', -- ������Ʈ��ȣ
    SNO INTEGER NOT NULL COMMENT '�л���ȣ' -- �л���ȣ
)
COMMENT '������Ʈ������';

-- ������Ʈ������
ALTER TABLE P1_PRJ_MEM
    ADD CONSTRAINT PK_P1_PRJ_MEM -- ������Ʈ������ �⺻Ű
        PRIMARY KEY (
            PNO, -- ������Ʈ��ȣ
            SNO  -- �л���ȣ
        );

-- ������������
CREATE TABLE P1_CORS_SUB (
    OCNO INTEGER NOT NULL COMMENT '��������������ȣ', -- ��������������ȣ
    SNO  INTEGER NOT NULL COMMENT '�����ȣ', -- �����ȣ
    MNO  INTEGER NULL     COMMENT '�����ȣ' -- �����ȣ
)
COMMENT '������������';

-- ������������
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT PK_P1_CORS_SUB -- ������������ �⺻Ű
        PRIMARY KEY (
            OCNO, -- ��������������ȣ
            SNO   -- �����ȣ
        );

-- ��������������
CREATE TABLE P1_CORS_STUD (
    OCNO INTEGER NOT NULL COMMENT '��������������ȣ', -- ��������������ȣ
    SNO  INTEGER NOT NULL COMMENT '�л���ȣ' -- �л���ȣ
)
COMMENT '��������������';

-- ��������������
ALTER TABLE P1_CORS_STUD
    ADD CONSTRAINT PK_P1_CORS_STUD -- �������������� �⺻Ű
        PRIMARY KEY (
            OCNO, -- ��������������ȣ
            SNO   -- �л���ȣ
        );

-- ���ǽǻ���
CREATE TABLE P1_CLR_PHOT (
    CPNO  INTEGER      NOT NULL COMMENT '���ǽǻ�����ȣ', -- ���ǽǻ�����ȣ
    CLRNO INTEGER      NOT NULL COMMENT '���ǽǹ�ȣ', -- ���ǽǹ�ȣ
    PHOTO VARCHAR(255) NOT NULL COMMENT '����' -- ����
)
COMMENT '���ǽǻ���';

-- ���ǽǻ���
ALTER TABLE P1_CLR_PHOT
    ADD CONSTRAINT PK_P1_CLR_PHOT -- ���ǽǻ��� �⺻Ű
        PRIMARY KEY (
            CPNO -- ���ǽǻ�����ȣ
        );

ALTER TABLE P1_CLR_PHOT
    MODIFY COLUMN CPNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '���ǽǻ�����ȣ';

-- �ּ�
CREATE TABLE P1_ADDR (
    AD       INTEGER      NOT NULL COMMENT '�ּҹ�ȣ', -- �ּҹ�ȣ
    PSTNO    VARCHAR(10)  NOT NULL COMMENT '�����ȣ', -- �����ȣ
    BAS_ADDR VARCHAR(255) NOT NULL COMMENT '�⺻�ּ�' -- �⺻�ּ�
)
COMMENT '�ּ�';

-- �ּ�
ALTER TABLE P1_ADDR
    ADD CONSTRAINT PK_P1_ADDR -- �ּ� �⺻Ű
        PRIMARY KEY (
            AD -- �ּҹ�ȣ
        );

-- �ּ� �ε���
CREATE INDEX IX_P1_ADDR
    ON P1_ADDR( -- �ּ�
        PSTNO ASC -- �����ȣ
    );

ALTER TABLE P1_ADDR
    MODIFY COLUMN AD INTEGER NOT NULL AUTO_INCREMENT COMMENT '�ּҹ�ȣ';

-- ��������
CREATE TABLE P1_CORS (
    CRNO INTEGER      NOT NULL COMMENT '����������ȣ', -- ����������ȣ
    TITL VARCHAR(255) NOT NULL COMMENT '������', -- ������
    CONT TEXT         NOT NULL COMMENT '��������' -- ��������
)
COMMENT '��������';

-- ��������
ALTER TABLE P1_CORS
    ADD CONSTRAINT PK_P1_CORS -- �������� �⺻Ű
        PRIMARY KEY (
            CRNO -- ����������ȣ
        );

-- �������� �ε���
CREATE INDEX IX_P1_CORS
    ON P1_CORS( -- ��������
        TITL ASC -- ������
    );

ALTER TABLE P1_CORS
    MODIFY COLUMN CRNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '����������ȣ';

-- ȸ��
CREATE TABLE P1_MEMB (
    MNO   INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
    NAEM  VARCHAR(50)  NOT NULL COMMENT '�̸�', -- �̸�
    EMAIL VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
    PWD   VARCHAR(100) NOT NULL COMMENT '��ȣ', -- ��ȣ
    TEL   VARCHAR(30)  NOT NULL COMMENT '��ȭ', -- ��ȭ
    PHOTO VARCHAR(255) NULL     COMMENT '����' -- ����
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE P1_MEMB
    ADD CONSTRAINT PK_P1_MEMB -- ȸ�� �⺻Ű
        PRIMARY KEY (
            MNO -- ȸ����ȣ
        );

-- ȸ�� ����ũ �ε���
CREATE UNIQUE INDEX UIX_P1_MEMB
    ON P1_MEMB ( -- ȸ��
        EMAIL ASC -- �̸���
    );

-- ȸ�� �ε���
CREATE INDEX IX_P1_MEMB
    ON P1_MEMB( -- ȸ��
        NAEM ASC -- �̸�
    );

ALTER TABLE P1_MEMB
    MODIFY COLUMN MNO INTEGER NOT NULL AUTO_INCREMENT COMMENT 'ȸ����ȣ';

-- ������û
ALTER TABLE P1_APPL
    ADD CONSTRAINT FK_P1_SUDO_TO_P1_APPL -- �л� -> ������û
        FOREIGN KEY (
            SNO -- �л���ȣ
        )
        REFERENCES P1_SUDO ( -- �л�
            SNO -- �л���ȣ
        );

-- ������û
ALTER TABLE P1_APPL
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_APPL -- ������������ -> ������û
        FOREIGN KEY (
            OCNO -- ��������������ȣ
        )
        REFERENCES P1_OPEN_CORS ( -- ������������
            OCNO -- ��������������ȣ
        );

-- �л�
ALTER TABLE P1_SUDO
    ADD CONSTRAINT FK_P1_ADDR_TO_P1_SUDO -- �ּ� -> �л�
        FOREIGN KEY (
            ADRNO -- �ּҹ�ȣ
        )
        REFERENCES P1_ADDR ( -- �ּ�
            AD -- �ּҹ�ȣ
        );

-- �л�
ALTER TABLE P1_SUDO
    ADD CONSTRAINT FK_P1_MEMB_TO_P1_SUDO -- ȸ�� -> �л�
        FOREIGN KEY (
            SNO -- �л���ȣ
        )
        REFERENCES P1_MEMB ( -- ȸ��
            MNO -- ȸ����ȣ
        );

-- ����
ALTER TABLE P1_TCH
    ADD CONSTRAINT FK_P1_MEMB_TO_P1_TCH -- ȸ�� -> ����
        FOREIGN KEY (
            MNO -- �����ȣ
        )
        REFERENCES P1_MEMB ( -- ȸ��
            MNO -- ȸ����ȣ
        );

-- �Ŵ���
ALTER TABLE P1_MGR
    ADD CONSTRAINT FK_P1_MEMB_TO_P1_MGR -- ȸ�� -> �Ŵ���
        FOREIGN KEY (
            MGNO -- �Ŵ�����ȣ
        )
        REFERENCES P1_MEMB ( -- ȸ��
            MNO -- ȸ����ȣ
        );

-- ������������
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT FK_P1_CLS_ROOM_TO_P1_OPEN_CORS -- ���ǽ� -> ������������
        FOREIGN KEY (
            CLRNO -- ���ǽǹ�ȣ
        )
        REFERENCES P1_CLS_ROOM ( -- ���ǽ�
            CLRNO -- ���ǽǹ�ȣ
        );

-- ������������
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT FK_P1_MGR_TO_P1_OPEN_CORS -- �Ŵ��� -> ������������
        FOREIGN KEY (
            MGNO -- �Ŵ�����ȣ
        )
        REFERENCES P1_MGR ( -- �Ŵ���
            MGNO -- �Ŵ�����ȣ
        );

-- ������������
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT FK_P1_CORS_TO_P1_OPEN_CORS -- �������� -> ������������
        FOREIGN KEY (
            CRNO -- ����������ȣ
        )
        REFERENCES P1_CORS ( -- ��������
            CRNO -- ����������ȣ
        );

-- ������Ʈ
ALTER TABLE P1_PRJ
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_PRJ -- ������������ -> ������Ʈ
        FOREIGN KEY (
            OCNO -- ��������������ȣ
        )
        REFERENCES P1_OPEN_CORS ( -- ������������
            OCNO -- ��������������ȣ
        );

-- ���ǰ���
ALTER TABLE P1_TGH_SUB
    ADD CONSTRAINT FK_P1_TCH_TO_P1_TGH_SUB -- ���� -> ���ǰ���
        FOREIGN KEY (
            MNO -- �����ȣ
        )
        REFERENCES P1_TCH ( -- ����
            MNO -- �����ȣ
        );

-- ���ǰ���
ALTER TABLE P1_TGH_SUB
    ADD CONSTRAINT FK_P1_SUB_TO_P1_TGH_SUB -- ���� -> ���ǰ���
        FOREIGN KEY (
            SNO -- �����ȣ
        )
        REFERENCES P1_SUB ( -- ����
            SNO -- �����ȣ
        );

-- ������Ʈ������
ALTER TABLE P1_PRJ_MEM
    ADD CONSTRAINT FK_P1_PRJ_TO_P1_PRJ_MEM -- ������Ʈ -> ������Ʈ������
        FOREIGN KEY (
            PNO -- ������Ʈ��ȣ
        )
        REFERENCES P1_PRJ ( -- ������Ʈ
            PNO -- ������Ʈ��ȣ
        );

-- ������Ʈ������
ALTER TABLE P1_PRJ_MEM
    ADD CONSTRAINT FK_P1_SUDO_TO_P1_PRJ_MEM -- �л� -> ������Ʈ������
        FOREIGN KEY (
            SNO -- �л���ȣ
        )
        REFERENCES P1_SUDO ( -- �л�
            SNO -- �л���ȣ
        );

-- ������������
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_CORS_SUB -- ������������ -> ������������
        FOREIGN KEY (
            OCNO -- ��������������ȣ
        )
        REFERENCES P1_OPEN_CORS ( -- ������������
            OCNO -- ��������������ȣ
        );

-- ������������
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT FK_P1_SUB_TO_P1_CORS_SUB -- ���� -> ������������
        FOREIGN KEY (
            SNO -- �����ȣ
        )
        REFERENCES P1_SUB ( -- ����
            SNO -- �����ȣ
        );

-- ������������
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT FK_P1_TCH_TO_P1_CORS_SUB -- ���� -> ������������
        FOREIGN KEY (
            MNO -- �����ȣ
        )
        REFERENCES P1_TCH ( -- ����
            MNO -- �����ȣ
        );

-- ��������������
ALTER TABLE P1_CORS_STUD
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_CORS_STUD -- ������������ -> ��������������
        FOREIGN KEY (
            OCNO -- ��������������ȣ
        )
        REFERENCES P1_OPEN_CORS ( -- ������������
            OCNO -- ��������������ȣ
        );

-- ��������������
ALTER TABLE P1_CORS_STUD
    ADD CONSTRAINT FK_P1_SUDO_TO_P1_CORS_STUD -- �л� -> ��������������
        FOREIGN KEY (
            SNO -- �л���ȣ
        )
        REFERENCES P1_SUDO ( -- �л�
            SNO -- �л���ȣ
        );

-- ���ǽǻ���
ALTER TABLE P1_CLR_PHOT
    ADD CONSTRAINT FK_P1_CLS_ROOM_TO_P1_CLR_PHOT -- ���ǽ� -> ���ǽǻ���
        FOREIGN KEY (
            CLRNO -- ���ǽǹ�ȣ
        )
        REFERENCES P1_CLS_ROOM ( -- ���ǽ�
            CLRNO -- ���ǽǹ�ȣ
        );