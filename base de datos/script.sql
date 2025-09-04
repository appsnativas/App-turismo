-- Creación de la base de datos (opcional, en Supabase ya viene una asignada)
-- CREATE DATABASE appturismo;

-- ============================
-- TABLA: Usuario
-- ============================
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idioma_preferido VARCHAR(50),
    pais_origen VARCHAR(100)
);

-- ============================
-- TABLA: Reseñas
-- ============================
CREATE TABLE Reseñas (
    id_reseñas SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    texto TEXT,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    fecha DATE DEFAULT CURRENT_DATE
);

-- ============================
-- TABLA: Destino
-- ============================
CREATE TABLE Destino (
    id_destino SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100),
    descripcion TEXT,
    coordenada VARCHAR(255)
);

-- ============================
-- TABLA: Lugar
-- ============================
CREATE TABLE Lugar (
    id_lugar SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    descripcion TEXT,
    horario VARCHAR(100)
);

-- ============================
-- TABLA: Eventos
-- ============================
CREATE TABLE Eventos (
    id_eventos SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_de_inicio DATE,
    fecha_fin DATE,
    tipo_de_evento VARCHAR(50)
);

-- ============================
-- TABLA: Gastronomía
-- ============================
CREATE TABLE Gastronomia (
    id_gastronomia SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    descripcion TEXT,
    horario VARCHAR(100)
);

-- ============================
-- TABLA: Recorridos
-- ============================
CREATE TABLE Recorridos (
    id_recorridos SERIAL PRIMARY KEY,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_estimada VARCHAR(50)
);

-- ============================
-- TABLAS INTERMEDIAS (Reseñas)
-- ============================
CREATE TABLE Lugar_Reseñas (
    id_lugar INT REFERENCES Lugar(id_lugar) ON DELETE CASCADE,
    id_reseñas INT REFERENCES Reseñas(id_reseñas) ON DELETE CASCADE,
    PRIMARY KEY (id_lugar, id_reseñas)
);

CREATE TABLE Evento_Reseñas (
    id_evento INT REFERENCES Eventos(id_eventos) ON DELETE CASCADE,
    id_reseñas INT REFERENCES Reseñas(id_reseñas) ON DELETE CASCADE,
    PRIMARY KEY (id_evento, id_reseñas)
);

CREATE TABLE Gastronomia_Reseñas (
    id_gastronomia INT REFERENCES Gastronomia(id_gastronomia) ON DELETE CASCADE,
    id_reseñas INT REFERENCES Reseñas(id_reseñas) ON DELETE CASCADE,
    PRIMARY KEY (id_gastronomia, id_reseñas)
);
