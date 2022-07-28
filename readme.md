# Daily Piano Exercises

Generates a static website with a piano practice sheet for each day:

<https://dailypiano.selfawaresoup.com>

Sheet music was written in MuseScore, exported as SVG and then cleaned up and formatted with [a script](https://github.com/selfawaresoup/daily-piano-exercise/blob/main/scores/export.rb).

## Compile & run site generator

```
cargo run
```

## Upload to webhost

(requries rclone to be configured with authentication)

```
./upload.sh
```

## Re-generate SVG files for sheet music

(after changes in the MuseScore file)

```
cd scores
ruby export.rb
```

Then run the site generator again
