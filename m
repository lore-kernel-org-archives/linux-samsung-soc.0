From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: exynos IOMMU status
Date: Tue, 31 Oct 2017 10:59:06 +0100
Message-ID: <f6f2f7c5-1d37-9391-e71a-af1ee988d6e7@samsung.com>
References: <CGME20171016233825epcas2p233cda76c774a9629d5dba24150d8bbc5@epcas2p2.samsung.com>
        <CAM3PiRwMwms=dqewOn9whmYKgNjB+rUnLdYThv9zZHxEaVrPZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55854 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754302AbdJaJ7L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 05:59:11 -0400
In-reply-to: <CAM3PiRwMwms=dqewOn9whmYKgNjB+rUnLdYThv9zZHxEaVrPZQ@mail.gmail.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marian Mihailescu <mihailescu2m@gmail.com>, linux-samsung-soc@vger.kernel.org, shuahkhan@gmail.com

Hi Marian,

On 2017-10-17 01:38, Marian Mihailescu wrote:
> What is the current status of CONFIG_EXYNOS_IOMMU in 4.14? It's still
> disabled by default in exynos_defconfig.
> Is the implementation working?

Exynos IOMMU driver is fully functional, however there are still some 
unsupported
scenarios. One of it is booting with display stack enabled, what results 
in IOMMU
page fault early during the boot (for example this happens on Chomebook 
boards,
which boots with display pre-configured by bootloader). This is the main 
reason
for keeping it disabled by default in exynos_defconfig.

All other issues, which might be observed, are other drivers bugs and 
have to be
traced and fixed.

> I have observed with CONFIG_EXYNOS_IOMMU=y on Odroid XU4, that a
> gstreamer pipeline to kmssink will lock the board IF
> capture-io-mode=dmabuf is used by the element in front of it. With
> capture-io-mode=mmap it's working fine (but much slower of course).
> Without CONFIG_EXYNOS_IOMMU, kmssink with dmabuf-import works
> correctly (e.g. playing a 1080p video to kmssink uses 5% CPU).

This was my fault, the regression has been introduced in Linux v4.6 in 
Exynos DRM
core. This has been fixed by the following patch:
https://www.spinics.net/lists/linux-samsung-soc/msg61115.html

> On the other hand, without it, X11 fails to start when using armsoc ddx:
>
> [   528.356] (II) ARMSOC(0): Output HDMI-1 connected
> [   528.356] (II) ARMSOC(0): Using exact sizes for initial modes
> [   528.356] (II) ARMSOC(0): Output HDMI-1 using initial mode 1920x1080 +0+0
> [   528.356] (II) ARMSOC(0): Got KMS resources
> [   528.356] (**) ARMSOC(0): Display dimensions: (510, 290) mm
> [   528.356] (**) ARMSOC(0): DPI set to (95, 94)
> [   528.356] (II) Loading sub module "dri2"
> [   528.356] (II) LoadModule: "dri2"
> [   528.356] (II) Module "dri2" already built-in
> [   528.356] (II) Loading sub module "exa"
> [   528.356] (II) LoadModule: "exa"
> [   528.357] (II) Loading /usr/lib/xorg/modules/libexa.so
> [   528.358] (II) Module exa: vendor="X.Org Foundation"
> [   528.358]    compiled for 1.18.4, module version = 2.6.0
> [   528.358]    ABI class: X.Org Video Driver, version 20.0
> [   528.358] (II) Loading sub module "fb"
> [   528.358] (II) LoadModule: "fb"
> [   528.358] (II) Loading /usr/lib/xorg/modules/libfb.so
> [   528.359] (II) Module fb: vendor="X.Org Foundation"
> [   528.359]    compiled for 1.18.4, module version = 1.0.0
> [   528.359]    ABI class: X.Org ANSI C Emulation, version 0.4
> [   528.359] (--) Depth 24 pixmap format is 32 bpp
> [   528.367] (II) ARMSOC(0): Soft EXA mode
> [   528.368] (II) EXA(0): Driver allocated offscreen pixmaps
> [   528.368] (II) EXA(0): Driver registered support for the following
> operations:
> [   528.368] (II)         Solid
> [   528.368] (II)         Copy
> [   528.368] (II)         Composite (RENDER acceleration)
> [   528.368] (II) ARMSOC(0): G2D Initialized.
> [   528.368] (II) ARMSOC(0): Setting swap chain size: 2
> [   528.368] (II) ARMSOC(0): [DRI2] Setup complete
> [   528.368] (II) ARMSOC(0): [DRI2]   DRI driver: armsoc
> [   528.368] (==) ARMSOC(0): Backing store enabled
> [   528.368] (==) ARMSOC(0): Silken mouse enabled
> [   528.368] (II) ARMSOC(0): HW cursor init()
> [   528.376] (EE) ARMSOC(0): ERROR: HW cursor: drmModeAddFB2 failed:
> Invalid argument
> [   528.385] (WW) depth 32 FB unsupported : falling back to depth 24
> [   528.394] (EE) ARMSOC(0): ERROR: Failed to add framebuffer to the
> scanout buffer
> [   528.418] (EE) ARMSOC(0): ERROR: xf86SetDesiredModes() failed!
> [   528.418] (EE) ARMSOC(0): ERROR: ARMSOCEnterVT() failed!
> [   528.419] (EE)
> [   528.419] (EE) Backtrace:
> [   528.420] (EE)
> [   528.420] (EE) Segmentation fault at address 0x200
> [   528.420] (EE)
> Fatal server error:
> [   528.420] (EE) Caught signal 11 (Segmentation fault). Server aborting
>
> Please note, I am not sure yet if CONFIG_EXYNOS_IOMMU=n is at fault
> for X11 not working, I need to do some debugging.

That's probably the issue of Exynos DRM GEM and the flags provided by ARMSOC
XServer, which requests NONCONTIG buffers, which cannot be used by 
Exynos DRM
CRTCs without IOMMU enabled.

> But I wanted to ask first if CONFIG_EXYNOS_IOMMU is safe to enable or
> not, and if it's known it's messing with DRM/KMS dmabuf-import (as
> seen with kmssink).

Enabling IOMMU should be safe, it always improves security and allows to
track DMA access bugs in the drivers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
