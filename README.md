# coding-challenge



### 1. Implement a piece of software exposing a JSON document when visited with an HTTP client:
-----------------------

> https://github.com/raikar/coding-challenge/tree/main/json_server_demo

I used typicode JSON Server which provides fake REST API

> https://github.com/typicode/json-server

> https://hub.docker.com/r/clue/json-server



-----------------------
### 2. Dockerize the application.


Dockerfile
> https://github.com/raikar/coding-challenge/blob/main/json_server_demo/Dockerfile



-----------------------
### 3. Put the application to Minikube, Kind, or anything similar.

Used Kind and Metallb


-----------------------
### 4. Create a second application that utilizes the first and displays a fully reversed message text rendered dynamically.

> https://github.com/raikar/coding-challenge/tree/main/reverse-mgs

I used ncat tool to redirect TCP port 8083 on the second app (reverse-mgs) to first app (json_server_demo) on port 80, I also piped the output to ```bash rev ``` tp reverse the content of the http output

```bash
> /usr/bin/ncat --sh-exec "ncat 172.18.0.21 80 |rev" -l 8083 --keep-open
```

to verify the results i used nc

```bash
> echo -e "GET /posts HTTP/1.1\nHost: 10.1.1.2\nConnection: close\n\n\n\n" | nc 172.18.0.22 8083

Output:
[
{
,1 :"di"
"dlrow olleH" :"egassem"
}
]


```


-----------------------
### 5. Automate deployment of the two applications using a script (called script.sh).


> https://github.com/raikar/coding-challenge/blob/main/script.sh
