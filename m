Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C200C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 15:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbiLLPeE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 10:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiLLPd4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 10:33:56 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEE5D2D6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 07:33:55 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-381662c78a9so151352157b3.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HlLz46JrENHa8C6qB/kOY9DxKCNNCi0KZWArbqXe5iY=;
        b=hD90rrO6DTclBGuXRutk53zM8ZzV/DuiV3HIDPKl0mci2bojEyK47hSYR2RGFqZZ20
         k68GIs6civUjbsvaObarOqUBhEpVmI16KVzM2rK6uqjjW/FSh9rw6+D1Ab5wlBcskI6v
         U9jydtKtads15RLZGISzoLjWf+7+jfu6Be4J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlLz46JrENHa8C6qB/kOY9DxKCNNCi0KZWArbqXe5iY=;
        b=CJeva/SeXP5ZvGZVTArI5ee4qQO8jqSywSf8nP1I0majmCyhhz56Y6720bV6H2u8M6
         YlLtZzR5Cfsaizo/0GKPlOm5X2IUbMfkSAQkDe8hOlPLnWPMTAVG5Z7f6R9ikMa+EKOV
         PTZaCd14JfWCwWqEDa9zjvHafQMtuGJxd7bFqgWmA4Vdr5qt1rGa1C7mLYy04+37r4Cg
         XsU+pBCMbE0G/zoS2wtmPrTEEUrx76frCruo//fa7OsE/Pi6NvzP7NMYb5EbqCLO61Q2
         OnTXx6MP/TvfmhErP8/+qPKAelEO0FqZUC4SRivFE3bT1lreRbDZfZJ42p1LFwxH9uTf
         T0bA==
X-Gm-Message-State: ANoB5pkmOx6M+oRETWd3eZnvj2DC5DukxMOy8k4p2Fc41GEqishGPDzQ
        aXhVMUhAaMDj+V/gNaVktKujqwZqVPLfVMj1g+UhOQ==
X-Google-Smtp-Source: AA0mqf6s4qYOLuJiaSiQ5ahfpuDn2VcPF75hIbI+rUJr/mTeBvuSTQMoZSAM39WJ4O7acKNC7mkG1N6EAEXx6bXvP6g=
X-Received: by 2002:a81:7357:0:b0:407:7bc3:d949 with SMTP id
 o84-20020a817357000000b004077bc3d949mr2225437ywc.186.1670859234919; Mon, 12
 Dec 2022 07:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com> <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
In-Reply-To: <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Dec 2022 21:03:43 +0530
Message-ID: <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
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

On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 12.12.2022 09:43, Marek Szyprowski wrote:
> > On 12.12.2022 09:32, Jagan Teki wrote:
> >> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>> Hi Jagan,
> >>>
> >>> On 09.12.2022 16:23, Jagan Teki wrote:
> >>>> The existing drm panels and bridges in Exynos required host
> >>>> initialization during the first DSI command transfer even though
> >>>> the initialization was done before.
> >>>>
> >>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> >>>> flag and triggers from host transfer.
> >>>>
> >>>> Do this exclusively for Exynos.
> >>>>
> >>>> Initial logic is derived from Marek Szyprowski changes.
> >>>>
> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>> ---
> >>>> Changes from v9:
> >>>> - derived from v8
> >>>> - added comments
> >>>>
> >>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >>>>    include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>>    2 files changed, 17 insertions(+), 3 deletions(-)
> >>> The following chunk is missing compared to v8:
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> index 6e9ad955ebd3..6a9403cb92ae 100644
> >>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> >>> *dsi, unsigned int flag)
> >>>                   return 0;
> >>>
> >>>           samsung_dsim_reset(dsi);
> >>> -       samsung_dsim_enable_irq(dsi);
> >>> +
> >>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>> +               samsung_dsim_enable_irq(dsi);
> >> Is this really required? does it make sure that the IRQ does not
> >> enable twice?
> >
> > That's what that check does. Without the 'if (!(dsi->state &
> > DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
> > from pre_enable, then from the first transfer), what leads to a
> > warning from irq core.
>
> I've just noticed that we also would need to clear the
> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>
> However I've found that a bit simpler patch would keep the current code
> flow for Exynos instead of this reinitialization hack. This can be
> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
> init in pre_enable" patch:
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0b2e52585485..acc95c61ae45 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(struct
> drm_bridge *bridge,
>
>          dsi->state |= DSIM_STATE_ENABLED;
>
> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> -       if (ret)
> -               return;
> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> +               if (ret)
> +                       return;
> +       }

Sorry, I don't understand this. Does it mean Exynos doesn't need to
init host in pre_enable? If I remember correctly even though the host
is initialized it has to reinitialize during the first transfer - This
is what the Exynos requirement is. Please correct or explain here.

Jagan.
