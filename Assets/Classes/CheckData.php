<?php

class CheckData extends Database {
    private $username;
    private $password;
    private $password_confirm;
    private $thema;
    public $error;

    public function __construct($username, $password, $password_confirm, $thema = NULL) {
        $this->username = $username;
        $this->password = $password;
        $this->password_confirm = $password_confirm;
        $this->thema = $thema;
    }

    public function CheckAddUserData() {
        if (!empty($this->username) && !empty($this->password) && !empty($this->password_confirm)) {
            if ($this->password == $this->password_confirm) {
                return true;
            }

            else {
                $this->error = "2";
                return false;
            }
        }

        else {
            $this->error = "1";
            return false;
        }
    }

    public function CheckLoginData() {
        if(!empty($this->username) && !empty($this->password)) {
            $this->connectDB();
            $stmt = $this->connection->prepare("SELECT `username`, `password` FROM `users` WHERE `username` = :u");
            $stmt->bindParam(":u", $this->username, PDO::PARAM_STR);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            if( $stmt->rowCount() > 0) {
                if(password_verify($this->password, $result["password"])) {
                    return true;
                }

                else {
                    $this->error = "4";
                    return false;
                }
            }

            else {
                $this->error = "4";
                return false;
            }
        }

        else {
            $this->error = "1";
            return false;
        }
    }

    public function CheckThema() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `themen` WHERE `themenname`= :t");
        $stmt->bindParam(":t", $this->thema, PDO::PARAM_STR);
        $stmt->execute();

        if($stmt->rowCount() == 0) {
            return true;
        }

        else {
            return false;
        }
    }
}