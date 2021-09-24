# Conky Material

![example](./assets/example.png)

## Dependencies

1. install conky
2. install curl (for wheater calls)
3. install jq (for wheater parse)

## installation

1. clone repo

```bash
git clone https://github.com/GiovanniCardamone/ConkyMaterial.git
```

2. get openwheater key [from here](https://developer.accuweather.com)

3. export key as environment variable (.bashrc, .profile, whatever your system use)

```bash
export OPENWHEATERMAP_KEY={your api key here}
```

4. launch

```
./ConkyMaterial/launch_all.sh
```

## Conky background

you can set background that match this conky style from assets/background.png
