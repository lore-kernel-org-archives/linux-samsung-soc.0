Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1B5C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 07:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiJQHvh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Oct 2022 03:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiJQHvf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 03:51:35 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F642220ED
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 00:51:34 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so12378496fac.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XWLP7i62jFW6oRSoyvp2q+yVGfR5Lxj+voPavApZkTk=;
        b=AFDgqcKxcIKQr1YaXq+rVne8uvFcTZI4m6WkMq5trqjHT0ECPcb1TxC+I1giYXDg/a
         jadAvelIFRvCneIpXKITT8qpJEROC7Twif9oLRa6hFBOaiLMLjk547h/D0RO9SdugCBF
         OLdJzS6YbluYIU+FknEhCrL4q1RqAty97TcNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWLP7i62jFW6oRSoyvp2q+yVGfR5Lxj+voPavApZkTk=;
        b=vFCAsbw3l7OJSCZeHSprN++4iS2Ckm9U2i2lPe3Qtq+xyLfVeqwYgFDB6ODVQ/Y7vx
         7aNAhHmd+QKXPJsn/j5+7oHiCjtxzGtJa7JZGbJyx1QUvHXDigEAfyPW1r86SHc2ugrl
         zlcVqDoCmlcN+VxtDnFQtlvWKlk7g2MWvxN9tIUxij6noy2tj/L6FWGSwyMHuGLmV8EW
         F2rPXQbaUy/2Us/u2+CScBlqnnbOMez+wBFm1dt2qr3vv+rgAmWabEoNVH8tz6JVySBx
         OkMkraGhWKe/ipTNDLXnPSCCfoTRbcV3ZmY1fSn4kGmldHLD6Pz7TsnW2sHlOkKbyk/D
         tBVg==
X-Gm-Message-State: ACrzQf2jMpAybZxr2HRkcjShld+F7CxLcttuFQOJh8kI2BAKHK5bkEud
        l2lmb1D9O9YYtX9twpHJ39LCBHaNMZIRjvx4ukCjfQ==
X-Google-Smtp-Source: AMsMyM5SoibjyxUNWPddsJQiXBCo6gUiccPmwYk5IFGbnZUgk9qascBl19j/lpgoHfB0B+L4U97W0P8BydAkhiuaRog=
X-Received: by 2002:a05:6870:8999:b0:133:15f9:82fd with SMTP id
 f25-20020a056870899900b0013315f982fdmr4951557oaq.276.1665993093812; Mon, 17
 Oct 2022 00:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-6-jagan@amarulasolutions.com> <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
 <CAMty3ZAtuOKWJH6Qo-LiyCWEZW6g1JqRkRxctWiJcUpXaGMbLg@mail.gmail.com> <80ace77a-49c6-9b22-5c59-d0afa9b32153@denx.de>
In-Reply-To: <80ace77a-49c6-9b22-5c59-d0afa9b32153@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 17 Oct 2022 13:21:22 +0530
Message-ID: <CAMty3ZDpez9Ls2gzGcAuM92UO2d2tkNe5FuLGuw0=GTSS-0oeQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] drm: bridge: samsung-dsim: Add atomic_check
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

On Mon, Oct 17, 2022 at 12:53 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/22 05:54, Jagan Teki wrote:
> > On Sun, Oct 16, 2022 at 2:53 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/5/22 17:13, Jagan Teki wrote:
> >>> Look like an explicit fixing up of mode_flags is required for DSIM IP
> >>> present in i.MX8M Mini/Nano SoCs.
> >>>
> >>> At least the LCDIF + DSIM needs active low sync polarities in order
> >>> to correlate the correct sync flags of the surrounding components in
> >>> the chain to make sure the whole pipeline can work properly.
> >>>
> >>> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> >>> Rev. 3, 11/2020 says.
> >>> "13.6.3.5.2 RGB interface
> >>>    Vsync, Hsync, and VDEN are active high signals."
> >>>
> >>> No clear evidence about whether it can be documentation issues or
> >>> something, so added a comment FIXME for this and updated the active low
> >>> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
> >>
> >> [...]
> >>
> >>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> >>> +                                  struct drm_bridge_state *bridge_state,
> >>> +                                  struct drm_crtc_state *crtc_state,
> >>> +                                  struct drm_connector_state *conn_state)
> >>> +{
> >>> +     struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> >>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> >>> +
> >>> +     if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
> >>> +             /**
> >>> +              * FIXME:
> >>> +              * At least LCDIF + DSIM needs active low sync,
> >>> +              * but i.MX 8M Mini Applications Processor Reference Manual,
> >>> +              * Rev. 3, 11/2020 says
> >>> +              *
> >>> +              * 13.6.3.5.2 RGB interface
> >>> +              * Vsync, Hsync, and VDEN are active high signals.
> >>> +              */
> >>> +             adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> >>> +             adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> >>> +     }
> >>
> >> It would be good to explain what exactly is going on here in the
> >> comment, the comment says "Vsync, Hsync, and VDEN are active high
> >> signals." and the code below does exact opposite and sets NxSYNC flags.
> >>
> >> Yes, the MX8MM/MN does need HS/VS/DE active LOW, it is a quirk of that
> >> MXSFB-DSIM glue logic. The MX8MP needs the exact opposite on all three,
> >> active HIGH.
> >
> > This is what exactly is mentioned in the comments.
> >
> > 2nd line mentioned the active low of signals.
> >>> +              * At least LCDIF + DSIM needs active low sync,
> >
> > from 3rd line onwards it mentioned what reference manual is referring
> >
> > Not quite understand what is misleading here.
>
> This part:
> "
> +  * Vsync, Hsync, and VDEN are active high signals.
> +  */
> +  adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> "
>
> Comment claims the signals are active high by quoting datasheet, and
> then sets the exact opposite on next line of code.

The comment stated what is done first and then gave the datasheet
reference. look this sequence seems confusing, I will recheck and
update the best possible comment.

>
> Have a look at this patch, I updated the comment there for MX8MP too:
> [PATCH] drm: bridge: samsung-dsim: Add i.MX8M Plus support

I will check.

Thanks,
Jagan.
