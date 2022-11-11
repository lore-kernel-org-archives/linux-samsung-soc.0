Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D5DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 00:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiKKAtr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 19:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKKAtq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 19:49:46 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724772D1CF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 16:49:45 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id d3so914924uan.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 16:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4aw+UaNQAgOK1+qXIGrMeeF8yEOKVjEysHFmiav4A0=;
        b=SVxUSRXtPbC/FuRN7RzDaoM7NRKGVc/1Cpckh3BF6YDY/7xcDVEazwFUVM+8P+ZFAf
         /EskH/xlI+NhLRpmmriV2CeRoulGHu0LWtAzaRkcaMzNl9jQvuenFAZrJFEzdwVZeDVQ
         e2XNkQdfszPdJgHriTGKV5Vdd7j99qM5cby58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4aw+UaNQAgOK1+qXIGrMeeF8yEOKVjEysHFmiav4A0=;
        b=5tEXRyyPiicZ4Anl4OszBnbfE+yB6iwqrnOilMoY5Hv9oDLB8XCcNUCQ6+bnXDdJlH
         mJ7yZkfjckeTFF3Wr5+62oMExaEqz+lkv4l8EjvbTYi1ug6BCmeOyODUMRmsQB1gt4ro
         8tEj9zQp4X59qZ9gk4XtYSEsFXjou2yW2DL5so4KCpfIBe8MhYXJur9DZT/1Ls6AitSo
         gXQktMvTorooXsluuPi1PWgPN3RVMdKjMaQde7ckI1UTWTtAddQbm9dve/G5u7n2AfyG
         YOx+GvsAKCGpHgcbQz5F3LQUnNod0whuahYJI/wc6q0of2syWNF8sSyQrFWVjEn8Jsb5
         irpQ==
X-Gm-Message-State: ACrzQf0SWdDvTXXgeU2+rBfBpAagNDRoVeqnTLLD54KpRYlbu/qmmhnW
        iKZct0l96+S1Gf1V7XgpmrARebJ5ojWH8yKpedq+vA==
X-Google-Smtp-Source: AMsMyM4SjnSFJk5YLcoD0XGiysmnVs1xUdmx2A+ffh0o+8ILjg2lbpcc+shH8KvHipgoJlQ33t6hZtZVujSfDv1ow5M=
X-Received: by 2002:ab0:35c7:0:b0:411:968:212 with SMTP id x7-20020ab035c7000000b0041109680212mr23473675uat.107.1668127784551;
 Thu, 10 Nov 2022 16:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com> <20221110183853.3678209-2-jagan@amarulasolutions.com>
In-Reply-To: <20221110183853.3678209-2-jagan@amarulasolutions.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 11 Nov 2022 08:49:33 +0800
Message-ID: <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
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
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.com> wro=
te:
>
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 =3D Enable and 1 =3D Disable.

Oh I see, that's confusing... IMHO you might want to change the
register macro name... (but if that's what the datasheet uses, it
might not be ideal either). At the _very_ least, I'd add a comment in
the code so the next person doesn't attempt to "fix" it again...

BTW, are you sure DSIM_HSE_MODE is correct now?

>
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
>
> Fix the MIPI_DSI*_NO_* mode flags handling.
>
> Fixes: 0f3b68b66a6d ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index ec673223d6b7..b5305b145ddb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *=
dsi)
>                         reg |=3D DSIM_AUTO_MODE;
>                 if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
>                         reg |=3D DSIM_HSE_MODE;
> -               if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
>                         reg |=3D DSIM_HFP_MODE;
> -               if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
>                         reg |=3D DSIM_HBP_MODE;
> -               if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>                         reg |=3D DSIM_HSA_MODE;
>         }
>
> -       if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +       if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>                 reg |=3D DSIM_EOT_DISABLE;
>
>         switch (dsi->format) {
> --
> 2.25.1
>
