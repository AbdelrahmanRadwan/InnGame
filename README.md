# InnGame
InnGame is a famous strategic space game based on [OGame](https://es.ogame.gameforge.com)
Full game description can be found [here](https://docs.google.com/document/d/1wl259aphTrtSpXwmZq53LPIi1jbhX2R_fBxQTN3Ybf4/edit?ts=5b8956ad).

## How to run
```bash
ruby play.rb
```

## How it works
### Initial stamina
Initial stamina ...

| metal | Fibre | gas | warehouse level | industry level |
|-------|-------|-----|-----------------|----------------|
| 1.5k | 500 | 0 | 1 | 1 |

### Periodic stamina
Every minute, you get these stuff via your industries ...

| metal | Fibre | gas | warehouse level | industry level |
|-------|-------|-----|-----------------|----------------|
| 2k | 1k | 20 | - | - |

### Target
What is needed to be reached ...

| metal | Fibre | gas | warehouse level | industry level |
|-------|-------|-----|-----------------|----------------|
| 50k | 30k | 0 | 10 | 8 |

Each minute, we check if we can level up the industry level or the warehouse level or not, and by the end of each minute, we get a power up via our industries.
