-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-12 05:02:54.295

-- tables
-- Table: Gene
CREATE TABLE Gene (
    Name varchar(20)  NOT NULL,
    Synonym varchar(20)  NOT NULL,
    GeneState_Name char(10)  NOT NULL,
    CONSTRAINT Gene_pk PRIMARY KEY (Name)
);

-- Table: GeneState
CREATE TABLE GeneState (
    Name char(10)  NOT NULL,
    Description char(200)  NOT NULL,
    CONSTRAINT GeneState_pk PRIMARY KEY (Name)
);

-- Table: Gene_OrderingOptions
CREATE TABLE Gene_OrderingOptions (
    Gene_Name varchar(50)  NOT NULL,
    OrderingOptions_Name char(200)  NOT NULL,
    CONSTRAINT Gene_OrderingOptions_pk PRIMARY KEY (Gene_Name,OrderingOptions_Name)
);

-- Table: Gene_PrimerState
CREATE TABLE Gene_PrimerState (
    Gene_Name varchar(20)  NOT NULL,
    PrimerState_Name varchar(20)  NOT NULL,
    CONSTRAINT Gene_PrimerState_pk PRIMARY KEY (Gene_Name,PrimerState_Name)
);

-- Table: InheritancePattern
CREATE TABLE InheritancePattern (
    Name char(2)  NOT NULL,
    Description char(200)  NOT NULL,
    CONSTRAINT InheritancePattern_pk PRIMARY KEY (Name)
);

-- Table: InheritancePattern_Gene
CREATE TABLE InheritancePattern_Gene (
    InheritancePattern_Name char(2)  NOT NULL,
    Gene_Name varchar(50)  NOT NULL,
    CONSTRAINT InheritancePattern_Gene_pk PRIMARY KEY (InheritancePattern_Name,Gene_Name)
);

-- Table: OrderingOptions
CREATE TABLE OrderingOptions (
    Name char(50)  NOT NULL,
    Description char(200)  NOT NULL,
    CONSTRAINT OrderingOptions_pk PRIMARY KEY (Name)
);

-- Table: PrimerState
CREATE TABLE PrimerState (
    Name char(20)  NOT NULL,
    Description char(100)  NOT NULL,
    CONSTRAINT PrimerState_pk PRIMARY KEY (Name)
);

-- Table: ReferenceSequence
CREATE TABLE ReferenceSequence (
    mRNARefSeq varchar(50)  NOT NULL,
    JSIRefSeq varchar(50)  NOT NULL,
    TotalNumberOfExons int  NOT NULL,
    CodingExon int  NOT NULL,
    NonCodingExon int  NOT NULL,
    Gene_Name varchar(100)  NOT NULL,
    CONSTRAINT ReferenceSequence_pk PRIMARY KEY (mRNARefSeq)
);

-- foreign keys
-- Reference: Gene_GeneState (table: Gene)
ALTER TABLE Gene ADD CONSTRAINT Gene_GeneState FOREIGN KEY Gene_GeneState (GeneState_Name)
    REFERENCES GeneState (Name);

-- Reference: Gene_OrderingOptions_Gene (table: Gene_OrderingOptions)
ALTER TABLE Gene_OrderingOptions ADD CONSTRAINT Gene_OrderingOptions_Gene FOREIGN KEY Gene_OrderingOptions_Gene (Gene_Name)
    REFERENCES Gene (Name);

-- Reference: Gene_OrderingOptions_OrderingOptions (table: Gene_OrderingOptions)
ALTER TABLE Gene_OrderingOptions ADD CONSTRAINT Gene_OrderingOptions_OrderingOptions FOREIGN KEY Gene_OrderingOptions_OrderingOptions (OrderingOptions_Name)
    REFERENCES OrderingOptions (Name);

-- Reference: Gene_PrimerState_Gene (table: Gene_PrimerState)
ALTER TABLE Gene_PrimerState ADD CONSTRAINT Gene_PrimerState_Gene FOREIGN KEY Gene_PrimerState_Gene (Gene_Name)
    REFERENCES Gene (Name);

-- Reference: Gene_PrimerState_PrimerState (table: Gene_PrimerState)
ALTER TABLE Gene_PrimerState ADD CONSTRAINT Gene_PrimerState_PrimerState FOREIGN KEY Gene_PrimerState_PrimerState (PrimerState_Name)
    REFERENCES PrimerState (Name);

-- Reference: InheritancePattern_Gene_Gene (table: InheritancePattern_Gene)
ALTER TABLE InheritancePattern_Gene ADD CONSTRAINT InheritancePattern_Gene_Gene FOREIGN KEY InheritancePattern_Gene_Gene (Gene_Name)
    REFERENCES Gene (Name);

-- Reference: InheritancePattern_Gene_InheritancePattern (table: InheritancePattern_Gene)
ALTER TABLE InheritancePattern_Gene ADD CONSTRAINT InheritancePattern_Gene_InheritancePattern FOREIGN KEY InheritancePattern_Gene_InheritancePattern (InheritancePattern_Name)
    REFERENCES InheritancePattern (Name);

-- Reference: ReferenceSequence_Gene (table: ReferenceSequence)
ALTER TABLE ReferenceSequence ADD CONSTRAINT ReferenceSequence_Gene FOREIGN KEY ReferenceSequence_Gene (Gene_Name)
    REFERENCES Gene (Name);

-- End of file.

