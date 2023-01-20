Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB8C05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 19:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjATTKG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 14:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjATTKF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 14:10:05 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302AADBCB
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 11:10:04 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5018be4ae8eso23299067b3.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 11:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIuta0hz/9qzxxPv21YqtA6V0A5hmBJomzpWwkOtGdk=;
        b=f/UNfMLk+Gv/qc79D7S+rKxL8GRO/Ls9nkh3w5avbFmQUy+CNXEf4OILP7Bkv5DsDY
         iBWSn3XhIbEzwEpD+RCYP6cSo/Frp9qjcX2OchTnHtg0fkX/Kv18eo6EMuO+m3PDl0ZL
         /GGaG60xmFOmDY2x48dXW6J04FfPwOJZcC6Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIuta0hz/9qzxxPv21YqtA6V0A5hmBJomzpWwkOtGdk=;
        b=P0pPJrv6H/Xi+DPyPu7VueuPzQgP0YrlQms0iI8wWKvCqkB2vKV/sh4kYJATyvZ+gp
         zfkdsnKnSLUMDczMyTxZ/ZK9IvDpUOr927b0W+NS3pyiwHKpfyAFE/IpQjx0VINA+b8a
         zl4KmuQR0dknznfLpwnmgPJSbHoswqJ5vECoimH7oJnVODmiPl9c5/eqNNcAyIUuze63
         kUInHF9+6waWQBC1TncHvkEygs+plvenf9ZtMhj0NHwQcDFSuRzf+vCExBj2ZvZnwGhK
         ljvRWZqmJqHrRmSAcj03UCYZILiqWiHp3hdriqqYB6TOMN1Z8HSGrZ6aOqnekwZu35H/
         l+uw==
X-Gm-Message-State: AFqh2koqKmmvevy9doaizRFYz1tDm0IFJ64aLdjgdPRFw9HgPu+kIbdg
        Bvk7TdRpOrUXCXcVx9qI6n9LEW32o+HDIhb5ZqI0+Q==
X-Google-Smtp-Source: AMrXdXsZ/asUObaZDuqOUxbcs01dzSNhv5vM2VBeMcaV/D7L1Uw4XvYwWdwoKdM0elPjiGwV0ASOUQg2f8DmFofw29A=
X-Received: by 2002:a05:690c:852:b0:4d7:eb11:6bf7 with SMTP id
 bz18-20020a05690c085200b004d7eb116bf7mr1872714ywb.235.1674241803361; Fri, 20
 Jan 2023 11:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-4-jagan@amarulasolutions.com> <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
In-Reply-To: <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sat, 21 Jan 2023 00:39:51 +0530
Message-ID: <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain order
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
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

Hi Dave,

On Sat, Jan 21, 2023 at 12:26 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan
>
> Responding due to Marek's comment on the "Add Samsung MIPI DSIM
> bridge" series, although I know very little about the Exynos
> specifics, and may well be missing context of what you're trying to
> achieve.
>
> On Mon, 12 Dec 2022 at 18:29, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Restore the proper bridge chain by finding the previous bridge
> > in the chain instead of passing NULL.
> >
> > This establishes a proper bridge chain while attaching downstream
> > bridges.
> >
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v11:
> > - add bridge.pre_enable_prev_first
> > Changes for v10:
> > - collect Marek review tag
> >
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index ec673223d6b7..9d10a89d28f1 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
> >  {
> >         struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> >
> > -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> > +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> > +                                flags);
>
> Agreed on this change.
>
> >  }
> >
> >  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> > @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >
> >         drm_bridge_add(&dsi->bridge);
> >
> > -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> > +       drm_bridge_attach(encoder, &dsi->bridge,
> > +                         list_first_entry_or_null(&encoder->bridge_chain,
> > +                                                  struct drm_bridge,
> > +                                                  chain_node), 0);
>
> What bridge are you expecting between the encoder and this bridge?
> The encoder is the drm_simple_encoder_init encoder that you've created
> in exynos_dsi_bind, so separating that from the bridge you're also
> creating here seems weird.
>
> >
> >         /*
> >          * This is a temporary solution and should be made by more generic way.
> > @@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
> >         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> >         dsi->bridge.of_node = dev->of_node;
> >         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> > +       dsi->bridge.pre_enable_prev_first = true;
>
> Setting dsi->bridge.pre_enable_prev_first on what is presumably the
> DSI host controller seems a little odd.
> Same question again - what bridge are you expecting to be upstream of
> the DSI host that needs to be preenabled before it? Whilst it's
> possible that there's another bridge, I'd have expected that to be the
> first link from your encoder as they appear to both belong to the same
> bit of driver.

Let me answer all together here. I can explain a bit about one of the
pipelines used in Exynos. Exynos DSI DRM drivers have some strict host
initialization which is not the same as what we used in i.MX8M even
though it uses the same DSIM IP.

Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel

Here MIC is the bridge, Exynos DSI is the bridge and the requirement
is to expect the upstream bridge to pre_enable first from DSI which
means the MIC.

Jagan.
