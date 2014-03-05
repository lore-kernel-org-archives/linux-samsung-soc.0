From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC PATCH v2 00/21] Add DSI display support for Exynos based boards
Date: Wed, 5 Mar 2014 11:56:08 +0900
Message-ID: <CAAQKjZOEAWG3jwTPOP7aBnpjyg8qLfq-Fcv_Mec2+fgmOULqEg@mail.gmail.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:62551 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755847AbaCEC4K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 21:56:10 -0500
In-Reply-To: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

Thanks for your contributions.

2014-02-12 20:31 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi,
>
> This patchset adds drivers and bindings to the following devices:
> - Exynos DSI master,
> - S6E8AA0 DSI panel,
> - TC358764 DSI/LVDS bridge,
> - HV070WSA-100 LVDS panel.
>
> It adds also display support in DTS files for the following boards:
> - Exynos4210/Trats,
> - Exynos4412/Trats2,
> - Exynos5250/Arndale.
>
> Things worth mentioning:
>
> 1. I have implemented DSI/LVDS bridge using drm_panel framework, ie.
> the driver exposes drm_panel interface on DSI side, and interact with
> panels on LVDS side using drm_panel framework. This approach seems to
> me simpler and more natural than using drm_bridge.

Can you give me more details about why you think better to use panel
framework than using drm_bridge?  "Simpler" and "more natural" are
ambiguous to me.

Using same drm_panel framework for LDVS bridge and real panel drivers
isn't reasonable to me as now because drm_panel framework would be for
real panel device even if the use of drm_panel framework looks like
suitable to LVDS bridge driver. I thought Sean's way, ptn3460 driver
using drm_bride stuff, is good enough, and that would be why
drm_bridge exists and why drm_encoder has drm_bridge.

And I'm finding more generic way, how to handle LVDS bridge using
super node so that  LVDS bridge driver isn't embedded to connector
drivers such as eDP and MIPI-DSI, and dt binding of LVDS bridge can be
done at top level of Exynos drm. Once the binding is done, encoder of
display bus driver will have drm_bridge object of LVDS bridge driver
so that display bus driver can handle LVDS bridge driver.

Will review your patch series soon.

Thanks,
Inki Dae

>
> 2. I have used video interface bindings to make link between bridge and LVDS panel.
> Other places where such links can be created are:
> a) link between DSI master and slave, I wonder if it is always neccessary,
>    DSI bus is also video bus,
> b) link between FIMD(display controller) and DSI Master, currently Exynos DRM
>    framework uses driver's hardcoded links, converting it to video interface
>    bindings should be done (if required) by separate patches.
>
> The patchset is based on Sean's Paul Exynos refactor patches v4 [1].
> To work properly porch calculation should be fixed according to my comment [2].
>
> It is the 2nd iteration of the patches, main changes:
> - based on v4 refactor patches,
> - added arndale related stuff.
> Other changes are described in individual patches.
>
> [1] http://permalink.gmane.org/gmane.comp.video.dri.devel/99264
> [2] http://permalink.gmane.org/gmane.comp.video.dri.devel/99826
>
> Regards
> Andrzej
>
>
> Andrzej Hajda (21):
>   drm_mipi_dsi: add flags to DSI messages
>   drm/exynos: delay fbdev initialization until an output is connected
>   exynos/dsim: add DT bindings
>   drm/exynos: add DSIM driver
>   panel/s6e8aa0: add DT bindings
>   drm/panel: add S6E8AA0 driver
>   panel/tc358764: add DT bindings
>   drm/panel: add TC358764 driver
>   panel/simple: add video interface DT bindings
>   panel/hv070wsa-100: add DT bindings
>   drm/panel: add support for BOE HV070WSA-100 panel to simple-panel
>   ARM: dts: exynos4: add MIPI DSI Master node
>   ARM: dts: exynos4210-trats: add panel node
>   ARM: dts: exynos4412-trats2: add panel node
>   ARM: dts: exynos5250: add mipi-phy node
>   ARM: dts: exynos5250: add display power domain node
>   ARM: dts: exynos5250: add DSI node
>   ARM: dts: exynos5250-arndale: add display regulators
>   ARM: dts: exynos5250-arndale: add dsi and panel nodes
>   ARM: dts: exynos4210-trats: enable exynos/fimd node
>   ARM: dts: exynos4412-trats2: enable exynos/fimd node
>
>  .../devicetree/bindings/panel/boe,hv070wsa-100.txt |    7 +
>  .../devicetree/bindings/panel/samsung,s6e8aa0.txt  |   51 +
>  .../devicetree/bindings/panel/simple-panel.txt     |    6 +
>  .../devicetree/bindings/panel/toshiba,tc358764.txt |   41 +
>  .../devicetree/bindings/video/exynos_dsim.txt      |   53 +
>  arch/arm/boot/dts/exynos4.dtsi                     |   14 +
>  arch/arm/boot/dts/exynos4210-trats.dts             |   42 +
>  arch/arm/boot/dts/exynos4412-trats2.dts            |   51 +
>  arch/arm/boot/dts/exynos5250-arndale.dts           |   63 +
>  arch/arm/boot/dts/exynos5250.dtsi                  |   25 +
>  drivers/gpu/drm/exynos/Kconfig                     |    9 +
>  drivers/gpu/drm/exynos/Makefile                    |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   26 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1402 ++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fb.c             |    3 +
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    4 +-
>  drivers/gpu/drm/panel/Kconfig                      |   14 +
>  drivers/gpu/drm/panel/Makefile                     |    2 +
>  drivers/gpu/drm/panel/panel-s6e8aa0.c              | 1064 +++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               |   25 +
>  drivers/gpu/drm/panel/panel-tc358764.c             |  505 +++++++
>  include/drm/drm_mipi_dsi.h                         |    6 +
>  23 files changed, 3402 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/panel/boe,hv070wsa-100.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/toshiba,tc358764.txt
>  create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi.c
>  create mode 100644 drivers/gpu/drm/panel/panel-s6e8aa0.c
>  create mode 100644 drivers/gpu/drm/panel/panel-tc358764.c
>
> --
> 1.8.3.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
