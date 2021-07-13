# Ego

一个简单的静态站点生成器。

## 用法

1. 创建博客

```
$ ego new site zzf-blog
$ cd zzf-blog
$ tree
.
├── config.json
├── contents
│   └── hello_world.md
└── layouts
    ├── blog.eex
    └── index.eex
```

2. build

```
$ ego build
.
├── config.json
├── contents
│   └── hello_world.md
├── ego
├── layouts
│   ├── blog.eex
│   └── index.eex
└── public
    ├── hello_world.html
    └── index.html
```

3. 预览

```
$ ego server
```

![image](https://user-images.githubusercontent.com/6822558/125239643-85012900-e31b-11eb-9188-347b1f4a45da.png)

## 从源码构建

```
// 获取依赖
mix deps.get

// 通过escript构建
mix escript.build

// 执行命令
./ego new site zzf-blog

$ cd zzf-blog
$ tree
.
├── config.json
├── contents
│   └── hello_world.md
└── layouts
    ├── blog.eex
    └── index.eex
```

访问 http://127.0.0.1:4000/

![image](https://user-images.githubusercontent.com/6822558/125239643-85012900-e31b-11eb-9188-347b1f4a45da.png)
