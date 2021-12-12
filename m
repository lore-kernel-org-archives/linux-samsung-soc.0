Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3120EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Dec 2021 15:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhLLPPd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Dec 2021 10:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbhLLPPd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Dec 2021 10:15:33 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3236BC061751
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Dec 2021 07:15:33 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso12930402pji.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Dec 2021 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w6ToLCPSZNNSJ6sxtZCYwm1w2ixeus9UD8JbB3hgVkI=;
        b=hPQdK5siVvXvTCHX+1+SJ3lP206tjJmmTM9b8vLcH0Ot/WV+oFYVZtUA55Sir246Ac
         7L8DHVksYdjnDy9sHr+HJCmQa6+gC+XXMV91G/eHG/DeEmoZ8vV9N6TKwtRufub0fTd0
         SW5mPRNDTJSPI5Twd5BXkap7oKrqVjKP49M7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w6ToLCPSZNNSJ6sxtZCYwm1w2ixeus9UD8JbB3hgVkI=;
        b=L/90LytkWoE/79ywKgSZustL/dWsE3NnQ665njctHG76YtFcT1uVOvUBk18nQPkJk/
         9SbP9aYHNtM+R8jjaW4QiU+QPO/3IuqQYRkFhe60X7F/iirD/ZMsw/W8deF8hNNzDb2+
         Q5Vsyf7Kvnu8kPnC21g3hiWojaWqE72cf6ZhhEtYKD631M40nSwCF78jqVNpt07BmK1J
         GzpqC0+14X/MbaXdoEfzwexkhR/sfJup7akjvN0QanCWX8kGpHBlXhsEOR/6pUbkWYss
         AB0Rd1/J89MDnj83DUgWZSzeSH3O0mC1a97j1BCNKrP9Xb9SisPN/JMRb7JiYsKvwVdk
         cGdA==
X-Gm-Message-State: AOAM530rDkADVv9+Jl9vG7TzVtc/T3DSvuOX/1W4haPjI1JP25/afiWm
        T5z9MbStvkWSLIQu64KmYe6JJd8oGSrwP2TbFYlINg==
X-Google-Smtp-Source: ABdhPJwKHuY38ECZkLkV8C9YVLgdc0eixk15OYwIajuL2Bh2nfLN0cWycELO7Y7PUrkKmbSJKcIOMmyYjTF+oVnae7U=
X-Received: by 2002:a17:902:8302:b0:143:6e5f:a4a0 with SMTP id
 bd2-20020a170902830200b001436e5fa4a0mr89514529plb.20.1639322132513; Sun, 12
 Dec 2021 07:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20211212150656.375538-1-michael@amarulasolutions.com> <20211212150656.375538-6-michael@amarulasolutions.com>
In-Reply-To: <20211212150656.375538-6-michael@amarulasolutions.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Sun, 12 Dec 2021 16:15:21 +0100
Message-ID: <CAOf5uwkjTmBSE2yS72xWGb2Nqe_zevMqWestLf9NqfT9hsN5hQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] phy: exynos-mipi-video: Add support for NXP i.MX8MM
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     tharvey@gateworks.com, Marek Vasut <marex@denx.de>,
        Abel Vesa <abel.vesa@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        NXP Linux Team <Linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

Went out by mistake. Sorry for the noise

Michael

On Sun, Dec 12, 2021 at 4:07 PM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> From: Marek Vasut <marex@denx.de>
>
> This patch adds support for MIPI DPHY found in NXP i.MX8MM.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt   |  7 ++++---
>  drivers/phy/samsung/Kconfig                   |  6 +++---
>  drivers/phy/samsung/phy-exynos-mipi-video.c   | 21 +++++++++++++++++++
>  3 files changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Docu=
mentation/devicetree/bindings/phy/samsung-phy.txt
> index 8f51aee91101..6071ce6f036c 100644
> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
> @@ -1,14 +1,15 @@
> -Samsung S5P/Exynos SoC series MIPI CSIS/DSIM DPHY
> --------------------------------------------------
> +Samsung S5P/Exynos and NXP i.MX8MM SoC series MIPI CSIS/DSIM DPHY
> +-----------------------------------------------------------------
>
>  Required properties:
>  - compatible : should be one of the listed compatibles:
>         - "samsung,s5pv210-mipi-video-phy"
>         - "samsung,exynos5420-mipi-video-phy"
>         - "samsung,exynos5433-mipi-video-phy"
> +       - "fsl,imx8mm-mipi-video-phy"
>  - #phy-cells : from the generic phy bindings, must be 1;
>
> -In case of s5pv210 and exynos5420 compatible PHYs:
> +In case of s5pv210, exynos5420, imx8mm compatible PHYs:
>  - syscon - phandle to the PMU system controller
>
>  In case of exynos5433 compatible PHY:
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 3ccaabf2850a..8d4f84879180 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -12,14 +12,14 @@ config PHY_EXYNOS_DP_VIDEO
>           Support for Display Port PHY found on Samsung Exynos SoCs.
>
>  config PHY_EXYNOS_MIPI_VIDEO
> -       tristate "S5P/Exynos SoC series MIPI CSI-2/DSI PHY driver"
> +       tristate "S5P/Exynos/i.MX8MM SoC series MIPI CSI-2/DSI PHY driver=
"
>         depends on HAS_IOMEM
> -       depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> +       depends on ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MXC || COMPILE_TES=
T
>         select GENERIC_PHY
>         default y if ARCH_S5PV210 || ARCH_EXYNOS
>         help
>           Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
> -         and Exynos SoCs.
> +         and Exynos SoCs, and on NXP i.MX8MM SoCs.
>
>  config PHY_EXYNOS_PCIE
>         bool "Exynos PCIe PHY driver"
> diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/sa=
msung/phy-exynos-mipi-video.c
> index c1df1ef3ee3c..b735b8089cd7 100644
> --- a/drivers/phy/samsung/phy-exynos-mipi-video.c
> +++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
> @@ -214,6 +214,24 @@ static const struct mipi_phy_device_desc exynos5433_=
mipi_phy =3D {
>         },
>  };
>
> +static const struct mipi_phy_device_desc imx8mm_mipi_phy =3D {
> +       .num_regmaps =3D 1,
> +       .regmap_names =3D {"syscon"},
> +       .num_phys =3D 1,
> +       .phys =3D {
> +               {
> +                       /* EXYNOS_MIPI_PHY_ID_DSIM0 */
> +                       .coupled_phy_id =3D EXYNOS_MIPI_PHY_ID_NONE,
> +                       .enable_val =3D BIT(17),
> +                       .enable_reg =3D 8,
> +                       .enable_map =3D EXYNOS_MIPI_REGMAP_PMU,
> +                       .resetn_val =3D BIT(5),
> +                       .resetn_reg =3D 0,
> +                       .resetn_map =3D EXYNOS_MIPI_REGMAP_PMU,
> +               },
> +       },
> +};
> +
>  struct exynos_mipi_video_phy {
>         struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
>         int num_phys;
> @@ -349,6 +367,9 @@ static const struct of_device_id exynos_mipi_video_ph=
y_of_match[] =3D {
>         }, {
>                 .compatible =3D "samsung,exynos5433-mipi-video-phy",
>                 .data =3D &exynos5433_mipi_phy,
> +       }, {
> +               .compatible =3D "fsl,imx8mm-mipi-video-phy",
> +               .data =3D &imx8mm_mipi_phy,
>         },
>         { /* sentinel */ },
>  };
> --
> 2.25.1
>
