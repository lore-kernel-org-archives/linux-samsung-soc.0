Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107A6ECAAD4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 19:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiH2TmT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 15:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiH2TmS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 15:42:18 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FB47332E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 12:42:13 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u9so17815815ejy.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6cTy6keoa6b646vo8Js7s0CIFmnj1Q2o4aqvygA4K3o=;
        b=DFxjElR5msx7cZgIJRZPd43/YEwRZgLSkWluSuIlAaCJTw3xRblAbfxzDvQ6842Ix7
         lJM5BC5VPvtKp9PDOjeXt1Vnmzjfx095NvtvDOLSh1q2LsieFFZt2W6oFuEFqk/MDV1P
         9s0c1LvOjVKHDYYmeTs18q9039vwHM10Xbmk2o/kXvKcP2Y7spxlh9mSz7JgxBqRS1m/
         mutRWNbZ7eQO6MGyGmXHBTVYPnJ9YHLX6xtlNC7geBZU8Kw2NAHci3irYScaPsiQpzjN
         Lrh82iQHzutGhmJaFb/BuuC7s54OFTIpiFPEVac8/EJghj/RPSjxFHLjcf3KvHYLs5Yl
         /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6cTy6keoa6b646vo8Js7s0CIFmnj1Q2o4aqvygA4K3o=;
        b=aS//FGz6KSDrsbiiQQsNuiW82cKkc3XGhVJo4UqCcpEa1wvbb7xRtUM1Nlhj16Ywg+
         wNNsJthjA++5bn/DjXzP7qzVXHpI/V5e+ehtMpcBmkYUMPgA8F4fY9bEWZ3W4dM7943d
         zGL0ZWS/1+NIL66lY6gW6LNrhYevaTl1MPJuoRVDi2m9a3JWXfiMCIthkBKKFx19hTd4
         ubJxOofBwc1auzQgY11phh3u+AZ+cfvaWDZ6w+gosKnp8xSyPQ2FFN0venR8H/vnL9G2
         g7dz3XAncaJ4l+in3aOtWqIb65KVw8VAKvUAozhVVQTcRNdcv7STGMtavkg2Z0OsQke2
         41oA==
X-Gm-Message-State: ACgBeo1m7U5IAgbqc3NpJ5iscTyy+csEq4MxtmstbhhzkTBzht1/EgP7
        9uzIn+GBc0ETj6we0dBH59CIpIlYzMGVcDtwLuk=
X-Google-Smtp-Source: AA6agR7uH/lREQZQwl9H3i0GUO9N6GrUUJHUai+M6A9pycUtOdBDMUR87TRVuoIcQUVD/Y/8XtDbHmmiKYLJtrvlFIg=
X-Received: by 2002:a17:907:87b0:b0:731:3dfd:bc8d with SMTP id
 qv48-20020a17090787b000b007313dfdbc8dmr14315550ejc.607.1661802131774; Mon, 29
 Aug 2022 12:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com> <20220829184031.1863663-8-jagan@amarulasolutions.com>
In-Reply-To: <20220829184031.1863663-8-jagan@amarulasolutions.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 29 Aug 2022 14:42:00 -0500
Message-ID: <CAHCN7xKxS6oaX8kGYv_bhWfCFUEMBykN87BwXMPkcCg=OwKXrw@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
To:     Jagan Teki <jagan@amarulasolutions.com>
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Aug 29, 2022 at 1:41 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
> with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
> range from BIT[18-13] and the upstream driver is using the same offset.
>
> However, offset 13 is not working on i.MX8M Mini platforms but downstream
> NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.

From the line you highlighted in the link, the downstream NXP ones
shows 13 if I'm reading it correctly.

#define PLLCTRL_SET_P(x) REG_PUT(x, 18, 13)

From what I can tell the PMS calculation here needs to be updated for
the Mini because the ranges of the FCO calculator are different.  Took
your series and tweaked it a bit [2] which changes a few settings, and
the PMS calculator appears to more closely match the values I get from
the NXP one.  I think it could be further tweaked because p min and
p_max also have changed.

>
> Not sure about whether it is reference manual documentation or something
> else but this patch trusts the downstream code and fixes the PLL_P offset.
>
> [1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211
>

[2] -https://github.com/aford173/linux/commit/a5fa184160ec9ea45a7546eaa0d8b8fc760cf3d9

> v4, v3, v2:
> * none
>
> v1:
> * updated commit message
> * add downstream driver link
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++++--
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b6883a6d4681..b6d17c0c9e58 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -168,7 +168,7 @@
>  /* DSIM_PLLCTRL */
>  #define DSIM_FREQ_BAND(x)              ((x) << 24)
>  #define DSIM_PLL_EN                    (1 << 23)
> -#define DSIM_PLL_P(x)                  ((x) << 13)
> +#define DSIM_PLL_P(x, offset)          ((x) << (offset))
>  #define DSIM_PLL_M(x)                  ((x) << 4)
>  #define DSIM_PLL_S(x)                  ((x) << 1)
>
> @@ -368,6 +368,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
>         .max_freq = 1000,
>         .wait_for_reset = 1,
>         .num_bits_resol = 11,
> +       .pll_p_offset = 13,
>         .reg_values = reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -381,6 +382,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
>         .max_freq = 1000,
>         .wait_for_reset = 1,
>         .num_bits_resol = 11,
> +       .pll_p_offset = 13,
>         .reg_values = reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
>         .max_freq = 1000,
>         .wait_for_reset = 1,
>         .num_bits_resol = 11,
> +       .pll_p_offset = 13,
>         .reg_values = reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -404,6 +407,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
>         .max_freq = 1500,
>         .wait_for_reset = 0,
>         .num_bits_resol = 12,
> +       .pll_p_offset = 13,
>         .reg_values = exynos5433_reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -416,6 +420,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
>         .max_freq = 1500,
>         .wait_for_reset = 1,
>         .num_bits_resol = 12,
> +       .pll_p_offset = 13,
>         .reg_values = exynos5422_reg_values,
>         .quirks = DSIM_QUIRK_PLAT_DATA,
>  };
> @@ -563,7 +568,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>         writel(driver_data->reg_values[PLL_TIMER],
>                         dsi->reg_base + driver_data->plltmr_reg);
>
> -       reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
> +       reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
> +             DSIM_PLL_M(m) | DSIM_PLL_S(s);
>
>         if (driver_data->has_freqband) {
>                 static const unsigned long freq_bands[] = {
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index e15fbfd49efe..95d3f89aec4f 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -47,6 +47,7 @@ struct samsung_dsim_driver_data {
>         unsigned int max_freq;
>         unsigned int wait_for_reset;
>         unsigned int num_bits_resol;
> +       unsigned int pll_p_offset;
>         const unsigned int *reg_values;
>         enum samsung_dsim_quirks quirks;
>  };
> --
> 2.25.1
>
