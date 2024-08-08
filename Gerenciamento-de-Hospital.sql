CREATE TABLE Pacientes (
    PacienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE,
    Sexo CHAR(1),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

CREATE TABLE Medicos (
    MedicoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Consultas (
    ConsultaID INT PRIMARY KEY,
    PacienteID INT,
    MedicoID INT,
    DataConsulta DATE,
    Diagnostico VARCHAR(255),
    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (MedicoID) REFERENCES Medicos(MedicoID)
);

CREATE TABLE Tratamentos (
    TratamentoID INT PRIMARY KEY,
    ConsultaID INT,
    Descricao VARCHAR(255),
    DataInicio DATE,
    DataFim DATE,
    FOREIGN KEY (ConsultaID) REFERENCES Consultas(ConsultaID)
);

CREATE TABLE Prontuarios (
    ProntuarioID INT PRIMARY KEY,
    PacienteID INT,
    ConsultaID INT,
    DataRegistro DATE,
    NotasMedicas VARCHAR(255),
    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (ConsultaID) REFERENCES Consultas(ConsultaID)
);



CREATE OR REPLACE PROCEDURE RegistrarConsulta(
    p_PacienteID INT,
    p_MedicoID INT,
    p_DataConsulta DATE,
    p_Diagnostico VARCHAR
) IS
BEGIN
    INSERT INTO Consultas (ConsultaID, PacienteID, MedicoID, DataConsulta, Diagnostico)
    VALUES (seq_consultas.NEXTVAL, p_PacienteID, p_MedicoID, p_DataConsulta, p_Diagnostico);
END;
/
