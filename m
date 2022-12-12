Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CE9C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbiLLO1o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 09:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiLLO1n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:27:43 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1673D60DC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:27:42 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id v71so13802877ybv.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLxM6SJA3MI+DcbyXwhzkIm5xUO+lyRM9SM+GA/jzQI=;
        b=NiVnhJWwxqUap2ZxJBo5FBgomWDY/zMK5ZUMbAY7/o6hrbu8JC0UeocZbSZqvnSlOJ
         C6GY0yLPaaYSEsq+E9+ewbqejSEZymTey+jAhPAwvDKNvrJ/syKhW0kqBfjd3UKJ3czA
         J0wgyLoaaJsK/vl1DoqTkontWN9bQzqWbtYsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLxM6SJA3MI+DcbyXwhzkIm5xUO+lyRM9SM+GA/jzQI=;
        b=JvPkP0zP7iMP1g5jnlR7X0AK1Ur/aV4yUN8rOZ6vqovoorQYhJe+U0fqACMuO9+CGN
         QGpuftBfvbu5+Mg/udeG53yb42wE9FbIyzonidPq1jGa+siFCFxDTngw9nn01WswRYIt
         48UNdaMBJebtZd191w9GgSyHAWblmydmuYXxzb0CW/wqELaARwHHHj387F/vGkxLHIZV
         6d22dLzybu8liXJ8pl274GbPGGWDE7F4rLUnJcMBIGZFB/JZZDcod/daVtC/HYYAOGY1
         6JUtJkl6uD6QFheMESn1AohUE0dG78XlM+GUOK75FQmwecfTFtLe/MbQLUVA6duYBSLX
         BhjA==
X-Gm-Message-State: ANoB5plBTI5ey7PRHQ11bLcjMcWtTU14l6MydGNLaMrQFPHEuB7ZydPO
        pv15gLViJGfzHwUuyK8cCYEyhMoswdWGckxoAO44Iw==
X-Google-Smtp-Source: AA0mqf6oPj1o3c79NjTUpx/8UwbKd2eJyE1ki88yiWPFr+Lnw+vePGC726VrzghzoA3adiM/ipNUooi746UUBHLU+Dg=
X-Received: by 2002:a25:b84f:0:b0:728:d92a:24a3 with SMTP id
 b15-20020a25b84f000000b00728d92a24a3mr232203ybm.159.1670855261223; Mon, 12
 Dec 2022 06:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475@eucas1p2.samsung.com>
 <20221209152343.180139-5-jagan@amarulasolutions.com> <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
 <CAMty3ZB9yGyAdddNaW6g8j2PYJo=p8Z3MGqwzt8A=qyrM5H-fw@mail.gmail.com> <72083bbd-216d-4e7e-13b3-509e984fc118@samsung.com>
In-Reply-To: <72083bbd-216d-4e7e-13b3-509e984fc118@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Dec 2022 19:57:29 +0530
Message-ID: <CAMty3ZB0Y5UZCP5P9gY=PH+JEB_gZZVWxf2RP4kKt1NjFV34HQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To:     Marek Szyprowski <m.szyprowski@samsung.com>
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
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 7:51 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 12.12.2022 10:03, Jagan Teki wrote:
> >   On Mon, Dec 12, 2022 at 2:28 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> Hi Jagan,
> >>
> >> On 09.12.2022 16:23, Jagan Teki wrote:
> >>> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> >>> 0 =3D Enable and 1 =3D Disable.
> >>>
> >>> The logic for checking these mode flags was correct before
> >>> the MIPI_DSI*_NO_* mode flag conversion.
> >>>
> >>> Fix the MIPI_DSI*_NO_* mode flags handling.
> >>>
> >>> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabli=
ng
> >>> features")
> >>> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> >>> Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.c=
om>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>> Changes for v9:
> >>> - none
> >>>
> >>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
> >>>    1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> >>> index e5b1540c4ae4..50a2a9ca88a9 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_d=
si *dsi)
> >>>                        reg |=3D DSIM_AUTO_MODE;
> >>>                if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> >>>                        reg |=3D DSIM_HSE_MODE;
> >>> -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> >>> +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> >>>                        reg |=3D DSIM_HFP_MODE;
> >>> -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> >>> +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> >>>                        reg |=3D DSIM_HBP_MODE;
> >>> -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> >>> +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> >>>                        reg |=3D DSIM_HSA_MODE;
> >>>        }
> >>>
> >>> -     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> >>> +     if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >>>                reg |=3D DSIM_EOT_DISABLE;
> >>>
> >>>        switch (dsi->format) {
> >>
> >> Huh, this changes the logic in the driver! I've spent another half of
> >> the night trying to figure out why v8 and v9 doesn't work on all my
> >> Exynos boards with DSI panels again...
> >>
> >> Please drop this patch from this series. If you want to get the Exynos
> >> DSI -> Samsung DSIM conversion merged, please focus on the core patche=
s
> >> and don't add more random 'fixes' to each new version.
> >>
> >> This change has to be discussed separately. The values written by the
> >> Exynos DSI driver to the registers ARE CORRECT and DSI panels work fin=
e
> >> with such configuration. So either everything is correct, or these fla=
gs
> >> are reversed both in the Exynos DSI driver AND at least tested DSI
> >> panels (s6e8aa0, s6e3ha2, s6e63j0x03). I would need to check this in
> >> panel datasheets if I manage to get them.
> > This issue was reproduced as part of the series in v7 in i.MX8m
> > platform and reported by S=C3=A9bastien Szymanski [1] and TRM matches t=
he
> > fix as well.
> >
> > [1] https://lore.kernel.org/all/4c9475d0-f76f-0c59-1208-6e5395496c9e@ar=
madeus.com/
>
> Then please append the following changes to this patch to keep current
> code working:
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> index 1355b2c27932..2a33602372d9 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -692,7 +692,9 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
>
>          dsi->lanes =3D 4;
>          dsi->format =3D MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags =3D MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +       dsi->mode_flags =3D MIPI_DSI_CLOCK_NON_CONTINUOUS
> +               | MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
> +               | MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKE=
T;
>
>          ctx->supplies[0].supply =3D "vdd3";
>          ctx->supplies[1].supply =3D "vci";
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> index 3223a9d06a50..bb47dbfdd7ee 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> @@ -446,7 +446,8 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *d=
si)
>
>          dsi->lanes =3D 1;
>          dsi->format =3D MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET;
> +       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO_NO_HFP
> +               | MIPI_DSI_MODE_VIDEO_NO_HBP | MIPI_DSI_MODE_VIDEO_NO_HSA=
;
>
>          ctx->supplies[0].supply =3D "vdd3";
>          ctx->supplies[1].supply =3D "vci";
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> index 362eb10f10ce..c51d07ec1529 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -990,8 +990,6 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
>          dsi->lanes =3D 4;
>          dsi->format =3D MIPI_DSI_FMT_RGB888;
>          dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BU=
RST
> -               | MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
> -               | MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKE=
T
>                  | MIPI_DSI_MODE_VSYNC_FLUSH |
> MIPI_DSI_MODE_VIDEO_AUTO_VERT;

Okay. I think I can send the first 5 patches separately. and then send
the DSIM. Do you think it makes sense? and any chance to apply these
soon?

Jagan.
