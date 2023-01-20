Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADAFC05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 18:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjATS4u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 13:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjATS4t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 13:56:49 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32045142C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 10:56:47 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id c85so4662338pfc.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nIwPhiEFv+N+HnO/9vbkWfRKpLaygDm0DMDT40PA8a4=;
        b=L91Kfv5WjiGm9Cdj7yNCzGFUpOockh0uE0TGIkEa5oVdF9YcgFXdjzP6yDuJ5Y5IyO
         V9fn3EYMoxW2IBcRxfN99mauDEwFy2CoO4dOcXm72EV0I2gHMvQWqz35PwdsA3DWSfrN
         0aHh4mac2GdYwX1nLdXukWlfCB9qHGh7iGZiP04iKQAhjvtp8Lypz59ffsyN31Pg3BiK
         Ght5E4QU5kWdP0bMJJ2FCMYB5QOR8qm7gCo6uKeI08KqSTbZ0sXpw2OixOkercFPjnhs
         kLQhFOEr1+2ByRQRjxh7uWeQ+0WDldbm8sPCEAy2BbC2r1XDt9jKfPNxmm4NJQwrWmgz
         DxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIwPhiEFv+N+HnO/9vbkWfRKpLaygDm0DMDT40PA8a4=;
        b=8FYCuJWSHdyxcZUGuTBjvRtOBEK+A9Av2F2XlojoxfFg1A9E0MzcUF92FkvHq8l//D
         ufllMlZm+c+yorhbcebF5QmiYLYUsGPRuMuW9ry1qCAsDdktSwD8UNHGj8j0rZaNJ7AC
         XphZYAPrOYaMEmJ/Ga6pne2dmNDdaUF5GBV7pnPGaa1/1J9aB7OISOIuqxMt1iiHYnrT
         9zTQaejTJwyOydBhrqxivTflRB6U5GjBdcTSpH/A1cvZta7s/60NVAcTNDE3ZLdNAQO3
         JB+jBuhc9mhrNxOLrxGGn5OKwr6+StYuGdRInSXXpEdKUpA9Ts07Xkgv4QVcrjUj2h6r
         7D+Q==
X-Gm-Message-State: AFqh2kqLfmAwfOVgRGanodE3y5M7XSK0pyS0+M4G2okj7wQAvxcSNHtx
        A5ojQbAxz1DTAbxt17q6MFGbElCYAvMRG9EarzDpDw==
X-Google-Smtp-Source: AMrXdXtEwACEaIBAtmPEu0Lt6Ae6Q3ZcY7u0A74//4jzAfe2sdmPcntzHMI3MG+uNbCEReKR/T6M+CUisATC8ZnHa9A=
X-Received: by 2002:aa7:8c0f:0:b0:577:1b6:ee7b with SMTP id
 c15-20020aa78c0f000000b0057701b6ee7bmr1729871pfd.5.1674241007360; Fri, 20 Jan
 2023 10:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com> <20221212182923.29155-4-jagan@amarulasolutions.com>
In-Reply-To: <20221212182923.29155-4-jagan@amarulasolutions.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 20 Jan 2023 18:56:29 +0000
Message-ID: <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
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

Responding due to Marek's comment on the "Add Samsung MIPI DSIM
bridge" series, although I know very little about the Exynos
specifics, and may well be missing context of what you're trying to
achieve.

On Mon, 12 Dec 2022 at 18:29, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Restore the proper bridge chain by finding the previous bridge
> in the chain instead of passing NULL.
>
> This establishes a proper bridge chain while attaching downstream
> bridges.
>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v11:
> - add bridge.pre_enable_prev_first
> Changes for v10:
> - collect Marek review tag
>
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index ec673223d6b7..9d10a89d28f1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
>  {
>         struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>
> -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> +                                flags);

Agreed on this change.

>  }
>
>  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>
>         drm_bridge_add(&dsi->bridge);
>
> -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> +       drm_bridge_attach(encoder, &dsi->bridge,
> +                         list_first_entry_or_null(&encoder->bridge_chain,
> +                                                  struct drm_bridge,
> +                                                  chain_node), 0);

What bridge are you expecting between the encoder and this bridge?
The encoder is the drm_simple_encoder_init encoder that you've created
in exynos_dsi_bind, so separating that from the bridge you're also
creating here seems weird.

>
>         /*
>          * This is a temporary solution and should be made by more generic way.
> @@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
>         dsi->bridge.of_node = dev->of_node;
>         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +       dsi->bridge.pre_enable_prev_first = true;

Setting dsi->bridge.pre_enable_prev_first on what is presumably the
DSI host controller seems a little odd.
Same question again - what bridge are you expecting to be upstream of
the DSI host that needs to be preenabled before it? Whilst it's
possible that there's another bridge, I'd have expected that to be the
first link from your encoder as they appear to both belong to the same
bit of driver.

  Dave

>         ret = component_add(dev, &exynos_dsi_component_ops);
>         if (ret)
> --
> 2.25.1
>
