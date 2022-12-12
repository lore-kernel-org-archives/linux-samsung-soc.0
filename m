Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2093CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 08:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbiLLIcU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 03:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiLLIcS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 03:32:18 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B1FB7F7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 00:32:18 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3b10392c064so136471267b3.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5nV2CvDZfukPo6kYti38gUyvFyPZkuwTvD1jwHN2S4=;
        b=rfFx7d3Wh6bqiy8B51bav3A6IV7Da0E6ToVVDvU2NEnFwl/P6NHu0H45jGRkiFwFE6
         TH6ELNdwU+HeziYyJV5rizHisFsWpRwDpbaAy7/dkn961GMb9jUM1dt38j5Ap3ao7ZkT
         jbmzQeL1Sh5ktJdrps5lYbjKdiLmCgZROurzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5nV2CvDZfukPo6kYti38gUyvFyPZkuwTvD1jwHN2S4=;
        b=09prOv5th8bNjmdDOsvRgXdholybv5rGMvJxCo76+5aPBkZIHZT/G2u0pmMje91Mxo
         rsDy2IY34c0Q2OAiOolXMhzMKl2/uAfBqnotFylEC1edBR7oYCDw+CmrvflClsihALL5
         9b4CyjQ8RwEspnE6abODpCYzF+9KxNCevLWFaknU2BmvzmwHOTc7OFNUh3xG9xX39seI
         gV/0FtnX39wyKPXjm9slm5m4yuXZTjpoHpFPCu2J/8+rGvX9xXdaZpKgjDeX8ibg8U4h
         9YBua0MKMyJN7lqFUnFaRXDBLTpvHgnDLvLWApP+jiZxTfq8b/k/kRSUrklrxru4ZmI4
         KQww==
X-Gm-Message-State: ANoB5ply6oahlM8zvyCxkHPEWpRValRRpq+AWnMgPYdwyGG7m9EFasLW
        IWWFbDibhUD7kRoJeSOsPRw80Gm5kFOVBcEJNoxWJA==
X-Google-Smtp-Source: AA0mqf6aTgUMMJHWUlm3ipUcDMMe3rX+Hw9+V8yHcM7MQTUwAt81ByVoivunR2I2iDWTQaKHwKkwiP4ZMc7kFzzpqbE=
X-Received: by 2002:a81:9a13:0:b0:398:ab7a:aba9 with SMTP id
 r19-20020a819a13000000b00398ab7aaba9mr20562238ywg.106.1670833937138; Mon, 12
 Dec 2022 00:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
In-Reply-To: <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Dec 2022 14:02:05 +0530
Message-ID: <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
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
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 09.12.2022 16:23, Jagan Teki wrote:
> > The existing drm panels and bridges in Exynos required host
> > initialization during the first DSI command transfer even though
> > the initialization was done before.
> >
> > This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> > flag and triggers from host transfer.
> >
> > Do this exclusively for Exynos.
> >
> > Initial logic is derived from Marek Szyprowski changes.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes from v9:
> > - derived from v8
> > - added comments
> >
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >   include/drm/bridge/samsung-dsim.h     |  5 +++--
> >   2 files changed, 17 insertions(+), 3 deletions(-)
>
> The following chunk is missing compared to v8:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 6e9ad955ebd3..6a9403cb92ae 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> *dsi, unsigned int flag)
>                  return 0;
>
>          samsung_dsim_reset(dsi);
> -       samsung_dsim_enable_irq(dsi);
> +
> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> +               samsung_dsim_enable_irq(dsi);

Is this really required? does it make sure that the IRQ does not enable twice?

Jagan.
