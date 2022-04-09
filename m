Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13CFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Apr 2022 00:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240162AbiDIA1p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 20:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbiDIA1n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 20:27:43 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC6918E1C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 17:25:35 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n9so9277673plc.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kz7GnN0ueKLYQdjs167y4clP/UZTHlXJVCCTffQi9xc=;
        b=GbSXPP9jlr7EuTbmQKNyojNjyS2xBxseTteVGevqz+qfcK/PPF2FeFpT9R9MzHR1JA
         IE7Ns0+bJOS7d2vCCLRr79HwhAy0UK2jSVWQNlyGEFqoZ2r+wcGOnIY0xgOHbsTgjkxE
         2fozznD573gbVD3MYU8KqmzIIBmwN/oKFazjaI1+xSWflceXJgN2slJ90MNCOKf9CHKd
         qfRnsSp1lZo5i8zinwCbvEp9pbnQRarlzmTJj8dzKzKlKb0FkbzUpKi73yymTfwbjBRS
         W0b331WC97c0vehkPPyTJa1+rkVRdehQxQNtpe5QwNeuXjpXhG1niySyXj3SQw7HYi4A
         JGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kz7GnN0ueKLYQdjs167y4clP/UZTHlXJVCCTffQi9xc=;
        b=bx67XxDuVQxsICah95QYZosvM9G2aCYqZDabnfusyjBunW19ZfhfMFi44V/yMXWnE6
         f/XmKN+c0YyJlMncG9+GYIqOCmEx1zahpmTq69RXg4bsm/c/AJnosDAaD/FeezDPic4W
         ETpzcLLIBjs/hfyArkJsAy4yccmlqOLqp81zQ+261fgqk8v99OceeUPJk84HsygGb1im
         GUappW3tIYACt/DbHCTMj0dFP3PQ9D5GXEnu9qa1MwQhl2/fopPZfqaioHgftiXiTV/M
         YXlTrv0zkdn/BQEoBTluE6y8aFa7Q7sM8YDTEgzeiD8mghato8mImr4RqFdDZCy+4vzg
         z9OA==
X-Gm-Message-State: AOAM531lODdfJ27nXHP3RvU6GSCCk1dD4nA2olysSgeCOQwXPk/P0uko
        0SuwOzTE+hx5YiucKQmEj9q7eQP1h23FQQnl10qBgQ==
X-Google-Smtp-Source: ABdhPJwpGliq5FMMKScQcNLr+H/KLqk+wpd25JkDEPoXoMlLVIoWSM1kMGeMPkISNh8SWxWkaTatpDWxxppN/3b/0zU=
X-Received: by 2002:a17:902:c401:b0:154:152a:7fb7 with SMTP id
 k1-20020a170902c40100b00154152a7fb7mr22053914plk.63.1649463935333; Fri, 08
 Apr 2022 17:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 8 Apr 2022 17:25:23 -0700
Message-ID: <CAJ+vNU2KMhMg2C2BRQCfqgM3jCrpMHznrPQhkq2L2GSRgX9ehg@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Apr 8, 2022 at 9:22 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> Previous RFC can be available here [1].
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
>
> Patch 0000:     Samsung DSIM bridge
>
> Patch 0001:     platform init flag via driver_data
>
> Patch 0002/9:   bridge fixes, atomic API's
>
> Patch 0010:     document fsl,imx8mm-mipi-dsim
>
> Patch 0011:     add i.MX8MM DSIM support
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Anyone interested, please have a look on this repo [2]
>
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v1
> [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (11):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Handle platform init via driver_data
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
>   drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add module init, exit
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>   drm: bridge: samsung-dsim: Add i.MX8MM support
>
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |   12 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1803 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1704 +---------------
>  include/drm/bridge/samsung-dsim.h             |   97 +
>  8 files changed, 1982 insertions(+), 1649 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h
>
> --
> 2.25.1
>

Jagan,

Thanks so much for continuing to work this through!

I've successfully tested this series on imx8mm-venice-gw73xx-0x using
the following:
- DFROBOT 7" raspberrypi touchscreen display (DFR0506) [1]
- the following defconfig:
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
CONFIG_DRM_PANEL_SIMPLE
CONFIG_DRM_PANEL_BRIDGE
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN
CONFIG_DRM_TOSHIBA_TC358762
CONFIG_DRM_SAMSUNG_DSIM
CONFIG_DRM_MXSFB
- the following dt overlay:
// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
/*
 * Copyright 2022 Gateworks Corporation
 */

#include <dt-bindings/gpio/gpio.h>

#include "imx8mm-pinfunc.h"

/dts-v1/;
/plugin/;

&{/} {
        compatible = "gw,imx8mm-gw73xx-0x", "fsl,imx8mm";

        panel {
                compatible = "powertip,ph800480t013-idf02";
                power-supply = <&attiny>;
                backlight = <&attiny>;

                port {
                        panel_out_bridge: endpoint {
                                remote-endpoint = <&bridge_out_panel>;
                        };
                };
        };
};

&i2c3 {
        #address-cells = <1>;
        #size-cells = <0>;

        attiny: regulator@45 {
                compatible = "raspberrypi,7inch-touchscreen-panel-regulator";
                reg = <0x45>;
        };
};

&lcdif {
        status = "okay";
};

&dsi {
        #address-cells = <1>;
        #size-cells = <0>;
        status = "okay";

        bridge@0 {
                compatible = "toshiba,tc358762";
                reg = <0>;
                vddc-supply = <&attiny>;
                #address-cells = <1>;
                #size-cells = <0>;
                status = "okay";

                ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                                reg = <0>;
                                bridge_in_dsi: endpoint {
                                        remote-endpoint = <&dsi_out_bridge>;
                                        data-lanes = <0 1>;
                                };
                        };

                        port@1 {
                                reg = <1>;
                                bridge_out_panel: endpoint {
                                        remote-endpoint = <&panel_out_bridge>;
                                };
                        };
                };
        };

        ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@1 {
                        reg = <1>;

                        dsi_out_bridge: endpoint {
                                remote-endpoint = <&bridge_in_dsi>;
                        };
                };
        };
};

Tested-by: Tim Harvey <tharvey@gateworks.com> #imx8mm-venice-gw73xx with DFR0506

I'll be happy to test any follow-on series as needed.

Best Regards,

Tim
[1] https://www.dfrobot.com/product-1655.html
