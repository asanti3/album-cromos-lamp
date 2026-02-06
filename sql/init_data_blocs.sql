INSERT INTO grupsclasse (class_id, identificador)
VALUES
  (1, '1B'),
  (2, '1A'),
  (3, 'Comp');

INSERT INTO blocs (nom, slot_inici, slot_final, visible, editable, ordre)
VALUES
  ('P1 · Parcial', 1, 26, 1, 1, 1),
  ('P1 · Final',   27, 47, 1, 1, 2);

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


