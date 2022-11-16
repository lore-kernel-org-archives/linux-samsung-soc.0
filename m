Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B85C4167E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Nov 2022 11:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiKPLpz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Nov 2022 06:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbiKPLpZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 06:45:25 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD07DDFD3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 03:30:32 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id 11so12989961iou.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 03:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4aBMJ8kYEkh7R4S/WpFIBHIM/nZA2sjQ6sx0TF7I1GM=;
        b=ckD8Hiq6dP9OfkR/W7ioyYQcS9frxL2N/CLWoGaZhgu8GUy7hHfox8d2HFaKUlK+Ix
         61qk1ezTmL9ekzc9QHgA8Q3vxNJSEorIYGdyjq0jOkKv2ZPd8q1gS+7xfmXxWEYcI3uU
         DQpH9hGQzZJivZQwFDpcZdAu1yMxvG2Iq/HzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aBMJ8kYEkh7R4S/WpFIBHIM/nZA2sjQ6sx0TF7I1GM=;
        b=DJML2jLmjm3wFZW8K6N1SwAf3J2zBxV0u9iuqgc0tS1AR2X9GU2b4ZIemmiEc7g9Rq
         YhaYIBUBlrCgFDKRz0d15r2ldpsKeYlH5DREzFy2k1ZQLQBz27svRJuvdxxD02l4CpzT
         yCXn5mULXDbQqNVEfTMQ5vfD6EkpszEfNkrX/DDxXTYtlii6fDO+80biXA+yDOW8il/J
         F/j357GhYltReVyA8UxtXr+EjWCXvsdFDL2iRYB8Wk1yIznF98Xoo1unDOSc+X4xUseH
         XRrRJuEsgGke6SciCg06HvsyvpEF05YoWTCAt8dxGENqF6Tuo1N1dWigKFi5oLzEgJa+
         wXDw==
X-Gm-Message-State: ANoB5plu17/kBKGPjDa/IgHKAwFLZ9JTCu4ebqTJDJ+mp6mZw6BKBnli
        yLz/Azv4FSUpZ2wb3L4zI+9XZB5IM4B1w7vEFwR64w==
X-Google-Smtp-Source: AA0mqf4Ybpn1by0jqTKLh8cuMc+KV7ZyH+joth4+kuKo3gxFuQ7ZpcNvxXB4B5vp19KJm0G8mWQopSH5MNPH83fGBPI=
X-Received: by 2002:a6b:b7c6:0:b0:6d6:bff5:bbdf with SMTP id
 h189-20020a6bb7c6000000b006d6bff5bbdfmr9760231iof.156.1668598231852; Wed, 16
 Nov 2022 03:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com> <694ccb10-15ad-5192-dd1b-86628227fb65@denx.de>
 <CAMty3ZDE4gt_Hhb3pgXW570d6F5f8F3WeEEHiMVuXyrqmka9Kw@mail.gmail.com>
 <CGME20221115120119eucas1p1c57ca32b0a372d00cfb7b6dfb86cc1a7@eucas1p1.samsung.com>
 <35a96ba1-1022-5f7a-ffb6-b3400279e244@denx.de> <60729cf5-04b1-b9aa-fb0f-60efacde285d@samsung.com>
 <7635358a-fc32-5a78-6130-7c5f4dd2d81b@denx.de> <bfd2eea0-04eb-9c98-e8a2-967455d6e5ad@samsung.com>
In-Reply-To: <bfd2eea0-04eb-9c98-e8a2-967455d6e5ad@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 16 Nov 2022 17:00:20 +0530
Message-ID: <CAMty3ZAWPBEJw3UN8cum+1wL4k03_eaXySyapHsHj_PwP7oQxA@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Marek Vasut <marex@denx.de>
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

