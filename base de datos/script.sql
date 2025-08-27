-- ============================
-- Script SQL para Supabase
-- Según el DER proporcionado
-- ============================

-- Tabla Usuario
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    idioma_preferido TEXT,
    pais_origen TEXT
);

-- Tabla Destino
CREATE TABLE Destino (
    id_destino SERIAL PRIMARY KEY,
    nombre_ciudad TEXT NOT NULL,
    pais TEXT NOT NULL,
    descripcion TEXT,
    coordenadas TEXT
);

-- Tabla Lugar
CREATE TABLE Lugar (
    id_lugar SERIAL PRIMARY KEY,
    id_destino INT NOT NULL REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre TEXT NOT NULL,
    categoria TEXT,
    descripcion TEXT,
    horario TEXT
);

-- Tabla Eventos
CREATE TABLE Eventos (
    id_eventos SERIAL PRIMARY KEY,
    id_destino INT NOT NULL REFERENCES Destino(id_destino) ON DELETE CASCADE,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo_evento TEXT
);

-- Tabla Rutas
CREATE TABLE Rutas (
    id_rutas SERIAL PRIMARY KEY,
    id_lugar INT REFERENCES Lugar(id_lugar) ON DELETE SET NULL,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    duracion_estimada INTERVAL
);

-- Tabla Ruta_Lugar (relación muchos a muchos)
CREATE TABLE Ruta_Lugar (
    id_rutas INT REFERENCES Rutas(id_rutas) ON DELETE CASCADE,
    id_lugar INT REFERENCES Lugar(id_lugar) ON DELETE CASCADE,
    id_usuario INT REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    id_destino INT REFERENCES Destino(id_destino) ON DELETE CASCADE,
    orden_visita INT,
    tiempo_estimado INTERVAL,
    PRIMARY KEY (id_rutas, id_lugar, id_usuario, id_destino)
);

-- Tabla Recomendacion
CREATE TABLE Recomendacion (
    id_recomendacion SERIAL PRIMARY KEY,
    id_destino INT NOT NULL REFERENCES Destino(id_destino) ON DELETE CASCADE,
    categoria TEXT,
    descripcion TEXT,
    orden_sugerido INT
);

-- Tabla Lugar_Recomendacion (relación muchos a muchos)
CREATE TABLE Lugar_Recomendacion (
    id_lugar INT REFERENCES Lugar(id_lugar) ON DELETE CASCADE,
    id_recomendacion INT REFERENCES Recomendacion(id_recomendacion) ON DELETE CASCADE,
    PRIMARY KEY (id_lugar, id_recomendacion)
);

-- Tabla Evento_Recomendacion (relación muchos a muchos)
CREATE TABLE Evento_Recomendacion (
    id_evento INT REFERENCES Eventos(id_eventos) ON DELETE CASCADE,
    id_recomendacion INT REFERENCES Recomendacion(id_recomendacion) ON DELETE CASCADE,
    PRIMARY KEY (id_evento, id_recomendacion)
);

-- Tabla Usuario_Recomendacion (relación muchos a muchos)
CREATE TABLE Usuario_Recomendacion (
    id_usuario INT REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    id_recomendacion INT REFERENCES Recomendacion(id_recomendacion) ON DELETE CASCADE,
    fecha_guardado DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id_usuario, id_recomendacion)
);

-- Tabla Consejo
CREATE TABLE Consejo (
    id_consejo SERIAL PRIMARY KEY,
    id_destino INT NOT NULL REFERENCES Destino(id_destino) ON DELETE CASCADE,
    id_usuario INT NOT NULL REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    texto TEXT NOT NULL,
    categoria TEXT
);

-- Tabla Clima
CREATE TABLE Clima (
    id_clima SERIAL PRIMARY KEY,
    id_destino INT NOT NULL REFERENCES Destino(id_destino) ON DELETE CASCADE,
    fecha DATE NOT NULL,
    temperatura NUMERIC,
    condicion TEXT
);
