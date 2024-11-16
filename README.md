# cid2pid
CLI tool to get a pid for a vsock cid

## Usage
```
cid2pid <cid>
```

If the pid is found, the exit code will be 0 along with the output:
```
cid: <cid>
pid: <pid>
```

On failure, an exit code other then 0 will be returned.
