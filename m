Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AE8C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Oct 2022 09:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJTJUT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Oct 2022 05:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJTJUR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Oct 2022 05:20:17 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29523B1BA5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Oct 2022 02:20:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y14so45847010ejd.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Oct 2022 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4S70YJksDVYlpSIdOzNDF7El0xkhTpiwZNPCDS+5kU=;
        b=l1/4BAalaP5NMZFyq2rYuLQVevKjwfJysvzaoYfcfIbTpap1NfrBUn4EaAptkq670r
         rYfSiHt0+B0QhKl42Rl8l3I5X10iAJ0+NQzaAgNUcJBMGcSVQudAR65ehvpFGwvwfnOd
         k0oiwXr2tOd0KK2BC4OOY3odFrf/99cIdtTvmZNHrhjqJz5XmjolI4lEGGEbZOCKhsUu
         B25FWuOLxM/LiN5g4ItXrk48P8xkKLeB1nBga9HjaOEXedZBZUYTBHHkQc7o/6/5x/Et
         kE0+0QACGJC6hn2fTOfOK+pMdv93Zr9NJAYZmPamV4hKK7l0WMIGB9igiU07JQv6tege
         q6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4S70YJksDVYlpSIdOzNDF7El0xkhTpiwZNPCDS+5kU=;
        b=ogFcWBAejABxDdDT+EiMG85ApZHfzwadhVnqo8d1dNrDqmgZAJMDR+TcsiNN1WUnkI
         xM1pDx3iqX7PuE7D61umSPiAkIdUN18i83U7UjFyaRuNVo5doh9sJ/M2kaPH3KiyqH2G
         y2Fkxyum9Gees0Oy9KTMjvrCrEGSEWzbzlbChPB69yKzit6s1a3PqEqqXSQsCbzaOeWV
         wquMEtvmLXWGEf8OnKjO56dmKoZAzZg2lZ46GQFVKxA83j0/e32F+uG73P0aojZkjmNn
         Rizc/R96l7VdwfQUNBPy+TanljFUh36WKgJwC2eIn/8LVG0H0PWRR2FVvN6n/bgfxlwa
         qR9Q==
X-Gm-Message-State: ACrzQf3Sp6QbnnjUswOiIsUoNhV6BBaoYF1sQEWVM0H9sIPMw+0v17dF
        BSVMmQ2t5eHRnqTE4CIadV6DRnx2Za/E1Fp/iSquow==
X-Google-Smtp-Source: AMsMyM6fMToLGQtLNv+aUrAPf/AfuLJ7BTxZcq++tnNuT1/RtcRsuqcD24ON4TgId/nbjhi99Ln6pRLaDqFaU62Tfoo=
X-Received: by 2002:a17:907:7ba8:b0:78e:1b38:6b1b with SMTP id
 ne40-20020a1709077ba800b0078e1b386b1bmr9851699ejc.626.1666257612142; Thu, 20
 Oct 2022 02:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 Oct 2022 11:20:01 +0200
Message-ID: <CAG3jFytYaUG5mj6SCd+ZRRhU=paCo-irj4ZXFDXP2etHztV9yg@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hey Jagan,

On Wed, 5 Oct 2022 at 17:13, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
>
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
>
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
>
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>
> Patch 0001:     Samsung DSIM bridge
>
> Patch 0002:     PHY optional
>
> Patch 0003:     OF-graph or Child node lookup
>
> Patch 0004:     DSI host initialization
>
> Patch 0005:     atomic check
>
> Patch 0006:     PMS_P offset via plat data
>
> Patch 0007:     atomic_get_input_bus_fmts
>
> Patch 0008:     input_bus_flags
>
> Patch 0009:     document fsl,imx8mm-mipi-dsim
>
> Patch 0010:     add i.MX8MM DSIM support
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
>
> Any inputs?
> Jagan.
>
> Jagan Teki (10):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Handle proper DSI host initialization
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>   drm: bridge: samsung-dsim: Add i.MX8MM support
>
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |    9 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
>  include/drm/bridge/samsung-dsim.h             |  115 +
>  8 files changed, 2108 insertions(+), 1653 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h

I'm seeing some checkpatch --strict warnings throughout this series,
do you mind having a look at them?
