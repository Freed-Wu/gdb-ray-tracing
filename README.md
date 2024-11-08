# gdb-ray-tracing

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/gdb-ray-tracing/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/gdb-ray-tracing/main)
[![github/workflow](https://github.com/Freed-Wu/gdb-ray-tracing/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/gdb-ray-tracing/actions)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/gdb-ray-tracing/total)](https://github.com/Freed-Wu/gdb-ray-tracing/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/gdb-ray-tracing/latest/total)](https://github.com/Freed-Wu/gdb-ray-tracing/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing)
[![github/v](https://shields.io/github/v/release/Freed-Wu/gdb-ray-tracing)](https://github.com/Freed-Wu/gdb-ray-tracing)

Use [gdb](https://www.gnu.org/software/gdb/) to render a scene.

![output](https://github.com/Freed-Wu/gdb-ray-tracing/assets/32936898/bef29d5e-9883-4d90-b089-29c8656f9c23)

## Usage

```sh
gdb --batch-silent -x main.gdb
# or
./main.gdb
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

### Computer Graphics

#### Ray Trace

- [typescript](https://github.com/Microsoft/TypeScriptSamples/tree/master/raytracer)
- [c++ template](https://github.com/tcbrindle/raytracer.hpp)
- [cmake](https://github.com/64/cmake-raytracer)
- another [cmake](https://zhuanlan.zhihu.com/p/123419161)
- [meson](https://github.com/annacrombie/meson-raytracer)
- [PostgreSQL](https://github.com/chunky/sqlraytracer)

#### Render

- [latex](https://github.com/xziyue/latex-rendering)

### gdb

- [gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard)
- [gdb-prompt](https://github.com/Freed-Wu/gdb-prompt)
