From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3 00/12] Add DSI display support for Exynos based boards
Date: Tue, 1 Apr 2014 21:29:39 +0900
Message-ID: <CAAQKjZN7u1q6jeLCyQ0qe7VDRY3wUv1PjUeZZ6uoWYjo7vdtZQ@mail.gmail.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:54480 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096AbaDAM3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Apr 2014 08:29:41 -0400
In-Reply-To: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,



2014-03-28 20:52 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi,
>
> This patchset adds drivers and bindings to the following devices:
> - Exynos DSI master,
> - S6E8AA0 DSI panel,
>
> It adds also display support in DTS files for the following boards:
> - Exynos4210/Trats,
> - Exynos4412/Trats2.
>
> The patchset is based on exynos_drm_next branch.
>
> It is the 3rd iteration of the patches, main changes:
> - based on exynos_drm_next branch,
> - added video interface bindings between DSI host and slave,
>   it seems to me to be redundand, and I hope when video interface bindings
>   will be stabilized it can become optional,
> - GPIOs implemented using gpiod framework,
> - removed controversial stuff (toshiba bridge implementation and arndale support),
>   it will be send in another set of patches
>
> Other changes are described in individual patches.
>
> Regards
> Andrzej
>
>
> Andrzej Hajda (12):
>   drm/mipi_dsi: add flags to DSI messages
>   drm/mipi_dsi: create dsi devices only for nodes with reg property
>   drm/exynos: disallow fbdev initialization if no device is connected
>   exynos/dsim: add DT bindings
>   drm/exynos: add DSIM driver
>   panel/s6e8aa0: add DT bindings
>   drm/panel: add S6E8AA0 driver
>   ARM: dts: exynos4: add MIPI DSI Master node
>   ARM: dts: exynos4210-trats: add panel node
>   ARM: dts: exynos4412-trats2: add panel node
>   ARM: dts: exynos4210-trats: enable exynos/fimd node
>   ARM: dts: exynos4412-trats2: enable exynos/fimd node

Picked up this patch series.

Thanks for your contribution,
Inki Dae

>
>  .../devicetree/bindings/panel/samsung,s6e8aa0.txt  |   56 +
>  .../devicetree/bindings/video/exynos_dsim.txt      |   80 +
>  arch/arm/boot/dts/exynos4.dtsi                     |   14 +
>  arch/arm/boot/dts/exynos4210-trats.dts             |   61 +
>  arch/arm/boot/dts/exynos4412-trats2.dts            |   70 +
>  drivers/gpu/drm/drm_mipi_dsi.c                     |    6 +-
>  drivers/gpu/drm/exynos/Kconfig                     |    9 +
>  drivers/gpu/drm/exynos/Makefile                    |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   15 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1525 ++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   21 +
>  drivers/gpu/drm/panel/Kconfig                      |    7 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-s6e8aa0.c              | 1069 ++++++++++++++
>  include/drm/drm_mipi_dsi.h                         |    6 +
>  16 files changed, 2941 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
>  create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi.c
>  create mode 100644 drivers/gpu/drm/panel/panel-s6e8aa0.c
>
> --
> 1.8.3.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
