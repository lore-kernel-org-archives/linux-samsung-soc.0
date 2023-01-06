Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F326EC5479D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Jan 2023 14:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbjAFOfZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Jan 2023 09:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbjAFOez (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2023 09:34:55 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFEF41663
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Jan 2023 06:34:42 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so5330324pjg.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jan 2023 06:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZaYPy2tPVFksG/KUTGQyNyi3qYzIkXR+MVojde5xOo=;
        b=iuKyNvVsyi+JoRiZKQ5M642RXQ+jrigvnNAyN4XUob3BjJOPOvoY4N659ySXW/w/eU
         5LXGUwga9nfjeOHeHwV4Xkmygovebw1LCaU4RIQ1wjG7VJ3vGCNOmMzbMQz8ui/esgOK
         pM2ZgxWxLbt9QEQTuJ9jU9z/U2cBT2Y/m7uvSTDRAZYPe/A3OXYA/l3V9rg+dpkOew2B
         vT/TR59O9nVDdUTKkIskOK75NCtriixC1I8E+Bli16Z17lLD9+aOASIBH1dzwLrXSyuU
         xrHFBs1O1DIvFkPy4tJoHn3ZXX7MrjnxRNhonNgueupaVTphNAu4G2nQdoJaQJQspsi0
         zifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZaYPy2tPVFksG/KUTGQyNyi3qYzIkXR+MVojde5xOo=;
        b=XRI/gX2I12xYsvoNWMH5lHwt3qq2B1KQGFft3xPe+/xw+4kii5u0/Sx5CPl736tCsy
         hqII3XDA636D0qh2JEKzvmReTWODslDj0arc9l+Fz6XGAWFQ+qxNLefATY8qHuaNubig
         dHOZ0HCTUTN/1/S5s8N8jQAIW9xG9UQuZf6tnJPZj+XBaxjSaNlCQsvEycRKe6O8/5zz
         mQKyD2uSohlXh+jzOQLEUuIPw/jUnSOl160tIatcrgWsrI20BZN63wgpD7oSXB4Lv0ni
         mYgIeprXPYYu/zsDUUsve9kmpHWGh1JEBTZ/1Jiokhyc2jlqJ5bARrLvmtNEo2dX5ynm
         myvQ==
X-Gm-Message-State: AFqh2krxJnzj6rrpKIiUV7ngCYdxeBbXv5Nzl8PhCvz/n+4lZjN+pXFf
        X1H8PYCgJbpSB025KCbpUIbR8rDTRLDkRiVidFo=
X-Google-Smtp-Source: AMrXdXtgXMVF9F+kBpfmC6kWHetjRYrPuuzz4gzUJuQ9KVBKzTvk0uO/wT2FJSA7o0+qxu8gdyTuTAZty2ADOJM+55A=
X-Received: by 2002:a17:902:7e41:b0:192:5aae:c828 with SMTP id
 a1-20020a1709027e4100b001925aaec828mr2263552pln.125.1673015682162; Fri, 06
 Jan 2023 06:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com> <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
In-Reply-To: <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 6 Jan 2023 08:34:30 -0600
Message-ID: <CAHCN7xLyS8Jr38gNSyaRMEU3zYg04AhyC79owpTrHbbLf8cL5A@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
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

On Thu, Jan 5, 2023 at 4:24 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Dec 14, 2022 at 6:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
> >
> > Patch 0005 - 0006: optional PHY, PMS_P offset
> >
> > Patch 0007       : introduce hw_type
> >
> > Patch 0008       : fixing host init
> >
> > Patch 0009       : atomic_check
> >
> > Patch 0010       : input_bus_flags
> >
> > Patch 0011       : atomic_get_input_bus_fmts
> >
> > Patch 0012 - 0013: component vs bridge
> >
> > Patch 0014       : DSIM bridge
> >
> > Patch 0015 - 0016: i.MX8M Mini/Nano
> >
> > Patch 0017 - 0018: i.MX8M Plus
> >
> > Changes for v10:
> > - rebase on drm-misc-next
> > - add drm_of_dsi_find_panel_or_bridge
> > - add devm_drm_of_dsi_get_bridge
> > - fix host initialization (Thanks to Marek Szyprowski)
> > - rearrange the tiny patches for easy to review
> > - update simple names for enum hw_type
> > - add is_hw_exynos macro
> > - rework on commit messages
> >
> > Changes for v9:
> > - rebase on drm-misc-next
> > - drop drm bridge attach fix for Exynos
> > - added prepare_prev_first flag
> > - added pre_enable_prev_first flag
> > - fix bridge chain order for exynos
> > - added fix for Exynos host init for first DSI transfer
> > - added MEDIA_BUS_FMT_FIXED
> > - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
> >   list is unsupported.
> > - added MEDIA_BUS_FMT_YUYV10_1X20
> > - added MEDIA_BUS_FMT_YUYV12_1X24
> >
> > Changes for v8:
> > * fixed comment lines
> > * fixed commit messages
> > * fixed video mode bits
> > * collect Marek Ack
> > * fixed video mode bit names
> > * update input formats logic
> > * added imx8mplus support
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
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Repo:
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
> >
> > v9:
> > https://lore.kernel.org/all/20221209152343.180139-1-jagan@amarulasolutions.com/
> >
> > Any inputs?
> > Jagan.
> >
> > Jagan Teki (16):
> >   drm: of: Lookup if child node has DSI panel or bridge
> >   drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
> >   drm: exynos: dsi: Drop explicit call to bridge detach
> >   drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
> >   drm: exynos: dsi: Mark PHY as optional
> >   drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
> >   drm: exynos: dsi: Introduce hw_type platform data
> >   drm: exynos: dsi: Add atomic check
> >   drm: exynos: dsi: Add input_bus_flags
> >   drm: exynos: dsi: Add atomic_get_input_bus_fmts
> >   drm: exynos: dsi: Consolidate component and bridge
> >   drm: exynos: dsi: Add Exynos based host irq hooks
> >   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
> >   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
> >   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
> >   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
> >
> > Marek Szyprowski (1):
> >   drm: exynos: dsi: Handle proper host initialization
> >
> > Marek Vasut (1):
> >   drm: bridge: samsung-dsim: Add i.MX8M Plus support
>
> Does anyone have any other comments on this? I would like to send v11
> with a few nits on v10. Please let me know.

I got it working on an LVDS display that I have, but I didn't get it
working on the HDMI bridge.  Since we have a few tested-by people,
it'd be nice to see this integrated so we can work on ading more
functionality

adam
>
> Thanks,
> Jagan.
