Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5B7C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jul 2022 16:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234445AbiGVQGC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Jul 2022 12:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbiGVQGB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 12:06:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC45E1FCCA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2022 09:05:59 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id j22so9367001ejs.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2022 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MnftyBzRGSBEVE4hevJey01J9ByqvjlOa85l8x7VehU=;
        b=mKNq2Y6EXqL3tUFN9MNVQzfJPv64ZNkE+Cy9/5Ube3pAMJJDGM6SXDiz69odVtjmAY
         0dV4pCR3Euzf6E2lLFTBq6Rf94J8eMhqC8hrc28hOpSbsXsx53MsQ3LgIbOyyIK/tjD7
         cE+W6wrlx5LXebQoZ4oDdUUxdCbCqIXSc5YB86LwgfzM2Pxvd/xNDwK6/SQHE6McJngb
         bikqXthWvXTV3gasdN4JN1mqJlRcHwVrd/glBa7xQ27Vyfa75SbDISrRq7Pm9m9tjUby
         JyXLBbJZqwNQbBSOVKcgnNSPYQlKoCsfyK2sJYa+39KoCtl7ZYK7Tb2uXCRcl5FW8Vfv
         w6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MnftyBzRGSBEVE4hevJey01J9ByqvjlOa85l8x7VehU=;
        b=RJQSlDY1G3OnIIvGhnXNMxfUTdbQgfmX8iwuyveqfaunirmPGJdYXwpfXh9U54JjYa
         sPkJ3X2xOBuoQe2MYHFAZgy1+XhPQO60AL9LVjSp2R0uehP4Yjp7MA0sBCnldgCBwA3y
         j1oelCVA11s6R8P49M6KHrWNgTIDBwKvT8vSmH9pkcmInbb7mSmg73fRX71WVfLsUEqQ
         DCYgGfn5V7lnIGNnNnAEgts5+z0aoUzg8HxJ/ftP6b+q1QS9PeelkCV+XFYCPVSj7ccZ
         CkeyOsqRof9eW4OD7rpW7hJflPP3z2A/hj8JvAAqWz9Qv0JRgbOIM+zWACl+lQOJML3A
         D3Rw==
X-Gm-Message-State: AJIora9T4SXU9AoxuQyK1qK5kzeEqzwzkDLTGTXCw/4/j/CtUMm/1KXG
        4YXs8NeyMcr8zkzpjSqxCZpZneTKRhAdkPxAr2tOng==
X-Google-Smtp-Source: AGRyM1vBFbtqVsQgghpDhvhpCCJ+MwMdJCOMMWmRAW5CyO+wXnemMWaIL1UBkzGhQ0bB0k/VzGtC8aHiEtuD1f3vW9k=
X-Received: by 2002:a17:906:4fd5:b0:72e:ce13:2438 with SMTP id
 i21-20020a1709064fd500b0072ece132438mr469619ejw.175.1658505958265; Fri, 22
 Jul 2022 09:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com> <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
In-Reply-To: <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 22 Jul 2022 17:05:42 +0100
Message-ID: <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan and Marek.

On Fri, 22 Jul 2022 at 16:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 20.07.2022 17:52, Jagan Teki wrote:
> > Host transfer() in DSI master will invoke only when the DSI commands
> > are sent from DSI devices like DSI Panel or DSI bridges and this
> > host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> >
> > Handling DSI host initialization in transfer calls misses the
> > controller setup for I2C configured DSI bridges.
> >
> > This patch adds the DSI initialization from transfer to bridge
> > pre_enable as the bridge pre_enable API is invoked by core as
> > it is common across all classes of DSI device drivers.
>
> This is still problematic in case of Exynos. Without a workaround like this
>
> https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961
>
> the display on the all real DSI panels on my Exynos based boards is broken.

I'd queried on the other thread trying to address DSI operation [1] as
to whether the test for STOP_STATE (presumably LP-11) at [2] was
actually valid, but had no response.
There is no need to check for bus contention at that point, but should
it happen the driver doesn't write the registers in lines 862-868
having returned -EFAULT at line 853. The controller is therefore only
partially initialised.

I may be misinterpreting what that code is waiting for though, or the
hardware may require some further state before it can be initialised.

  Dave

[1] https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg397703.html
[2] https://github.com/mszyprow/linux/blob/11bbfc61272da9610dd5c574bb8ef838dc150961/drivers/gpu/drm/bridge/samsung-dsim.c#L850

> >
> > v3:
> > * none
> >
> > v2:
> > * check initialized state in samsung_dsim_init
> >
> > v1:
> > * keep DSI init in host transfer
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 9b74a3f98a17..b07909a52f2d 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1258,6 +1258,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
> >   {
> >       const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> >
> > +     if (dsi->state & DSIM_STATE_INITIALIZED)
> > +             return 0;
> > +
> >       samsung_dsim_reset(dsi);
> >       samsung_dsim_enable_irq(dsi);
> >
> > @@ -1270,6 +1273,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
> >       samsung_dsim_set_phy_ctrl(dsi);
> >       samsung_dsim_init_link(dsi);
> >
> > +     dsi->state |= DSIM_STATE_INITIALIZED;
> > +
> >       return 0;
> >   }
> >
> > @@ -1289,6 +1294,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
> >       }
> >
> >       dsi->state |= DSIM_STATE_ENABLED;
> > +
> > +     ret = samsung_dsim_init(dsi);
> > +     if (ret)
> > +             return;
> >   }
> >
> >   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> > @@ -1464,12 +1473,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> >       if (!(dsi->state & DSIM_STATE_ENABLED))
> >               return -EINVAL;
> >
> > -     if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> > -             ret = samsung_dsim_init(dsi);
> > -             if (ret)
> > -                     return ret;
> > -             dsi->state |= DSIM_STATE_INITIALIZED;
> > -     }
> > +     ret = samsung_dsim_init(dsi);
> > +     if (ret)
> > +             return ret;
> >
> >       ret = mipi_dsi_create_packet(&xfer.packet, msg);
> >       if (ret < 0)
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
