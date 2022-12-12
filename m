Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADAFC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 09:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiLLJDb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 04:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbiLLJD1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 04:03:27 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AA65FD2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 01:03:25 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3bfd998fa53so136886587b3.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64rlgrD+okUidId1fJzfFG/Lh2XWGY3xOxTXFt4UClU=;
        b=rk4MIe96SX9Q/v8+35xWTLYPSXIirs6dDqVru8TRfwT3N/B5ITBBQDL2ZAiBpz7WM/
         HHKfe4soq5UxhrAnEYzalOfWDDT4bK7cF5EzZ79KrDQ2+SmygBQdmJNUaTwN2Kq5+OrR
         RxflS/kdIg8JhLuAq01TTHRGssOEsObuuiUrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64rlgrD+okUidId1fJzfFG/Lh2XWGY3xOxTXFt4UClU=;
        b=Y7261QQZuhrSsbZoJA4niPGqA+EElpC3dYEMs45xIkQCQQ8bovVekBktYu0AMGbb6I
         SxhxdJrdKbmQKsMPS02KqZz3eIMEFjSdYiy5shgtm1DkptD+V2lH/0H7xIWP2ZQm1aM0
         XZ7WEEyPnYt01xO1XsJT/FAEFyohVc/7dYnIIOSG6sNpwDU1rVVLQh7PvNrFLGr8XaOB
         OvuBefwBb5eemFU5V+cfJ9YgFrkzpaI/Vi9RJYEMC55CTKxME6dGPhNplGytc7gs35eY
         BLfRucOlhpz9CqIEUrXHYeI1sOorbcAr5fgyKc6qPcaqumxhOIzgPiaCFDpFS4ZnXBSR
         AJmA==
X-Gm-Message-State: ANoB5pkpp801kKmkaf3pYqVTTBjTT9dXh9uwqG+YVdyAt+upkkGedMMU
        KIUaz1kF7KyhnrFd1p4HhiGgxCnkzyyq8URyWOuRyjYYKlgep427EqA=
X-Google-Smtp-Source: AA0mqf6U5g4mvWxqEgrmM0kAjcljcItnC4sTOd1cfpL5+0talYekW2osbjJStpWUvftCztPq6nAHL23dmcM7E9NoljQ=
X-Received: by 2002:a05:690c:58d:b0:3c7:8c92:1243 with SMTP id
 bo13-20020a05690c058d00b003c78c921243mr9743ywb.81.1670835804653; Mon, 12 Dec
 2022 01:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475@eucas1p2.samsung.com>
 <20221209152343.180139-5-jagan@amarulasolutions.com> <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
In-Reply-To: <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Dec 2022 14:33:13 +0530
Message-ID: <CAMty3ZB9yGyAdddNaW6g8j2PYJo=p8Z3MGqwzt8A=qyrM5H-fw@mail.gmail.com>
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

 On Mon, Dec 12, 2022 at 2:28 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 09.12.2022 16:23, Jagan Teki wrote:
> > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > 0 =3D Enable and 1 =3D Disable.
> >
> > The logic for checking these mode flags was correct before
> > the MIPI_DSI*_NO_* mode flag conversion.
> >
> > Fix the MIPI_DSI*_NO_* mode flags handling.
> >
> > Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> > features")
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v9:
> > - none
> >
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/=
exynos/exynos_drm_dsi.c
> > index e5b1540c4ae4..50a2a9ca88a9 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi=
 *dsi)
> >                       reg |=3D DSIM_AUTO_MODE;
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> >                       reg |=3D DSIM_HSE_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> > +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> >                       reg |=3D DSIM_HFP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> > +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> >                       reg |=3D DSIM_HBP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> > +             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> >                       reg |=3D DSIM_HSA_MODE;
> >       }
> >
> > -     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> > +     if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >               reg |=3D DSIM_EOT_DISABLE;
> >
> >       switch (dsi->format) {
>
>
> Huh, this changes the logic in the driver! I've spent another half of
> the night trying to figure out why v8 and v9 doesn't work on all my
> Exynos boards with DSI panels again...
>
> Please drop this patch from this series. If you want to get the Exynos
> DSI -> Samsung DSIM conversion merged, please focus on the core patches
> and don't add more random 'fixes' to each new version.
>
> This change has to be discussed separately. The values written by the
> Exynos DSI driver to the registers ARE CORRECT and DSI panels work fine
> with such configuration. So either everything is correct, or these flags
> are reversed both in the Exynos DSI driver AND at least tested DSI
> panels (s6e8aa0, s6e3ha2, s6e63j0x03). I would need to check this in
> panel datasheets if I manage to get them.

This issue was reproduced as part of the series in v7 in i.MX8m
platform and reported by S=C3=A9bastien Szymanski [1] and TRM matches the
fix as well.

[1] https://lore.kernel.org/all/4c9475d0-f76f-0c59-1208-6e5395496c9e@armade=
us.com/

Jagan.
