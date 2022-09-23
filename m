Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAA9C6FA82
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Sep 2022 08:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiIWIcL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Sep 2022 04:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiIWIcL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Sep 2022 04:32:11 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDE21DF0A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2022 01:32:10 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b35so17112831edf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2022 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tYNwB7gsFieqfbLEPXElyVbDH6AzWiehFOxjpHySY/g=;
        b=Jaaaenz1419IfujefMFH+L6vaXPGha7RsVI4MJECqFvtM8hveoiCID7P7HeIS5paLY
         2IJxZ+PdCWENWA3qzpdxveJwaGgYJDlGqzy95V5QWfFyE3DSynaCBKzwTGjJpqlbpbAv
         AosZwokVXhJWvZPjV1utM9tw1rZwiOL1M5cL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tYNwB7gsFieqfbLEPXElyVbDH6AzWiehFOxjpHySY/g=;
        b=C6jGyGJInQRRu2ZE2xut7+viTJRODo4KglCwOZhOMbCgrEPFvrdJwhER7typAA51WX
         9V0WymElqibBZtEHeMUwZ3u36HCpiJCyH0xD9fjylq9GhLDS2W0AqC4fl58DIFjSGX7N
         I1Gdgew1EpIB29P0cZFPiXg1AFCukO/mu0sliuQi3vy6hTinKvcg5cEnGAxTp6jMUkfS
         /ST5bJh8f64nLNYVKHsz4vqWgaEerDWmn2Bx1x49kk0sXUnLJSpmYvLnDS+gFHpJn7Yw
         c/z9sbdJAyk4+4VeI2zCqcviCn6n+ZxkuyMvaOg32Mc5B4+rxFJ/ukNf369DapeH/rxb
         BTtA==
X-Gm-Message-State: ACrzQf1xqZBtLDp2pWjAlmzFX9EMbW73S0W3bdqxvdvxVxbh13yw4+rS
        3PSHxJx4C4LWIDndN/MhwmZ+Mx+Uidc4whmp4ng9Kw==
X-Google-Smtp-Source: AMsMyM4Mmk9Sy5Dum9OSvR8YAnVSqbcT7mbcwEpx8XOXWx/9abGrqqmT4R4kRJBwch1UT3JCPBn3TyQPId+RKz2GXq4=
X-Received: by 2002:a05:6402:11c8:b0:451:7220:6343 with SMTP id
 j8-20020a05640211c800b0045172206343mr7112954edw.184.1663921928568; Fri, 23
 Sep 2022 01:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220916181731.89764-1-jagan@amarulasolutions.com> <CAJ+vNU2gLKm_Si7xUsRJuzbJyEFHpC_TqsiorBAT5ADTZjsPZg@mail.gmail.com>
In-Reply-To: <CAJ+vNU2gLKm_Si7xUsRJuzbJyEFHpC_TqsiorBAT5ADTZjsPZg@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 23 Sep 2022 14:01:57 +0530
Message-ID: <CAMty3ZCWFD_YxLkjs-d_fGeakEdsbJ=MKwQM3L_6QOm0Le8=kQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Tim Harvey <tharvey@gateworks.com>
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

On Tue, Sep 20, 2022 at 3:13 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Fri, Sep 16, 2022 at 11:18 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > Previous v4 can be available here [1], repo on linux-next [2] and
> > Engicam i.Core MX8M Mini SoM boot log [3].
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v3:
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
> > Patch 0001:     Restore proper bridge chain in exynos_dsi
> >
> > Patch 0002:     Samsung DSIM bridge
> >
> > Patch 0003:     PHY optional
> >
> > Patch 0004:     OF-graph or Child node lookup
> >
> > Patch 0005:     DSI host initialization
> >
> > Patch 0006:     atomic check
> >
> > Patch 0007:     PMS_P offset via plat data
> >
> > Patch 0008:     atomic_get_input_bus_fmts
> >
> > Patch 0009:     input_bus_flags
> >
> > Patch 0010:     document fsl,imx8mm-mipi-dsim
> >
> > Patch 0011:     add i.MX8MM DSIM support
> >
> > [3] https://gist.github.com/openedev/22b2d63b30ade0ba55ab414a2f47aaf0
> > [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v5
>
> Jagan,
>
> I would like to try out this latest series a board I have here. It
> looks like perhaps you did not push this imx8mm-dsi-v5 branch?

Please wait for the next version patches.

Thanks,
Jagan.
