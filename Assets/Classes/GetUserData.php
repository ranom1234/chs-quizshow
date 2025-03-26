<?php

class GetUserData extends Database {
    public function showUsers() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `users` JOIN `roles` WHERE `role`=`roleid` ORDER BY `uid`");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($result as $r) {
            echo '
            <tr>
            <td>'. $r["uid"] .'</td>
            <td>'. $r["username"] .'</td>
            <td>'. $r["rolename"] .'</td>
            <td><a href="../Admin/users.php?action=delete&id='. $r["uid"].'" class="btn btn-danger">Benutzer löschen</a></td>
            </tr>
            ';
        }
    }

    public function deleteUser($id) {
        $this->connectDB();
        $stmt = $this->connection->prepare("DELETE FROM `users` WHERE `uid` = $id");
        $stmt->execute();
    }
}