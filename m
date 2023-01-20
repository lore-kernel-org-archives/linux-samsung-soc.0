Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7904EC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 19:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjATTm0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 14:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjATTm0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 14:42:26 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8B67C84B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 11:42:24 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id i185so6809993vsc.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 11:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2smM+yAWTiv5fXgEcxXSH5+gacjV2/xa7Y1VVuSpHVc=;
        b=dnbrvAFHX7LrcoYnwpJ/yzadPtwbcD2GTtvYuQk3deWwHwbho5aK5Kw3a33NE7qF80
         woqxumQwC6rgQ11cWHKeAsQQwNdOAV3oHUMA0cDBumNvLnF9b0r/dK1eghXfGTFO7bhF
         NytFYxYSfaAVBcgHj3nTa1jcFQ0v6bwMl56OYWyESwTakEoK9EUOOpQJAk23/0msE7ov
         NxPGuWwiebeic1yh8fEHZhZYaLBjD88abMUznBmim5riu4Xoy331xl8zqE7ztjHWHM80
         GmYQ9ZeOACOil3SNTuRtds9EM1JVLhB7wNKKS/EA5tQcZIToaavDxcpRIH9qHUR/VC6B
         gEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2smM+yAWTiv5fXgEcxXSH5+gacjV2/xa7Y1VVuSpHVc=;
        b=AU4G4ODPiQcHP+b+C7wgjMJMlep7Q3s5R5QZcrCa+R/63CRCA7eIwxbD2n6fcnJJDd
         rRselfFa6kG+bZLH4B4JNghECgRDyNFuPBFYomRkZR1weELukI6DsS2nZHuj59NHKwj4
         HLVDnOI2zDafzTZHtxkMlZdTUV7cr0QE3rkLMgDDVZBqxSSvbTXDiVRMsrauM+Qu0nUq
         If3cM8Eea2L1ABLVSUf19qH8+Z3bkQGeuosrJWs/GJzQWFL0nr251j4M4a5sL1NzyzrL
         C2gyU0W3FNon+8WlJbFP8RdQlbiZyDbY0BgL+CFbxRNPrcZSekOtChh3CcSNc0dPWXm1
         UVrg==
X-Gm-Message-State: AFqh2kpuqw02Cvl5uw8n03ejWixrtgjCMD+2X9864O6TnkhzTJWRrJqL
        gAFI8tQW4FF7Wa3izBBN/L8ng//MZv/mlbWY6x4gcQ==
X-Google-Smtp-Source: AMrXdXuVv09inmDMzECR3rvJhE7sMfC0Zb6V5CzqpmUDPa/fQN1hNEg6zum3S7L+bKt2Zwp44qqTbZlREFFQPNIUTaQ=
X-Received: by 2002:a67:d312:0:b0:3d4:542:12ad with SMTP id
 a18-20020a67d312000000b003d4054212admr2192444vsj.84.1674243744070; Fri, 20
 Jan 2023 11:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-4-jagan@amarulasolutions.com> <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
 <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
In-Reply-To: <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 20 Jan 2023 19:42:07 +0000
Message-ID: <CAPY8ntAtY45nnx_X6cBafoUBG3Z8kpROFt7kZs7mVC1NBsnAxw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain order
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
        linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan

On Fri, 20 Jan 2023 at 19:10, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Dave,
>
> On Sat, Jan 21, 2023 at 12:26 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jagan
> >
> > Responding due to Marek's comment on the "Add Samsung MIPI DSIM
> > bridge" series, although I know very little about the Exynos
> > specifics, and may well be missing context of what you're trying to
> > achieve.
> >
> > On Mon, 12 Dec 2022 at 18:29, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Restore the proper bridge chain by finding the previous bridge
> > > in the chain instead of passing NULL.
> > >
> > > This establishes a proper bridge chain while attaching downstream
> > > bridges.
> > >
> > > Reviewed-by: Marek Vasut <marex@denx.de>
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v11:
> > > - add bridge.pre_enable_prev_first
> > > Changes for v10:
> > > - collect Marek review tag
> > >
> > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > index ec673223d6b7..9d10a89d28f1 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
> > >  {
> > >         struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > >
> > > -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> > > +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> > > +                                flags);
> >
> > Agreed on this change.
> >
> > >  }
> > >
> > >  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> > > @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> > >
> > >         drm_bridge_add(&dsi->bridge);
> > >
> > > -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> > > +       drm_bridge_attach(encoder, &dsi->bridge,
> > > +                         list_first_entry_or_null(&encoder->bridge_chain,
> > > +                                                  struct drm_bridge,
> > > +                                                  chain_node), 0);
> >
> > What bridge are you expecting between the encoder and this bridge?
> > The encoder is the drm_simple_encoder_init encoder that you've created
> > in exynos_dsi_bind, so separating that from the bridge you're also
> > creating here seems weird.
> >
> > >
> > >         /*
> > >          * This is a temporary solution and should be made by more generic way.
> > > @@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
> > >         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> > >         dsi->bridge.of_node = dev->of_node;
> > >         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> > > +       dsi->bridge.pre_enable_prev_first = true;
> >
> > Setting dsi->bridge.pre_enable_prev_first on what is presumably the
> > DSI host controller seems a little odd.
> > Same question again - what bridge are you expecting to be upstream of
> > the DSI host that needs to be preenabled before it? Whilst it's
> > possible that there's another bridge, I'd have expected that to be the
> > first link from your encoder as they appear to both belong to the same
> > bit of driver.
>
> Let me answer all together here. I can explain a bit about one of the
> pipelines used in Exynos. Exynos DSI DRM drivers have some strict host
> initialization which is not the same as what we used in i.MX8M even
> though it uses the same DSIM IP.
>
> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
>
> Here MIC is the bridge, Exynos DSI is the bridge and the requirement
> is to expect the upstream bridge to pre_enable first from DSI which
> means the MIC.

That makes sense for the pre_enable_prev_first flag.

The drm_bridge_attach(... list_first_entry_or_null) still seems a
little weird. I think you are making the assumption that there is only
ever going to be the zero or one bridge (the MIC) between encoder and
DSI bridge - the DSI bridge is linking itself to the first entry off
the encoder bridge_chain (or NULL to link to the encoder). Is that
reasonable? I've no idea!

I must confess to not having looked at the attaching sequence
recently, and I'm about to head home for the weekend.
I have no real knowledge of how Exynos is working, and am aware that
you're having to rejuggle stuff to try and support i.MX8M and Exynos,
so leave that one up to you.

Cheers
  Dave
