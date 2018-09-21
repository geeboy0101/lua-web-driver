---
title: Install
---

# Install

This document how to install LuaWebDriver on the following platforms:

  * [CentOS](#centos)

  * [macOS](#macos)

You must install [geckodriver][geckodriver] and [LuaRocks][luarocks] before installing LuaWebDriver.

## CentOS {#centos}

```console
% yum install -y luarocks
% curl -L -O https://github.com/mozilla/geckodriver/releases/download/v{{ site.geckodriver_version }}/geckodriver-v{{ site.geckodriver_version }}-linux64.tar.gz
% tar xf geckodriver-v{{ site.geckodriver_version }}-linux64.tar.gz -C /usr/local/bin
% chmod +x /usr/local/bin/geckodriver
% sudo luarocks install lua-web-driver
```

## macOS {#macos}

```console
% brew install luarocks
% brew install geckodriver
% sudo luarocks install lua-web-driver
```

[geckodriver]:https://github.com/mozilla/geckodriver

[luarocks]:https://luarocks.org/