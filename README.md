# ConkyMaterial

![preview](./assets/example.png)

## requirements

- conky
- curl
- jq

## installation

clone repository

```bash
git clone https://github.com/GiovanniCardamone/ConkyMaterial.git
```

get a key from [openwheatermap](https://developer.accuweather.com/)

put the key in your environment

(example in bash)

```bash
# ~/.bashrc or ~/.bashprofile or whatever your system use
export OPENWHEATERMAP_KEY={key obtained from openwheatermap}
```

run

```bash
./ConkyMaterial/launch_all_now.sh
```

(if you want to run at boot like i do, sleep is suggested due to gui initialization)

```bash
# in whatever startup manager you have
<where you cloned the repo>/ConkyMaterial/launch_all_now.sh
```
