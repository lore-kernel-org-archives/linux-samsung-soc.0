Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203BFC74A44
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 11 Mar 2023 23:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjCKXkI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 11 Mar 2023 18:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCKXkA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 18:40:00 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29F2360A6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Mar 2023 15:39:58 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so8377432pjg.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Mar 2023 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678577998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ho5/1m/vfe0flKCSngkWFSeYuqEdK2ieB2yK5kPv+pw=;
        b=cwRQVZSQ/4wecTJvS8ZZUrZhfvAQ31HdqDDffDV3xNYoxOPvQefzes4L3s600zp+kB
         88Y8Hn0AtLLcKKbqwqsWsQUUsCwyNv5YI/760jAsgkiLBbXMiGMczRX4LYNeKlfoPZ3H
         xFD0wNFKJ014F5cUaJDxvBMuBXqfr2jitgkRk0EpYPt18JN7YahkfrKfIXDCoHaR+u4S
         x2v/hw6bgyUSyf1B6WrXzan+eVM6VvBnEjHSRRbBm/QPKbxUI0zR1ylZgvolnesvjOT2
         oBYVpzBpCSlJDv4iquoIllWZS1ByhnNwN/dkyW3GiU4R1OjMbUZqfDytVuRqsH15rNfg
         ON9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678577998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ho5/1m/vfe0flKCSngkWFSeYuqEdK2ieB2yK5kPv+pw=;
        b=XmbyeJU0oFX2gBNJ2txbB6DPBl426ZQ4PJAF6zWHY1dKYPF39T7zhyD9jx7mS+WBs/
         KdIF4whDyLOQpRlmkvDy/5dnVRfJ3cCeS7vbPOYjhIHGs9j0hra39nq6M32JpZFNAje5
         vjKjk+zd45dMhS+KF3g+GtgDXcv8cYEb7LKqgE8hqdkphtmjKhHggtFsUrfKU4hi7PVH
         IEFxMM6NyDfJogypnL/RXtQPJmAkWddcXvGyYRdQX4KcGqmfGEPPoAVV4f3nWwV9ay0r
         JeEYbSMN+lh9taFwvZuACV1QHDbjnj9UnwiyNEZqgJYsS450Ypz9N/Buw6n0JALu5/LV
         c3Lw==
X-Gm-Message-State: AO0yUKXlAviikmxnqPzl9tAO1VNOHTJnwAp4xJM/YGHnBFc8K2uvVy4b
        mFFGhjyK9+DEpVVmmM4CtX7DaIwPtePB58HwIm1ud4upxr8=
X-Google-Smtp-Source: AK7set+0tYvWlngCvR5oSgNRhI285VhyyUsM2kWX+W3ZlR/f/7rRbQ13n4ilHvxGDtKRXO0fZDC5sTrV04KRn9oodpw=
X-Received: by 2002:a17:903:710:b0:19f:30be:e9f6 with SMTP id
 kk16-20020a170903071000b0019f30bee9f6mr644472plb.6.1678577997996; Sat, 11 Mar
 2023 15:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20230308163953.28506-1-jagan@amarulasolutions.com> <20230308163953.28506-15-jagan@amarulasolutions.com>
In-Reply-To: <20230308163953.28506-15-jagan@amarulasolutions.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 11 Mar 2023 17:39:46 -0600
Message-ID: <CAHCN7x+Tox5LcSa-vZNEZ2Ycem6habMT_4q5WaQxpUTeb7XxWg@mail.gmail.com>
Subject: Re: [PATCH v16 14/16] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <mripard@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Robert Foss <robert.foss@linaro.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Mar 8, 2023 at 10:41=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.
>
> Add compatible and associated driver_data for it.
>
I have a few updates that I want to push once this series has been
accepted to support non-burst mode, fine-tune the PMS clock, and a few
other things.  I have the DSI working through a DSI to HDMI bridge
along with audio in case anyone is interested.

I have my repo here which is based on Jagan's V16 branch:
https://github.com/aford173/linux/tree/imx8mm-dsi-v16-beacon


For the series:

Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon


> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v16, v15, v13:
> - none
> Changes for v12:
> - collect RB from Marek
> Changes for v11:
> - collect RB from Frieder
> - collect ACK from Robert
> Changes for v10, v9:
> - none
> Changed for v8:
> - fix and update the comment
> Changes for v7, v6:
> - none
> Changes for v3:
> - enable DSIM_QUIRK_FIXUP_SYNC_POL quirk
> Changes for v5:
> - [mszyprow] rebased and adjusted to the new driver initialization
> - drop quirk
> Changes for v4:
> - none
> Changes for v3:
> - enable DSIM_QUIRK_FIXUP_SYNC_POL quirk
> Changes for v2:
> - collect Laurent r-b
> Changes for v1:
> - none
>
>  drivers/gpu/drm/bridge/samsung-dsim.c | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f9a5e69a0fcd..f3bd06489a39 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -376,6 +376,24 @@ static const unsigned int exynos5433_reg_values[] =
=3D {
>         [PHYTIMING_HS_TRAIL] =3D DSIM_PHYTIMING2_HS_TRAIL(0x0c),
>  };
>
> +static const unsigned int imx8mm_dsim_reg_values[] =3D {
> +       [RESET_TYPE] =3D DSIM_SWRST,
> +       [PLL_TIMER] =3D 500,
> +       [STOP_STATE_CNT] =3D 0xf,
> +       [PHYCTRL_ULPS_EXIT] =3D 0,
> +       [PHYCTRL_VREG_LP] =3D 0,
> +       [PHYCTRL_SLEW_UP] =3D 0,
> +       [PHYTIMING_LPX] =3D DSIM_PHYTIMING_LPX(0x06),
> +       [PHYTIMING_HS_EXIT] =3D DSIM_PHYTIMING_HS_EXIT(0x0b),
> +       [PHYTIMING_CLK_PREPARE] =3D DSIM_PHYTIMING1_CLK_PREPARE(0x07),
> +       [PHYTIMING_CLK_ZERO] =3D DSIM_PHYTIMING1_CLK_ZERO(0x26),
> +       [PHYTIMING_CLK_POST] =3D DSIM_PHYTIMING1_CLK_POST(0x0d),
> +       [PHYTIMING_CLK_TRAIL] =3D DSIM_PHYTIMING1_CLK_TRAIL(0x08),
> +       [PHYTIMING_HS_PREPARE] =3D DSIM_PHYTIMING2_HS_PREPARE(0x08),
> +       [PHYTIMING_HS_ZERO] =3D DSIM_PHYTIMING2_HS_ZERO(0x0d),
> +       [PHYTIMING_HS_TRAIL] =3D DSIM_PHYTIMING2_HS_TRAIL(0x0b),
> +};
> +
>  static const struct samsung_dsim_driver_data exynos3_dsi_driver_data =3D=
 {
>         .reg_ofs =3D exynos_reg_ofs,
>         .plltmr_reg =3D 0x50,
> @@ -437,6 +455,22 @@ static const struct samsung_dsim_driver_data exynos5=
422_dsi_driver_data =3D {
>         .reg_values =3D exynos5422_reg_values,
>  };
>
> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data =3D =
{
> +       .reg_ofs =3D exynos5433_reg_ofs,
> +       .plltmr_reg =3D 0xa0,
> +       .has_clklane_stop =3D 1,
> +       .num_clks =3D 2,
> +       .max_freq =3D 2100,
> +       .wait_for_reset =3D 0,
> +       .num_bits_resol =3D 12,
> +       /*
> +        * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/N=
ano/Plus
> +        * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
> +        */
> +       .pll_p_offset =3D 14,
> +       .reg_values =3D imx8mm_dsim_reg_values,
> +};
> +
>  static const struct samsung_dsim_driver_data *
>  samsung_dsim_types[DSIM_TYPE_COUNT] =3D {
>         [DSIM_TYPE_EXYNOS3250] =3D &exynos3_dsi_driver_data,
> @@ -444,6 +478,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] =3D {
>         [DSIM_TYPE_EXYNOS5410] =3D &exynos5_dsi_driver_data,
>         [DSIM_TYPE_EXYNOS5422] =3D &exynos5422_dsi_driver_data,
>         [DSIM_TYPE_EXYNOS5433] =3D &exynos5433_dsi_driver_data,
> +       [DSIM_TYPE_IMX8MM] =3D &imx8mm_dsi_driver_data,
>  };
>
>  static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
> @@ -1877,7 +1912,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
>
> +static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata =3D=
 {
> +       .hw_type =3D DSIM_TYPE_IMX8MM,
> +       .host_ops =3D &generic_dsim_host_ops,
> +};
> +
>  static const struct of_device_id samsung_dsim_of_match[] =3D {
> +       {
> +               .compatible =3D "fsl,imx8mm-mipi-dsim",
> +               .data =3D &samsung_dsim_imx8mm_pdata,
> +       },
>         { /* sentinel. */ }
>  };
>  MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
> --
> 2.25.1
>
