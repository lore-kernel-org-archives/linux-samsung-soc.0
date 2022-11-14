Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F2AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Nov 2022 08:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbiKNI1a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Nov 2022 03:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236435AbiKNI1U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 03:27:20 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FB51AF02
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Nov 2022 00:27:18 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z3so7631289iof.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Nov 2022 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmp1dYQCbZLGOPjiM2VzGz3cHY77hSYHeqQM7i6gYwU=;
        b=pP2VMtbFMeWnVX6GpnQ/REv1U4873cMuvb+A5Xt16esbTDwV6k7EOk+Whl9RhAI2VS
         V6ZqKgYBpWwp79cNQT3ivYrBfr89Vxob1V11IqGwvrN0UrB9dLkRRGo/n2Z7gI5O020D
         mSWMnR8tY+l9tNHYR8+0DL1ZFCUBlSuWoK8wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mmp1dYQCbZLGOPjiM2VzGz3cHY77hSYHeqQM7i6gYwU=;
        b=ac1wM8aFfWyL/RVHV8a1THyfzprW2YI2h/Q/9F79/AgymQ+0eR13Rahnm29veVGGi3
         b7X5XDu+3KGvdHs5C5/XAndWe5iUHZCNkkrgX6PtxsT0uaIRsHsWhpV4ANyOYFIvSUmy
         mVj5PZvghTn7CQFNmRQTdWP92i4SC+AxAf/eqkQ9AJ7/+6wlfxKmIsXEaFDT+hOnm2Cl
         2j4sF29eWsv/ufRd1iitbSxxuQM7bRJ2DHk2cw9KE++WnDHmv+pvM9jmJpr8ObdvfrEr
         NpGlBFs/dKojOQKkC3OwiZkzHztko6WxZNmQr+BkJ/MUel7GMv8cdo0/5s6AlW030xeh
         p8gg==
X-Gm-Message-State: ANoB5pms5KQEjZ3mdrfWC+Cwa2FY31xcFhPA8HxEL/bqqVuvqCeYUC7s
        NEhbxCUpRGgOYDeEJtHVxLK0RNP9JwcZ34VqZpXl1Q==
X-Google-Smtp-Source: AA0mqf4CJNi/WT6y/nKg/6/MbojI99gy2fNilUDmZmqOZVGq3dUI3+Z3OCdc4F9z5LpkCdp5KzydLeE67p8aNZ/vyQ8=
X-Received: by 2002:a6b:b7c6:0:b0:6d6:bff5:bbdf with SMTP id
 h189-20020a6bb7c6000000b006d6bff5bbdfmr5126103iof.156.1668414437562; Mon, 14
 Nov 2022 00:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com> <19761b19-72ac-249a-05f3-d99e27733ae0@denx.de>
In-Reply-To: <19761b19-72ac-249a-05f3-d99e27733ae0@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 14 Nov 2022 13:57:06 +0530
Message-ID: <CAMty3ZAAYnDyWpZSmq2MRk2SHg7Oi2wUuA83K1Zno2WnrLPaJA@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
To:     Marek Vasut <marex@denx.de>
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
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 13, 2022 at 5:55 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 19:38, Jagan Teki wrote:
> > HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> > conversion as 'disable mode bit' due to its bit definition,
> > 0 = Enable and 1 = Disable.
> >
> > Fix the naming convention of the mode bits.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index b5305b145ddb..fce7f0a7e4ee 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -75,10 +75,10 @@
> >   #define DSIM_MAIN_PIX_FORMAT_RGB565 (0x4 << 12)
> >   #define DSIM_SUB_VC                 (((x) & 0x3) << 16)
> >   #define DSIM_MAIN_VC                        (((x) & 0x3) << 18)
> > -#define DSIM_HSA_MODE                        (1 << 20)
> > -#define DSIM_HBP_MODE                        (1 << 21)
> > -#define DSIM_HFP_MODE                        (1 << 22)
> > -#define DSIM_HSE_MODE                        (1 << 23)
> > +#define DSIM_HSA_DISABLE             (1 << 20)
> > +#define DSIM_HBP_DISABLE             (1 << 21)
> > +#define DSIM_HFP_DISABLE             (1 << 22)
> > +#define DSIM_HSE_DISABLE             (1 << 23)
>
> Those four bits are called Hxx_DISABLE_MODE in the MX8M{M,N,P}RM at
> least, so keep both suffixes .

Okay, I will update the suffixes.

>
> A separate patch which turns those bits to BIT() macro would be nice.

I plan to do this conversion for all bits once this basic patchset
merges. I hope it is okay with it.

Jagan.
