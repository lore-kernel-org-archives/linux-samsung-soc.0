Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB48CCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Jul 2022 12:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbiGSMbH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Jul 2022 08:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240670AbiGSM3u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 08:29:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955686BC12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jul 2022 05:11:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w12so19254587edd.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jul 2022 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZhavUp7BHi+VmzoRcY2DbuM/lf0xElZLhXi6he6CgJo=;
        b=UQaf9GCxACizE0JHp7NUyNsr3qwOY+LIlhYAMa1/BdRbxcM0pdvlvzSLhUaIY5GbO7
         qxxB7YzUm6oBQq11ShnBFy3QPZiLchV0twoqX6ZbZDy4vV/INWdByhYcHf39f5d+rYg3
         N5kWp8OctOCYswhRqzr87TmTbocRY36jeNhwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZhavUp7BHi+VmzoRcY2DbuM/lf0xElZLhXi6he6CgJo=;
        b=RnNC4eOFT9aOrMbuK1Ad6bxRUSVzG/TTZyHvRh/xBAOGATImRRHqJ7nkVOraZtn4M2
         I/0AqLAgNdATu+BntyNRidlK0ehBGrGCumt6cJkQfQK3anJJZ4fn3Fc0f9mQ9PElFdYr
         06FNY4PHlcjjZea4ztwR091gqUygRNKAsdeVgUGjm5pFfZIjcQcr12BqF20pjdOEg59P
         iDUCFWJL7U7M0NBPp/CZKE9jKV0sYZHs/gG+a61fS4ypS92QTUz032xi+krSON3e+MTQ
         VK0fleGM36ODYn/jT3kdGF8tG+kfGqF5gIo9s+5GRieX3SXcaMu5+7cnAXbbDt4rrC4b
         4cww==
X-Gm-Message-State: AJIora+RNjOLzequaugNYT1TCm1G3YzCATYQolrY61mM4Vx+yW3R/x56
        kpd1o9Uqmg3yKKtUeE7Fp/1I3mtCu87Ud0nkLdCEIA==
X-Google-Smtp-Source: AGRyM1svlcT6L8HLeoUMf6nh/a+vFXhvJFV1t0CGuwn4vRiSp/GDrFX9C4NjIAl37rhTAPVN3v/3G7ZG2swQF5P9Rzc=
X-Received: by 2002:a05:6402:d0a:b0:437:f9a1:8493 with SMTP id
 eb10-20020a0564020d0a00b00437f9a18493mr43554061edb.226.1658232687680; Tue, 19
 Jul 2022 05:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <CGME20220504114135eucas1p2b874e8c467c6b507239861d67198be25@eucas1p2.samsung.com>
 <20220504114021.33265-8-jagan@amarulasolutions.com> <7dc628c5-a387-1065-6e41-bb16c13cb1b6@samsung.com>
In-Reply-To: <7dc628c5-a387-1065-6e41-bb16c13cb1b6@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 19 Jul 2022 17:41:16 +0530
Message-ID: <CAMty3ZBsEfh4menMG9oEyJ-vU32DNYS+YQUX_6WgKx8hq740mg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] drm: bridge: samsung-dsim: Add module init, exit
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, May 9, 2022 at 5:35 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 04.05.2022 13:40, Jagan Teki wrote:
> > Add module init and exit functions for the bridge to register
> > and unregister dsi_driver.
> >
> > Exynos drm driver stack will register the platform_driver separately
> > in the common of it's exynos_drm_drv.c including dsi_driver.
> >
> > Register again would return -EBUSY, so return 0 for such cases as
> > dsi_driver is already registered.
> >
> > v2, v1:
> > * none
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 8f9ae16d45bc..b618e52d0ee3 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1740,6 +1740,28 @@ struct platform_driver dsi_driver = {
> >       },
> >   };
> >
> > +static int __init samsung_mipi_dsim_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = platform_driver_register(&dsi_driver);
> > +
> > +     /**
> > +      * Exynos drm driver stack will register the platform_driver
> > +      * separately in the common of it's exynos_drm_drv.c including
> > +      * dsi_driver. Register again would return -EBUSY, so return 0
> > +      * for such cases as dsi_driver is already registered.
> > +      */
> > +     return ret == -EBUSY ? 0 : ret;
> > +}
> > +module_init(samsung_mipi_dsim_init);
>
> I've just noticed this. The above approach is really a bad pattern:
> registering the same driver 2 times and relying on the error.

If it tries to register 2nd time, then it returns EBUSY so we are
returning 0 for that case. not sure why it registers 2nd time again.

Jagan.
