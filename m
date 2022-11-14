Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36A8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Nov 2022 07:49:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiKNHt0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Nov 2022 02:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbiKNHtZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 02:49:25 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705EA63AA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Nov 2022 23:49:24 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id d123so7576955iof.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Nov 2022 23:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l10Y05Ozm97auSuQ6HRYLA0YO/ZBACnbjOnhxf9ll8Q=;
        b=hcW+2knF62DESuhsUXapbEW5bV52WgTzRkANlI8cHygtVW7lPQuvauk0GcJuAV1hZb
         +Vvywbo5I3VSDUVFOQBfFRIEx7pe1w09PH7MkgG0hbzezj/77F1zBmwdsn6cB/IB9uLv
         EoDza36DVopXYFRGUaQcmXW+P4dUt6ECQeY28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l10Y05Ozm97auSuQ6HRYLA0YO/ZBACnbjOnhxf9ll8Q=;
        b=fCRjZXcJkUeR1zWPLcQ5aiazXQI+JgRSv4gnnd5EgOnZy2TWaUhSpPdfOouj40Jq9J
         rK4Yfr105Z7QDyPpZ4vgOsz863vLd9Xs3gtIHma7nUfo19PCK+Thjn81emaFkNuYSNsR
         juWmwGxnikG1hm3T9GIGUEPq4dXOlHUL+wY8RaFM1U+H35oSl8d2iZhy9kFxwwByJGh5
         /SCxU7714PaviMArbKc1GKtFXFYBX8Beu5VlQ4JZ8z2Epg7w4CT91k2seQ+L+uuPpk5j
         hrbelK2g6iEwIQOzxeEiTJRVg0BHiUguroLIND3H1b5U5LWYnDQ3Uo/OpHZVoQV+hYmp
         z5WA==
X-Gm-Message-State: ANoB5pmsBMe95P2a/zvyGlL+icD98sZtozCscyPu9vYkqQDhs8oL8QCp
        lNjbOxgiIXAfRklqx/4LqOD+0DD40DM3fugaCjDz1g==
X-Google-Smtp-Source: AA0mqf53HqeUzOa5PRZKBtefUs6DkN7AdtPHZ8A8eDybGWGTUx06vST9b/nPE85mA23BOqdmT0MwYhDigMeofB3qQ/0=
X-Received: by 2002:a02:a910:0:b0:375:bdb9:f1e4 with SMTP id
 n16-20020a02a910000000b00375bdb9f1e4mr5281900jam.67.1668412163687; Sun, 13
 Nov 2022 23:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com> <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
In-Reply-To: <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 14 Nov 2022 13:19:12 +0530
Message-ID: <CAMty3ZDE4gt_Hhb3pgXW570d6F5f8F3WeEEHiMVuXyrqmka9Kw@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
To:     Marek Vasut <marex@denx.de>
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

On Sun, Nov 13, 2022 at 5:51 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 19:38, Jagan Teki wrote:
> > Finding the right input bus format throughout the pipeline is hard
> > so add atomic_get_input_bus_fmts callback and initialize with the
> > proper input format from list of supported output formats.
> >
> > This format can be used in pipeline for negotiating bus format between
> > the DSI-end of this bridge and the other component closer to pipeline
> > components.
> >
> > List of Pixel formats are taken from,
> > AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> > 3.7.4 Pixel formats
> > Table 14. DSI pixel packing formats
> >
> > v8:
> > * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
> >
> > v7, v6, v5, v4:
> > * none
> >
> > v3:
> > * include media-bus-format.h
> >
> > v2:
> > * none
> >
> > v1:
> > * new patch
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
> >   1 file changed, 53 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 0fe153b29e4f..33e5ae9c865f 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/clk.h>
> >   #include <linux/delay.h>
> >   #include <linux/irq.h>
> > +#include <linux/media-bus-format.h>
> >   #include <linux/of_device.h>
> >   #include <linux/phy/phy.h>
> >
> > @@ -1321,6 +1322,57 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >       pm_runtime_put_sync(dsi->dev);
> >   }
> >
> > +/*
> > + * This pixel output formats list referenced from,
> > + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> > + * 3.7.4 Pixel formats
> > + * Table 14. DSI pixel packing formats
> > + */
> > +static const u32 samsung_dsim_pixel_output_fmts[] = {
>
> You can also add :
>
> MEDIA_BUS_FMT_YUYV10_1X20
>
> MEDIA_BUS_FMT_YUYV12_1X24

Are these for the below formats?

"Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
 Packed Pixel Stream, 24-bit YCbCr, 4:2:2"
>
> > +     MEDIA_BUS_FMT_UYVY8_1X16,
> > +     MEDIA_BUS_FMT_RGB101010_1X30,
> > +     MEDIA_BUS_FMT_RGB121212_1X36,
> > +     MEDIA_BUS_FMT_RGB565_1X16,
> > +     MEDIA_BUS_FMT_RGB666_1X18,
> > +     MEDIA_BUS_FMT_RGB888_1X24,
> > +};
> > +
> > +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
> > +             if (samsung_dsim_pixel_output_fmts[i] == fmt)
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static u32 *
> > +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                    struct drm_bridge_state *bridge_state,
> > +                                    struct drm_crtc_state *crtc_state,
> > +                                    struct drm_connector_state *conn_state,
> > +                                    u32 output_fmt,
> > +                                    unsigned int *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +
> > +     if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> > +             return NULL;
> > +
> > +     *num_input_fmts = 1;
>
> Shouldn't this be 6 ?
>
> > +     input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +     if (!input_fmts)
> > +             return NULL;
> > +
> > +     input_fmts[0] = output_fmt;
>
> Shouldn't this be a list of all 6 supported pixel formats ?

Negotiation would settle to return one input_fmt from the list of
supporting output_fmts. so the num_input_fmts would be 1 rather than
the number of fmts in the supporting list. This is what I understood
from the atomic_get_input_bus_fmts API. let me know if I miss
something here.

Jagan.
