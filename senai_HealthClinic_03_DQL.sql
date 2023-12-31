Select * from Agendamentos
Select * from Clinica
Select * from Comentarios
Select * from Consultas
Select * from Especialidade
Select * from Genero
Select * from Medicos
Select * from Pacientes
Select * from Perfis
Select * from Usuarios

--Consulta para listar 
-- Id Consulta
-- Data da Consulta
-- Horario da Consulta
-- Nome da Clinica
-- Nome do Paciente
-- Nome do Medico
-- Especialidade do Medico
-- CRM
-- Prontu�rio ou Descricao
-- FeedBack(Comentario da consulta)

SELECT
    C.IdConsulta,
    A.DataHoraConsulta AS 'Data da Consulta',
    CONVERT(VARCHAR, A.DataHoraConsulta, 108) AS 'Horario da Consulta',
    Cl.NomeFantasia AS 'Nome da Clinica',
    P.Nome AS 'Nome do Paciente',
    M.Nome AS 'Nome do Medico',
    E.NomeEspecialidade AS 'Especialidade do Medico',
    M.CRM,
    COALESCE(CONVERT(NVARCHAR(MAX), C.DescricaoConsulta), 'Consulta sem descricao') AS 'Prontuario ou Descricao',
    COALESCE(Com.TextoComentario, 'Sem comentario') AS 'FeedBack(Comentario da consulta)'
FROM Consultas C
INNER JOIN Agendamentos A ON C.IdAgendamento = A.IdAgendamento
INNER JOIN Pacientes P ON C.IdPaciente = P.IdPaciente
INNER JOIN Medicos M ON C.IdMedico = M.IdMedico
INNER JOIN Especialidade E ON M.IdEspecialidade = E.IdEspecialidade
INNER JOIN Clinica Cl ON M.IdClinica = Cl.IdClinica
LEFT JOIN Comentarios Com ON C.IdConsulta = Com.IdComentario;


--Consulta para obter informa��es do paciente, consulta e m�dico:

SELECT 
    Pacientes.Nome AS NomePaciente,
    Medicos.Nome AS NomeMedico,
    Consultas.DescricaoConsulta,
    Consultas.DataCriacao AS DataConsulta
FROM Consultas
JOIN Pacientes ON Consultas.IdPaciente = Pacientes.IdPaciente
JOIN Medicos ON Consultas.IdMedico = Medicos.IdMedico;

--Consulta para obter informa��es de agendamento, paciente e m�dico:

SELECT 
    Agendamentos.DataHoraConsulta,
    Pacientes.Nome AS NomePaciente,
    Medicos.Nome AS NomeMedico
FROM Agendamentos
JOIN Pacientes ON Agendamentos.IdPaciente = Pacientes.IdPaciente
JOIN Medicos ON Agendamentos.IdMedico = Medicos.IdMedico;

--Consulta para listar m�dicos e suas especialidades:

SELECT 
    Medicos.Nome AS NomeMedico,
    Especialidade.NomeEspecialidade
FROM Medicos
JOIN Especialidade ON Medicos.IdEspecialidade = Especialidade.IDEspecialidade;

--Consulta para listar pacientes e seus coment�rios:

SELECT 
    Pacientes.Nome AS NomePaciente,
    Comentarios.TextoComentario,
    Comentarios.DataHoraComentario,
    Comentarios.Avaliacao
FROM Comentarios
JOIN Pacientes ON Comentarios.IdPaciente = Pacientes.IdPaciente;

--Consulta para obter informa��es de pacientes e suas consultas agendadas:

SELECT 
    Pacientes.Nome AS NomePaciente,
    Agendamentos.DataHoraConsulta,
    Medicos.Nome AS NomeMedico
FROM Agendamentos
JOIN Pacientes ON Agendamentos.IdPaciente = Pacientes.IdPaciente
JOIN Medicos ON Agendamentos.IdMedico = Medicos.IdMedico
WHERE Agendamentos.StatusAgendamento = 'Agendado';

--Consulta para listar cl�nicas e seus m�dicos:

SELECT 
    Clinica.NomeFantasia,
    Medicos.Nome AS NomeMedico,
    Especialidade.NomeEspecialidade
FROM Medicos
JOIN Clinica ON Medicos.IdClinica = Clinica.IdClinica
JOIN Especialidade ON Medicos.IdEspecialidade = Especialidade.IDEspecialidade;

--Consulta para obter detalhes de consultas, pacientes e m�dicos:

SELECT 
    Consultas.DescricaoConsulta,
    Pacientes.Nome AS NomePaciente,
    Medicos.Nome AS NomeMedico,
    Agendamentos.DataHoraConsulta
FROM Consultas
JOIN Pacientes ON Consultas.IdPaciente = Pacientes.IdPaciente
JOIN Medicos ON Consultas.IdMedico = Medicos.IdMedico
JOIN Agendamentos ON Consultas.IdAgendamento = Agendamentos.IdAgendamento;






