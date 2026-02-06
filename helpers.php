<?php
function bloc_editable_per_slot(mysqli $mysqli, int $group_id, int $slot): bool
{
    $stmt = $mysqli->prepare(
        "SELECT
           b.visible,
           b.editable,
           g.active AS group_active,
           bc.data_obertura,
           bc.data_tancament
         FROM blocs b
         JOIN bloc_calendari bc ON bc.bloc_id = b.id
         JOIN groups g ON g.class_id = bc.class_id
         WHERE g.id = ?
           AND ? BETWEEN b.slot_inici AND b.slot_final
         LIMIT 1"
    );

    if (!$stmt) {
        return false; // fallada defensiva
    }

    $stmt->bind_param('ii', $group_id, $slot);
    $stmt->execute();
    $res = $stmt->get_result();
    $row = $res ? $res->fetch_assoc() : null;
    $stmt->close();

    if (!$row) {
        return false; // slot fora de blocs definits
    }

    if ((int)$row['visible'] !== 1) return false;
    if ((int)$row['editable'] !== 1) return false;
    if ((int)$row['group_active'] !== 1) return false;

    $now = new DateTime();
    $obertura = new DateTime($row['data_obertura']);
    $tancament = new DateTime($row['data_tancament']);

    if ($now < $obertura) return false;
    if ($now > $tancament) return false;

    return true;
}

