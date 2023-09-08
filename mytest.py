import rng
import socket
import os

def test_index():
    assert rng.index() == "RNG running on " + socket.gethostname() + "\n"

def test_show_env():
    assert rng.show_env() == "This is the value of the env " + str(os.getenv('ENV_TO_REPLACE')) + "\n"

def test_myFunction():
    assert rng.myFunction(10, 2) == 5