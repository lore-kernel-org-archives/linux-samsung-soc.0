Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A7EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Oct 2022 15:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbiJFP0k (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Oct 2022 11:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbiJFP0g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 11:26:36 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D259BC475
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Oct 2022 08:26:35 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-132fb4fd495so2535677fac.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Oct 2022 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qEgg6vU+1CShCyrvh11UlBgdaJjiNvI37fqYdKhnNwU=;
        b=pHuTH+IOzjjSQkyEAXbIYdJibMg2T/yHhNW5bdD+Zy7vO2BhlKqvuse1vTzTvXMGRC
         SF5ZvW6rOBwK7IR88numKnbolMnzdd81s/JUyI4BJQEXdboIt+9+PdsAUPplNr+9lEkI
         1F3PYFoEx0vuMK157xQFZJn/k1s+BBAONABw1ruoJsjnJf3LFcpaf79quXg8V/NGuSUS
         O+WQFwQScgrnwoIY4k9UXJNlM7ouOrxkEYjneqMblb4Seiye/7pOuTytLwX3OowTN7S2
         e8inlXPIfglqz/SYAcCHWkzf9gvUrUaZAWUP+qLEPoi3jJCXxM8lpdk7mc3dAGPuH50F
         fdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEgg6vU+1CShCyrvh11UlBgdaJjiNvI37fqYdKhnNwU=;
        b=aLc57D+9F+Kjh7KSFdHy2tS/sRiDcAnDS97dzLRJGeNhVB4My7vnWLrKdV5ewbLqzt
         SbvYtg3B8nc7h9YV5JZx138ktbhP33oexMUSpXXhlgTebwmdUuvpS4u746p4ugic+w8T
         VpkiLxdHNpy+kCi+J4pkjZD3hnnON33m12XIyBUl+aFsnhzkQj9PDqEefUgN/7/NtbXU
         p2TkzmeD84Z862ed2vFJDcdsYuTsFR0NPhRrMAwspLG8myoXS+FuFWtf73kKf8YUY7dc
         0IftzlgcSwMgOurYpNmgoe5dUNFBTJiQMsmz3bIUTJBsPtG3kat88AmI1WFM8RzFq95a
         JiKg==
X-Gm-Message-State: ACrzQf1KhJWFl1J5/Yi9Iaf4Oxvjkz1mK2c4eF9lfvjBkwoAiWvndcmf
        swzHcPz0+KLtjYqJiwiWgDNGX06xtJjq2KUQjKugGQ==
X-Google-Smtp-Source: AMsMyM7hTLBuIuqwNiVTXUWuH+V72A93pKxUMgju4zsOE/gKIpYqIL99d8dKTgGUpkiIKz3d+hdm7y6E6BtW4OfsIcY=
X-Received: by 2002:a05:6870:15c8:b0:133:16e6:5af8 with SMTP id
 k8-20020a05687015c800b0013316e65af8mr1653718oad.80.1665069994311; Thu, 06 Oct
 2022 08:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35@eucas1p2.samsung.com>
 <20221005151309.7278-1-jagan@amarulasolutions.com> <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
In-Reply-To: <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 6 Oct 2022 08:26:22 -0700
Message-ID: <CAJ+vNU0R95ZDkfwo6hz_fb1E8z7ZZRNd7XU2uArsE0WhxvaJDQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 5, 2022 at 1:51 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 05.10.2022 17:12, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v7:
> > * fix the drm bridge attach chain for exynos drm dsi driver
> > * fix the hw_type checking logic
> >
> > Changes for v6:
> > * handle previous bridge for exynos dsi while attaching bridge
> >
> > Changes for v5:
> > * bridge changes to support multi-arch
> > * updated and clear commit messages
> > * add hw_type via plat data
> > * removed unneeded quirk
> > * rebased on linux-next
> >
> > Changes for v4:
> > * include Inki Dae in MAINTAINERS
> > * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> > * update init handling to ensure host init done on first cmd transfer
> >
> > Changes for v3:
> > * fix the mult-arch build
> > * fix dsi host init
> > * updated commit messages
> >
> > Changes for v2:
> > * fix bridge handling
> > * fix dsi host init
> > * correct the commit messages
> >
> > Patch 0001:   Samsung DSIM bridge
> >
> > Patch 0002:   PHY optional
> >
> > Patch 0003:   OF-graph or Child node lookup
> >
> > Patch 0004:   DSI host initialization
> >
> > Patch 0005:   atomic check
> >
> > Patch 0006:   PMS_P offset via plat data
> >
> > Patch 0007:   atomic_get_input_bus_fmts
> >
> > Patch 0008:   input_bus_flags
> >
> > Patch 0009:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0010:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
>
> This finally doesn't break Exynos DSI. :) Feel free to add:
>
> Acked-by: Marek Szyprowski
>
> Tested-by: Marek Szyprowski
>
> The next step would be to merge Dave's patchset and remove the hacks
> added here and there. Otherwise we will end up adding even more hacks soon.

Jagan,

I've also tested this latest series with a Gateworks
imx8mm-venice-gw73xx-0x with a RaspberryPi MIPI DSI compatible DFR0550
display with the following dt overlay:

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

&dsi {
        #address-cells = <1>;
        #size-cells = <0>;
        status = "okay";

        bridge@0 {
                compatible = "toshiba,tc358762";
                reg = <0>;
                vddc-supply = <&attiny>;
                status = "okay";

                ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                                reg = <0>;
                                bridge_in_dsi: endpoint {
                                        remote-endpoint = <&dsi_out_bridge>;

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

&lcdif {
        status = "okay";
};


Tested-by: Tim Harvey <tharvey@gateworks.com> # imx8mm-venice-gw73xx-0x

Thanks for all your work on this!

Best Regards,

Tim



>
> > Repo:
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
> >
> > Any inputs?
> > Jagan.
> >
> > Jagan Teki (10):
> >    drm: bridge: Add Samsung DSIM bridge driver
> >    drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
> >    drm: bridge: samsung-dsim: Mark PHY as optional
> >    drm: bridge: samsung-dsim: Handle proper DSI host initialization
> >    drm: bridge: samsung-dsim: Add atomic_check
> >    drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
> >    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
> >    drm: bridge: samsung-dsim: Add input_bus_flags
> >    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
> >    drm: bridge: samsung-dsim: Add i.MX8MM support
> >
> >   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
> >   MAINTAINERS                                   |    9 +
> >   drivers/gpu/drm/bridge/Kconfig                |   12 +
> >   drivers/gpu/drm/bridge/Makefile               |    1 +
> >   drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
> >   drivers/gpu/drm/exynos/Kconfig                |    1 +
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
> >   include/drm/bridge/samsung-dsim.h             |  115 +
> >   8 files changed, 2108 insertions(+), 1653 deletions(-)
> >   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
> >   create mode 100644 include/drm/bridge/samsung-dsim.h
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
