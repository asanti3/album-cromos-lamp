
-- 3.1) Grups
ALTER TABLE groups
ADD class_id INT NOT NULL;


-- 3.3) Blocs
CREATE TABLE blocs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  slot_inici INT NOT NULL,
  slot_final INT NOT NULL,
  visible TINYINT(1) NOT NULL DEFAULT 1,
  editable TINYINT(1) NOT NULL DEFAULT 1,
  ordre INT NOT NULL
) ENGINE=InnoDB;

-- 3.4) Calendari dels blocs
CREATE TABLE bloc_calendari (
  id INT AUTO_INCREMENT PRIMARY KEY,
  class_id INT NOT NULL,
  bloc_id INT NOT NULL,
  data_obertura DATETIME NOT NULL,
  data_tancament DATETIME NOT NULL,

  CONSTRAINT fk_bc_bloc
    FOREIGN KEY (bloc_id) REFERENCES blocs(id)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3.5) Grups classe
CREATE TABLE grupsclasse (
  class_id INT PRIMARY KEY,
  identificador VARCHAR(50) NOT NULL
) ENGINE=InnoDB;


-----------------------------------------------------
-- DADES
INSERT INTO grupsclasse (class_id, identificador)
VALUES
  (1, '1B'),
  (2, '1A'),
  (3, 'Comp');

INSERT INTO blocs (nom, slot_inici, slot_final, visible, editable, ordre)
VALUES
  ('P1 - Parcial', 1, 26, 1, 1, 1),
  ('P1 - Final',   27, 47, 1, 1, 2);

INSERT INTO bloc_calendari (class_id, bloc_id, data_obertura, data_tancament)
VALUES
  (1, 1, '2026-01-15 00:00:00', '2026-01-29 23:59:59'), -- 1B
  (2, 1, '2026-01-16 00:00:00', '2026-01-30 23:59:59'), -- 1A
  (3, 1, '2026-01-16 00:00:00', '2026-01-30 23:59:59'); -- Comp

INSERT INTO bloc_calendari (class_id, bloc_id, data_obertura, data_tancament)
VALUES
  (1, 2, '2026-02-02 00:00:00', '2026-02-12 23:59:59'), -- 1B
  (2, 2, '2026-02-03 00:00:00', '2026-02-13 23:59:59'), -- 1A
  (3, 2, '2026-02-03 00:00:00', '2026-02-13 23:59:59'); -- Comp

--------------------------------------------------
-- UPDATE GRUPS CLASSE
UPDATE groups SET class_id = 1 WHERE id BETWEEN 10 AND 16;
UPDATE groups SET class_id = 2 WHERE id BETWEEN 17 AND 24;
UPDATE groups SET class_id = 3 WHERE id BETWEEN 25 AND 26;
