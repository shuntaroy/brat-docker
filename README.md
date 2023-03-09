# Dockerised brad rapid annotation tool

This is a dockerised version of the [brat rapid annotation tool](http://brat.nlplab.org/).

Based on alpine linux with python 3, it runs the latest version of brat (i.e. the `master` branch, which is improved from the stable v1.3-Crunchy_Frog) using the built-in `standalone.py`.

Furthermore, this image loads `data/` and user credentials from `users.json` in the current directory so that you can modify corpora and users without rebuilding the image.

Although `standalone.py` seems to have a security risk, it is supposed to run faster than Apache CGI (according to [the official doc](http://brat.nlplab.org/installation.html#brat-standalone-server)).
The security risk would be mitigated by containerisation, but it is still recommended to run this image with rootless docker behind a HTTPS-enabled reverse proxy.

## Build

```sh
docker compose build brat
```

## Local setup

Create a file named `users.json` to set up authenticated users, which lists username/password pairs as follows:

```json
{
  "User1": "secret1",
  "User2": "secret2"
}
```

Also, you need to create two directories named `data` and `work`:

```sh
mkdir data work
```

## Run

```sh
docker compose up -d
```

Open `localhost:55557` and login using credentials from `users.json`.
You can change the port or other configurations in `compose.yaml`.
