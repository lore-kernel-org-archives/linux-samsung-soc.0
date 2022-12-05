Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E139FC4321E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Dec 2022 12:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiLEMGS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Dec 2022 07:06:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiLEMGR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 07:06:17 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EFBE0B8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Dec 2022 04:06:16 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3b56782b3f6so115204147b3.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2022 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OrDSz1v9qyNjHSfcaUzl0KseW+BdUND2SR3NKy5ohvo=;
        b=JVI6tC0j8MUWq8058NICxilbSJ0mIl1vJnSCq38O1iQw78yaTNZKoY8s9DFI4b15Zy
         gF3c2tBYI31QQjjLQCNk8Su8s0rr41C1Rn3HfkDCXB3jc5fcTo/em9nsygWNgFOvBQgM
         fVa2i98NImyIlY5JqOC255M9/Ug18pSmGLSHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrDSz1v9qyNjHSfcaUzl0KseW+BdUND2SR3NKy5ohvo=;
        b=lN2HQ3v++/otz5cvPeE5s8KR6kX0t+8IZevBCWG04l8xSAM4iiHvnJorpWd+N8QVVI
         m/2DO/U4zrcs5CzMWBWDodIMhIemc08TCqaQVqYJLIASAqtGhDqBMzkw0nIRb9PYc2hD
         FdS7VTD54KgjuTtGhdChr6CR1/G26eCBqYIwmesJtrDRDmhZRroKgSbh3oTksCXSvbFE
         nnGIVMJqmPfZxbSsF2HRubD3kmN9ArI982eDBwtK0XpUMP7gTEOZPm1+rbl3V/O3UFMi
         dS5kn3kfMKKXBsQqzZvHxx6OGPjV3HlCm78z49OQQCPgLSNSs2k1vBnVwlzvFZ56hWCa
         q42g==
X-Gm-Message-State: ANoB5pluqFozEBiiW1Ds76rF20nMF0/GuqZxjBDvoP99Fs5nYhrW09Id
        pOgMfnjwU7E0MJa6+cc0UYpfFi6CRGk+XisVWec/Kw==
X-Google-Smtp-Source: AA0mqf4JPC8fLduP2jgV//4lunhlPYXqSvawe4GsRfezQ/THGEDzEtOZpD33TCjgo6axNknJUNVnt/GTnkwKtAbd3OQ=
X-Received: by 2002:a05:690c:91:b0:392:1434:c329 with SMTP id
 be17-20020a05690c009100b003921434c329mr61359779ywb.72.1670241975488; Mon, 05
 Dec 2022 04:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com> <8dea3d9c-61b6-c576-ff97-89e4ad55a5d2@kontron.de>
In-Reply-To: <8dea3d9c-61b6-c576-ff97-89e4ad55a5d2@kontron.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 5 Dec 2022 17:36:03 +0530
Message-ID: <CAMty3ZCM-R2aWj5pTVX9vSRw4VFWgayrZs+1hJ50HOmPZtNPxw@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
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
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 5, 2022 at 5:29 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 10.11.22 19:38, Jagan Teki wrote:
> > HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> > conversion as 'disable mode bit' due to its bit definition,
> > 0 = Enable and 1 = Disable.
> >
> > Fix the naming convention of the mode bits.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index b5305b145ddb..fce7f0a7e4ee 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -75,10 +75,10 @@
> >  #define DSIM_MAIN_PIX_FORMAT_RGB565  (0x4 << 12)
> >  #define DSIM_SUB_VC                  (((x) & 0x3) << 16)
> >  #define DSIM_MAIN_VC                 (((x) & 0x3) << 18)
> > -#define DSIM_HSA_MODE                        (1 << 20)
> > -#define DSIM_HBP_MODE                        (1 << 21)
> > -#define DSIM_HFP_MODE                        (1 << 22)
> > -#define DSIM_HSE_MODE                        (1 << 23)
> > +#define DSIM_HSA_DISABLE             (1 << 20)
> > +#define DSIM_HBP_DISABLE             (1 << 21)
> > +#define DSIM_HFP_DISABLE             (1 << 22)
> > +#define DSIM_HSE_DISABLE             (1 << 23)
> >  #define DSIM_AUTO_MODE                       (1 << 24)
> >  #define DSIM_VIDEO_MODE                      (1 << 25)
> >  #define DSIM_BURST_MODE                      (1 << 26)
> > @@ -804,13 +804,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
> >                       reg |= DSIM_AUTO_MODE;
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> > -                     reg |= DSIM_HSE_MODE;
> > +                     reg |= DSIM_HSE_DISABLE;
>
> Please add a comment to explain that the DSIM_HSE_DISABLE bit as named
> in the datasheet actually has inverted logic (set = HSE enabled).

Yes, I have the V9 series with all relevant fixes and updates -
waiting for the responses on the host init patch 06/14

Jagan.
