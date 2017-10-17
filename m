From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/9] Exynos DRM: rewrite IPP subsystem and userspace
 API
Date: Tue, 17 Oct 2017 14:24:56 +0200
Message-ID: <20171017122456.m7ul76s73hhvddch@phenom.ffwll.local>
References: <CGME20171017110810eucas1p13e4fd9a96b7866324da0f49a356db558@eucas1p1.samsung.com>
 <20171017110752.25096-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:47671 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751609AbdJQMZA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 08:25:00 -0400
Received: by mail-wm0-f66.google.com with SMTP id t69so3529105wmt.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Oct 2017 05:24:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171017110752.25096-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

On Tue, Oct 17, 2017 at 01:07:43PM +0200, Marek Szyprowski wrote:
> Dear all,
> 
> This patchset performs complete rewrite of Exynos DRM IPP subsystem and
> its userspace API.
> 
> Why such rewrite is needed? Exynos DRM IPP API is over-engineered in
> general, but not really extensible on the other side. It is also buggy,
> with significant design flaws:
> - Userspace API covers memory-2-memory picture operations together with
>   CRTC writeback and duplicating features, which belongs to video plane.
> - Lack of support of the all required image formats (for example NV12
>   Samsung-tiled cannot be used due to lack of pixel format modifier
>   support).
> - Userspace API designed only to mimic hardware behaviour, not easy to
>   understand.
> - Lack of proper input validation in the core, drivers also didn't do that
>   correctly, so it was possible to set incorrect parameters and easil
>   trigger IOMMU fault or memory trash.
> - Drivers were partially disfunctional or supported only a subset of modes.
> 
> Due to the above limitations and issues the Exynos DRM IPP API was not
> used by any of the open-source projects. I assume that it is safe to remove
> this broken API without any damage to open-source community. All remaining
> users (mainly Tizen project related) will be updated to the new version.
> 
> This patchset changes Exynos DRM IPP subsystem to something useful. The
> userspace API is much simpler, state-less and easy to understand. Also
> the code of the core and driver is significantly smaller and easier to
> understand.
> 
> Patches were tested on Exynos4412 based Odroid U3, Exynos5422
> Odroid XU3 and Exynos5433 TM2 boards, on top of Linux next-20171016 kernel.

When submitting uapi changes, please link to the corresponding userspace
work. Otherwise pretty hard to find this stuff.
-Daniel

> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Changelog:
> 
> v3:
> - fixed minor issues and added features pointed by other developers:
>   * fixed missing ipp_unregister (Hoegeun)
>   * added missing limits to FIMC and GSC driver (Hoegeun)
>   * added more specific compatible strings to GSC driver (Hoegeun)
>   * added Exynos5433 support to GSC driver (Hoegeun)
>   * added autosuspend runtime PM to all IPP drivers (Tobias)
> - added Exynos5433 support to Scaler driver (thanks to Andrzej)
> - dropped Exynos5420 clk patch, which has been alredy merged
> 
> v2: https://www.spinics.net/lists/dri-devel/msg153418.html
> - fixed minor issues pointed by other developers:
>   * fixed possible null pointer dereferrence (Tobias)
>   * changed limits_size to limits_count (Tobias)
>   * renamed struct exynos_drm_ipp_format to drm_exynos_ipp_format (Andrzej)
>   * added proper return value from exynos_drm_ipp_get_res_ioctl when no IPP
>     driver is present (Andrzej)
>   * properly aligned all uapi structures to be 32/64 bit safe (Emil)
>   * properly initialize all strucutres
> - added new Exynos Scaler driver from Andrzej Pietrasiewicz
> 
> v1: https://www.spinics.net/lists/linux-samsung-soc/msg60492.html
> - initial version of IPP v2
> 
> My previous works in this area:
> 
> "[RFC v2 0/2] Exynos DRM: add Picture Processor extension"
> https://www.spinics.net/lists/dri-devel/msg140669.html
> - removed usage of DRM objects and properties - replaced them with simple
>   list of parameters with predefined IDs
> 
> "[RFC 0/4] Exynos DRM: add Picture Processor extension"
> https://www.spinics.net/lists/linux-samsung-soc/msg59323.html
> - moved this feature from DRM core to Exynos DRM driver
> - changed name from framebuffer processor to picture processor
> - simplified code to cover only things needed by Exynos drivers
> - implemented simple fifo task scheduler
> - cleaned up rotator driver conversion (removed IPP remainings)
> 
> "[RFC 0/2] New feature: Framebuffer processors"
> https://www.spinics.net/lists/linux-samsung-soc/msg54810.html
> - generic approach implemented in DRM core, rejected
> 
> 
> Patch summary:
> 
> Andrzej Pietrasiewicz (3):
>   drm/exynos: Add driver for Exynos Scaler module
>   ARM: dts: exynos: Add mem-2-mem Scaler devices
>   ARM64: dts: exynos: Add mem-2-mem Scaler devices
> 
> Marek Szyprowski (6):
>   drm/exynos: ipp: Remove Exynos DRM IPP subsystem
>   drm/exynos: ipp: Add IPP v2 framework
>   drm/exynos: rotator: Convert driver to IPP v2 core API
>   drm/exynos: gsc: Convert driver to IPP v2 core API
>   drm/exynos: Add generic support for devices shared with V4L2 subsystem
>   drm/exynos: fimc: Convert driver to IPP v2 core API
> 
>  .../devicetree/bindings/gpu/samsung-scaler.txt     |   26 +
>  arch/arm/boot/dts/exynos5420.dtsi                  |   35 +
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   42 +
>  drivers/gpu/drm/exynos/Kconfig                     |   17 +-
>  drivers/gpu/drm/exynos/Makefile                    |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   36 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |    5 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c           |  930 +++-----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.h           |   23 -
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c            |  995 +++------
>  drivers/gpu/drm/exynos/exynos_drm_gsc.h            |   24 -
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 2240 ++++++--------------
>  drivers/gpu/drm/exynos/exynos_drm_ipp.h            |  357 ++--
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  740 ++-----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.h        |   19 -
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c         |  717 +++++++
>  drivers/gpu/drm/exynos/regs-scaler.h               |  426 ++++
>  include/uapi/drm/exynos_drm.h                      |  326 +--
>  18 files changed, 3057 insertions(+), 3902 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_scaler.c
>  create mode 100644 drivers/gpu/drm/exynos/regs-scaler.h
> 
> -- 
> 2.14.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