On Wed, Nov 16, 2022 at 4:37 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 16.11.2022 11:49, Marek Vasut wrote:
> > On 11/16/22 09:07, Marek Szyprowski wrote:
> >> On 15.11.2022 13:00, Marek Vasut wrote:
> >>> On 11/14/22 08:49, Jagan Teki wrote:
> >>>> On Sun, Nov 13, 2022 at 5:51 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>
> >>>>> On 11/10/22 19:38, Jagan Teki wrote:
> >>>>>> Finding the right input bus format throughout the pipeline is hard
> >>>>>> so add atomic_get_input_bus_fmts callback and initialize with the
> >>>>>> proper input format from list of supported output formats.
> >>>>>>
> >>>>>> This format can be used in pipeline for negotiating bus format
> >>>>>> between
> >>>>>> the DSI-end of this bridge and the other component closer to
> >>>>>> pipeline
> >>>>>> components.
> >>>>>>
> >>>>>> List of Pixel formats are taken from,
> >>>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >>>>>> 3.7.4 Pixel formats
> >>>>>> Table 14. DSI pixel packing formats
> >>>>>>
> >>>>>> v8:
> >>>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI
> >>>>>> DSI/CSI-2
> >>>>>>
> >>>>>> v7, v6, v5, v4:
> >>>>>> * none
> >>>>>>
> >>>>>> v3:
> >>>>>> * include media-bus-format.h
> >>>>>>
> >>>>>> v2:
> >>>>>> * none
> >>>>>>
> >>>>>> v1:
> >>>>>> * new patch
> >>>>>>
> >>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 53
> >>>>>> +++++++++++++++++++++++++++
> >>>>>>     1 file changed, 53 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>> index 0fe153b29e4f..33e5ae9c865f 100644
> >>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>> @@ -15,6 +15,7 @@
> >>>>>>     #include <linux/clk.h>
> >>>>>>     #include <linux/delay.h>
> >>>>>>     #include <linux/irq.h>
> >>>>>> +#include <linux/media-bus-format.h>
> >>>>>>     #include <linux/of_device.h>
> >>>>>>     #include <linux/phy/phy.h>
> >>>>>>
> >>>>>> @@ -1321,6 +1322,57 @@ static void
> >>>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>>>>         pm_runtime_put_sync(dsi->dev);
> >>>>>>     }
> >>>>>>
> >>>>>> +/*
> >>>>>> + * This pixel output formats list referenced from,
> >>>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >>>>>> + * 3.7.4 Pixel formats
> >>>>>> + * Table 14. DSI pixel packing formats
> >>>>>> + */
> >>>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
> >>>>>
> >>>>> You can also add :
> >>>>>
> >>>>> MEDIA_BUS_FMT_YUYV10_1X20
> >>>>>
> >>>>> MEDIA_BUS_FMT_YUYV12_1X24
> >>>>
> >>>> Are these for the below formats?
> >>>>
> >>>> "Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> >>>>    Packed Pixel Stream, 24-bit YCbCr, 4:2:2"
> >>>>>
> >>>>>> +     MEDIA_BUS_FMT_UYVY8_1X16,
> >>>>>> +     MEDIA_BUS_FMT_RGB101010_1X30,
> >>>>>> +     MEDIA_BUS_FMT_RGB121212_1X36,
> >>>>>> +     MEDIA_BUS_FMT_RGB565_1X16,
> >>>>>> +     MEDIA_BUS_FMT_RGB666_1X18,
> >>>>>> +     MEDIA_BUS_FMT_RGB888_1X24,
> >>>>>> +};
> >>>>>> +
> >>>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> >>>>>> +{
> >>>>>> +     int i;
> >>>>>> +
> >>>>>> +     for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts);
> >>>>>> i++) {
> >>>>>> +             if (samsung_dsim_pixel_output_fmts[i] == fmt)
> >>>>>> +                     return true;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     return false;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static u32 *
> >>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>>>>> +                                    struct drm_bridge_state
> >>>>>> *bridge_state,
> >>>>>> +                                    struct drm_crtc_state
> >>>>>> *crtc_state,
> >>>>>> +                                    struct drm_connector_state
> >>>>>> *conn_state,
> >>>>>> +                                    u32 output_fmt,
> >>>>>> +                                    unsigned int *num_input_fmts)
> >>>>>> +{
> >>>>>> +     u32 *input_fmts;
> >>>>>> +
> >>>>>> +     if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> >>>>>> +             return NULL;
> >>>>>> +
> >>>>>> +     *num_input_fmts = 1;
> >>>>>
> >>>>> Shouldn't this be 6 ?
> >>>>>
> >>>>>> +     input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> >>>>>> +     if (!input_fmts)
> >>>>>> +             return NULL;
> >>>>>> +
> >>>>>> +     input_fmts[0] = output_fmt;
> >>>>>
> >>>>> Shouldn't this be a list of all 6 supported pixel formats ?
> >>>>
> >>>> Negotiation would settle to return one input_fmt from the list of
> >>>> supporting output_fmts. so the num_input_fmts would be 1 rather than
> >>>> the number of fmts in the supporting list. This is what I understood
> >>>> from the atomic_get_input_bus_fmts API. let me know if I miss
> >>>> something here.
> >>>
> >>> How does the negotiation work for this kind of pipeline:
> >>>
> >>> LCDIFv3<->DSIM<->HDMI bridge<->HDMI connector
> >>>
> >>> where all elements (LCDIFv3, DSIM, HDMI bridge) can support either
> >>> RGB888 or packed YUV422 ?
> >>>
> >>> Who decides the format used by such pipeline ?
> >>>
> >>> Why should it be the DSIM bridge and not e.g. the HDMI bridge or the
> >>> LCDIFv3 ?
> >>
> >>
> >> If I got it right, the drivers reports their preference for the returned
> >> formats. The format that is first in the reported array is the most
> >> preferred one. This probably means that in your case the HDMI bridge
> >> decides by reporting RGB or YUV first (if all elements supports both).
> >
> > But in that case, we need to list input_fmts[0]...input_fmts[n-1] in
> > samsung_dsim_atomic_get_input_bus_fmts() and also set *num_input_fmts
> > = n, correct ?
> >
> Yes, if I got the bus format negotiation code right, but I didn't check
> the details.

It Looks like if the number of formats returned by the array is more
than 1, then the input_fmts array needs to return by listing formats
in decreasing preference order so that the bridge core will try all
formats until it finds one that works. But the question here is how
much is the array number, how to decide? I can see dw-hdmi return a
maximum of 3 possible input formats for an output format so the array
seems to be 3 here, but the rest of drivers like imx8qxp-pixel-link do
return 1 from the list of supported - dsim doing the same here.

If we are sure dsim can support or feature 2 then order RGB888 and
YUV422 decreasing preference and return them otherwise stick with a
single return of checking supported list and return desired one.

Jagan.
