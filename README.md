# gdb-ray-tracing

Use [gdb](https://www.gnu.org/software/gdb/) to render a scene.

![output](https://github.com/Freed-Wu/gdb-ray-tracing/assets/32936898/bef29d5e-9883-4d90-b089-29c8656f9c23)

## Usage

```sh
gdb -x main.gdb 2> /dev/null
# or
./main.gdb 2> /dev/null
# wait 8m 2s
xdg-open output.ppm
```

## Customize

Refer [`main.gdb`](main.gdb):

```gdb
source /the/path/of/ray-tracing.gdb
ray_render ...
```

## Related Projects

### Ray Tracing

- [cmake ray tracing](https://zhuanlan.zhihu.com/p/123419161)
- [latex3 ray tracing](https://github.com/xziyue/latex-rendering)

### gdb

- [gdb-prompt](https://github.com/Freed-Wu/gdb-prompt)
