From: Marian Mihailescu <mihailescu2m@gmail.com>
Subject: exynos IOMMU status
Date: Tue, 17 Oct 2017 10:08:21 +1030
Message-ID: <CAM3PiRwMwms=dqewOn9whmYKgNjB+rUnLdYThv9zZHxEaVrPZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:56517 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932512AbdJPXiX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 19:38:23 -0400
Received: by mail-wm0-f41.google.com with SMTP id l68so393454wmd.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Oct 2017 16:38:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, shuahkhan@gmail.com

Hi,

What is the current status of CONFIG_EXYNOS_IOMMU in 4.14? It's still
disabled by default in exynos_defconfig.
Is the implementation working?

I have observed with CONFIG_EXYNOS_IOMMU=y on Odroid XU4, that a
gstreamer pipeline to kmssink will lock the board IF
capture-io-mode=dmabuf is used by the element in front of it. With
capture-io-mode=mmap it's working fine (but much slower of course).
Without CONFIG_EXYNOS_IOMMU, kmssink with dmabuf-import works
correctly (e.g. playing a 1080p video to kmssink uses 5% CPU).
On the other hand, without it, X11 fails to start when using armsoc ddx:

[   528.356] (II) ARMSOC(0): Output HDMI-1 connected
[   528.356] (II) ARMSOC(0): Using exact sizes for initial modes
[   528.356] (II) ARMSOC(0): Output HDMI-1 using initial mode 1920x1080 +0+0
[   528.356] (II) ARMSOC(0): Got KMS resources
[   528.356] (**) ARMSOC(0): Display dimensions: (510, 290) mm
[   528.356] (**) ARMSOC(0): DPI set to (95, 94)
[   528.356] (II) Loading sub module "dri2"
[   528.356] (II) LoadModule: "dri2"
[   528.356] (II) Module "dri2" already built-in
[   528.356] (II) Loading sub module "exa"
[   528.356] (II) LoadModule: "exa"
[   528.357] (II) Loading /usr/lib/xorg/modules/libexa.so
[   528.358] (II) Module exa: vendor="X.Org Foundation"
[   528.358]    compiled for 1.18.4, module version = 2.6.0
[   528.358]    ABI class: X.Org Video Driver, version 20.0
[   528.358] (II) Loading sub module "fb"
[   528.358] (II) LoadModule: "fb"
[   528.358] (II) Loading /usr/lib/xorg/modules/libfb.so
[   528.359] (II) Module fb: vendor="X.Org Foundation"
[   528.359]    compiled for 1.18.4, module version = 1.0.0
[   528.359]    ABI class: X.Org ANSI C Emulation, version 0.4
[   528.359] (--) Depth 24 pixmap format is 32 bpp
[   528.367] (II) ARMSOC(0): Soft EXA mode
[   528.368] (II) EXA(0): Driver allocated offscreen pixmaps
[   528.368] (II) EXA(0): Driver registered support for the following
operations:
[   528.368] (II)         Solid
[   528.368] (II)         Copy
[   528.368] (II)         Composite (RENDER acceleration)
[   528.368] (II) ARMSOC(0): G2D Initialized.
[   528.368] (II) ARMSOC(0): Setting swap chain size: 2
[   528.368] (II) ARMSOC(0): [DRI2] Setup complete
[   528.368] (II) ARMSOC(0): [DRI2]   DRI driver: armsoc
[   528.368] (==) ARMSOC(0): Backing store enabled
[   528.368] (==) ARMSOC(0): Silken mouse enabled
[   528.368] (II) ARMSOC(0): HW cursor init()
[   528.376] (EE) ARMSOC(0): ERROR: HW cursor: drmModeAddFB2 failed:
Invalid argument
[   528.385] (WW) depth 32 FB unsupported : falling back to depth 24
[   528.394] (EE) ARMSOC(0): ERROR: Failed to add framebuffer to the
scanout buffer
[   528.418] (EE) ARMSOC(0): ERROR: xf86SetDesiredModes() failed!
[   528.418] (EE) ARMSOC(0): ERROR: ARMSOCEnterVT() failed!
[   528.419] (EE)
[   528.419] (EE) Backtrace:
[   528.420] (EE)
[   528.420] (EE) Segmentation fault at address 0x200
[   528.420] (EE)
Fatal server error:
[   528.420] (EE) Caught signal 11 (Segmentation fault). Server aborting

Please note, I am not sure yet if CONFIG_EXYNOS_IOMMU=n is at fault
for X11 not working, I need to do some debugging.
But I wanted to ask first if CONFIG_EXYNOS_IOMMU is safe to enable or
not, and if it's known it's messing with DRM/KMS dmabuf-import (as
seen with kmssink).

Thanks,
Marian

---
Either I've been missing something or nothing has been going on. (K. E. Gordon)
