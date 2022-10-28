Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10904C38A02
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Oct 2022 12:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJ1MMp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJ1MMo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 08:12:44 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B58279A5B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 05:12:43 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id e15so4380840iof.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x4ejCqr3vNjDNfMKXxsxlFT1lysYHgEOTPagMJjkJ2w=;
        b=EwzwbK83NKY/wVifYdoFcS0E+E+QzMC3KcSwq49PB79/3ktlSW9euEapqZLqYRTaHE
         sjnIcg2h2LTc6Ie2NuMctDiLryLRkobCiSQfK4X+m2YcSZ7IL/cAqyGj7Ca4nax8jAeB
         LK56IDmgQi7/pdRYAIIlSKk9eVVNzHeo74E4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4ejCqr3vNjDNfMKXxsxlFT1lysYHgEOTPagMJjkJ2w=;
        b=Ep/SqhC2p7BmgfkF37La8F4TOmrfhqaKMCkq7O2fWsmGkLAF2KO5DGtzX5aSEv5VdF
         iuTQWgOIqDhYou0yfxuwd9q2Ls71KXdad41/befCRuCkWHZVGp6Ix095XQGya6SBnCha
         tfEuqn7TGWdpCGYp2xjrbXI+VjDR155CvFM+17PYNtqXFHSGr6oGysxctDlnhXdAEiUr
         D87kbsHVXB/NKxrrGLf8WT2y+EQryXd7TTARZdgDiKh+c9hy9QWEIos9TZAldKV79HxA
         AKro3TUpsv5PBjmBHp2F7wjpAshwmR7eQq68wEpQPggokh8kAxakCx7MJfna2TzjEgWR
         K0Xg==
X-Gm-Message-State: ACrzQf3nnIjYsn2YyBLNUvz3G31mRLdF26RD18nHls7KADPy5HWessXp
        ZuTZINBGWSuwnx8pRA3g9Os6LxtwJx4Do31gIPKBZg==
X-Google-Smtp-Source: AMsMyM5enro+z1lym3cQp+DmD9qshR9qr8ZsgCyq2fDyPAd1TMja7D7tFcXTsuIxpjYwAmCddFybLYkv4bxEtZ22cOY=
X-Received: by 2002:a6b:3f44:0:b0:6c2:c90e:dc30 with SMTP id
 m65-20020a6b3f44000000b006c2c90edc30mr8183460ioa.156.1666959162762; Fri, 28
 Oct 2022 05:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com> <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
 <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de> <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
 <CGME20221017084832eucas1p190091bef8dce651ad0bf582880a56117@eucas1p1.samsung.com>
 <76423028-e58e-7271-0d74-fb4bb2bf65c8@denx.de> <2b0350ba-070a-8df0-9a2d-8c18da03b6cb@samsung.com>
 <CAMty3ZBFy0r1YFVpA73bG2t2FAz1SbJRQ1yvBYo62wSAde7XnA@mail.gmail.com>
In-Reply-To: <CAMty3ZBFy0r1YFVpA73bG2t2FAz1SbJRQ1yvBYo62wSAde7XnA@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 28 Oct 2022 17:42:31 +0530
Message-ID: <CAMty3ZCV3SCaqXD3y_=1YpJm3Z+61C0GjzPgwE4Hn4ux3apLng@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Marek Vasut <marex@denx.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 18, 2022 at 8:35 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Mon, Oct 17, 2022 at 2:31 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > Hi,
> >
> > On 17.10.2022 10:48, Marek Vasut wrote:
> > > On 10/17/22 09:43, Jagan Teki wrote:
> > >> On Mon, Oct 17, 2022 at 12:49 PM Marek Vasut <marex@denx.de> wrote:
> > >>> On 10/17/22 04:49, Jagan Teki wrote:
> > >>>> On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
> > >>>>>
> > >>>>> On 10/5/22 17:13, Jagan Teki wrote:
> > >>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
> > >>>>>> various
> > >>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
> > >>>>>>
> > >>>>>> In order to access this DSI controller between various platform
> > >>>>>> SoCs,
> > >>>>>> the ideal way to incorporate this in the drm stack is via the drm
> > >>>>>> bridge
> > >>>>>> driver.
> > >>>>>>
> > >>>>>> This patch is trying to differentiate platform-specific and
> > >>>>>> bridge driver
> > >>>>>> code by maintaining exynos platform glue code in exynos_drm_dsi.c
> > >>>>>> driver
> > >>>>>> and common bridge driver code in samsung-dsim.c providing that
> > >>>>>> the new
> > >>>>>> platform-specific glue should be supported in the bridge driver,
> > >>>>>> unlike
> > >>>>>> exynos platform drm drivers.
> > >>>>>>
> > >>>>>> - Add samsung_dsim_plat_data for keeping platform-specific
> > >>>>>> attributes like
> > >>>>>>      host_ops, irq_ops, and hw_type.
> > >>>>>>
> > >>>>>> - Initialize the plat_data hooks for exynos platform in
> > >>>>>> exynos_drm_dsi.c.
> > >>>>>>
> > >>>>>> - samsung_dsim_probe is the common probe call across
> > >>>>>> exynos_drm_dsi.c and
> > >>>>>>      samsung-dsim.c.
> > >>>>>>
> > >>>>>> - plat_data hooks like host_ops and irq_ops are invoked during the
> > >>>>>>      respective bridge call chains.
> > >>>>>
> > >>>>> Maybe the Subject should say "Split ... driver" or "Move ...
> > >>>>> driver" ,
> > >>>>> since it is not adding a new driver here ?
> > >>>>
> > >>>> Though it is not added a completely new driver, it is adding more
> > >>>> infrastructure platform code to be compatible with both Exynos and
> > >>>> i.MX8M. This is the prime reason for adding that commit head and
> > >>>> explaining the same in the commit body.
> > >>>
> > >>> Diffstat looks like this:
> > >>>
> > >>>    drivers/gpu/drm/bridge/samsung-dsim.c   | 1703
> > >>> ++++++++++++++++++++++
> > >>>    drivers/gpu/drm/exynos/Kconfig          |    1 +
> > >>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766
> > >>> ++---------------------
> > >>>    include/drm/bridge/samsung-dsim.h       |  113 ++
> > >>>    7 files changed, 1952 insertions(+), 1653 deletions(-)
> > >>>
> > >>> Looks to me like most of the code is just moved from existing driver in
> > >>> this patch.
> > >>
> > >> Yeah, as I explained (from commit) it is moved, updated, and written
> > >> the plat code. How about this head?
> > >>
> > >> "drm: bridge: Add Samsung DSIM bridge (Split from exynos_drm_dsi)"
> > >
> > > I disagree with the "Add" part of the Subject, but I'll wait for
> > > others' opinion here.
> >
> > Maybe something like a "Generalize Exynos-DSI DRM driver into a generic
> > Samsung DSIM bridge"?

I'm using this commit head for next version patches, hope all Okay with it.

Thanks,
Jagan.
