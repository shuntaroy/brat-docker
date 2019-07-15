# brad rapid annotation tool

## Build

docker build -t brat .

## Local setup

Create a dir for authenticated users:

    mkdir secrets

Create a file 'secrets/users.json' containing username/password pairs
as follows:

{
    "User1": "secret1",
    "User2": "secret2"
}

## Run

docker run -p 8001:8001 -v "$(pwd)/secrets:/secrets" brat

Point browser to localhost:8001 and login using credentials from users.json
