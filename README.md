### Building

Requires [mejszin/edi-cli](https://github.com/mejszin/edi-cli)

```
git clone "https://github.com/mejszin/edicate"
cd edicate/
npm install
```

Set the `paths.cli` value in `config.ini` to the top-level directory of [mejszin/edi-cli](https://github.com/mejszin/edi-cli)

```ini
[paths]
cli = ./../edi-cli/
msg = ./../edi-samples/EDIFACT/DESADV_D01B_ecosio.edi
```

. . . and run!

```
npm start
```
