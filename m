Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30636C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Jul 2021 13:20:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15A0460230
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Jul 2021 13:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237344AbhG2NUe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237381AbhG2NUe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 09:20:34 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271A9C0613C1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jul 2021 06:20:30 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so9265209pjh.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jul 2021 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dn16VRGzINjpK5hTkcROYonwyO77GNzKhrw6QPtb+WU=;
        b=UGHYkoDL7+nEZ+Ici1GVaiIpoD7un33lWWCEf4TVNKpJZjvFUFTBaCsYxSYJMq7F7t
         kjEuDYUfGdm2Y6esFw8K58f+EtxqDY5JhVZLQ7fzcMwehxZ/F3219Hp4LfVIgxqlvVUl
         BPRICJBCxma317as9WmiDNoqXmVh6wgIbhnpN4smFb3XFiVF3Def2iBGIsnHGWpMY6xf
         NzTuG6Px+qvjkyin3DpjfFz7pinhGGfhL88FXiVFxz3uo6Bv2AleoBCaTbdqm8SWUL4T
         hDwnFgPcmBMW6URS35QlFCYGwuYjDtVuMcuWY2k65CTNCOt16N46Hcd0YWKwDp23uB7b
         q4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dn16VRGzINjpK5hTkcROYonwyO77GNzKhrw6QPtb+WU=;
        b=qc53wCRr1g53jfgIX8rMuj5qGGqKFGXtGVWy1istDU5tCPvU5sGD4NYRaq9L2SwKwq
         uTdMF1DvxrOJoTPfnSvkQfIPA2GNCO3GKQXpd0bhIDvBt1q/mf8VVzKd/uXqN9bcfiXQ
         yGbYkk08hHcXx5rPXFr1KLXCFrU8g0pHas4opRW/WZLZsTh9JEpSk49i5o80k1QjHhf3
         y7D7QYQChylr/6s6IAomPh3elszkT7KUsZ7XEOsu2lK+Q7C9zI6UXlC2Qj/h03J+iDRU
         xMrFMXB+X8TeS+L6+tRpA7LioN5EUablkWeX6H6KztC8trIkikscJZ/b8B5l9ePJDPBH
         iLjA==
X-Gm-Message-State: AOAM531X74DEL6Rn3Ahx4KHNVVnMIvqiQsdE+1BPmflhNqQXf2D0iUmi
        3rrxdhw9QvMgM9iloalrWrNLUZsGZ9Ud0bQC49jRnw==
X-Google-Smtp-Source: ABdhPJwZGMBeDDIs8OW6egcQktP4OuNjLmCnf0s9q2ER3N5wFGSw0h4xjwRmt/xhkYeiRPsvGus7PV8t11L557Z5dnY=
X-Received: by 2002:a63:494f:: with SMTP id y15mr3798897pgk.185.1627564829264;
 Thu, 29 Jul 2021 06:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com> <20210704090230.26489-6-jagan@amarulasolutions.com>
In-Reply-To: <20210704090230.26489-6-jagan@amarulasolutions.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 29 Jul 2021 15:20:17 +0200
Message-ID: <CAG3jFytHb=iOc6CHy47iGwvxuSg1UMqnpE7oFZL9tfcPUB22eA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/17] drm/exynos: dsi: Get the mode from bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hey Jagan,

On Sun, 4 Jul 2021 at 11:04, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Now the exynos dsi driver is fully aware of bridge
> handling, so get the display mode from bridge, mode_set
> API instead of legacy encoder crtc.
>
> This makes bridge usage more efficient instead of relying
> on encoder stack.
>
> Add mode_set in drm_bridge_funcs.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d828be07c325..99a1b8c22313 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -275,6 +275,7 @@ struct exynos_dsi {
>         u32 format;
>
>         int state;
> +       struct drm_display_mode mode;
>         struct drm_property *brightness;
>         struct completion completed;
>
> @@ -881,7 +882,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>
>  static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
>  {
> -       struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
> +       struct drm_display_mode *m = &dsi->mode;
>         unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
>         u32 reg;
>
> @@ -1411,6 +1412,15 @@ static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(dsi->dev);
>  }
>
> +static void exynos_dsi_bridge_mode_set(struct drm_bridge *bridge,
> +                                      const struct drm_display_mode *mode,
> +                                      const struct drm_display_mode *adjusted_mode)
> +{
> +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +       drm_mode_copy(&dsi->mode, adjusted_mode);
> +}
> +
>  static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
>                                       struct device_node *node)
>  {
> @@ -1451,6 +1461,7 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
>         .enable = exynos_dsi_bridge_enable,
>         .disable = exynos_dsi_bridge_disable,
> +       .mode_set = exynos_dsi_bridge_mode_set,

As far as I understand it, .enable(), .disable() &.mode_set() are
deprecated[1] and should be replaced by atomic_enable(),
atomic_disable() & atomic_enable() respectively.

[1] https://lore.kernel.org/dri-devel/20210722062246.2512666-8-sam@ravnborg.org/

>         .attach = exynos_dsi_bridge_attach,
>  };
>
> --
> 2.25.1
>
