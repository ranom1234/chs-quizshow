<?php

class KillSession {
    public function killSession_all() {
        session_start();
        session_unset();
        session_destroy();
        unset($_SESSION);
        return true;
    }
}