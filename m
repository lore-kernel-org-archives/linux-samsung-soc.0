Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E4DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 02:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiJQCtp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Oct 2022 22:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiJQCto (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 22:49:44 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2231E19C10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 19:49:42 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id s125-20020a4a5183000000b0047fbaf2fcbcso2453149ooa.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Jrsl0UCrrczEefB5mN7PjqCqG5f1N/sWxxZQbZjv3s=;
        b=Xi3eyoMMPzVM7+iKFTYOQPhI1SIJwbYywWs8FFmiz3JpO1rC3Y/lBkhkVySVVxwzLO
         ss74QRLdRA/8A/uJuH4m4AFQhGyKyMFTsT1UZLuFvpVjq2FVFeiy1PqwxdaGYrLZgZ7R
         D8hyFaK6xkIFEGB+cNNQDJ482ixbgtydWt2w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Jrsl0UCrrczEefB5mN7PjqCqG5f1N/sWxxZQbZjv3s=;
        b=hCOdw4g+yljM/r7lWYoWKXI8G+AslnwkXVhtT1FHARejLcUg/PfRfxQzB4u+KHL5yH
         U8WeCyFJUtFyAkopwL9aSLs2ndPRarXKriOuQ3FKcRVkWNlzYRrLR4jseKKf8HtYqfYe
         I1ljTeg2Spw96Zo/CfEAzxWOVdSbxRHC528exmE5UAiVvdCsRnCknl+MnKo9PDsZQLPq
         m0KexVdMqz1rWYgjNjj5DlECPNQsnK0yhJ4PzLMJrgPMEsO/1pIvIhl+6ilXzwtJhlK3
         7cdeb/lwNs2+UOiSx4fg28ZRPLirCgzyKd2fIziKCWw/KRA5SeqiyUjSZvMrnO5dZ80t
         /upQ==
X-Gm-Message-State: ACrzQf2Y/xCSIRqIbF85Q468HOry9pVpuosataYZx3dz7RDLaXxy4pTX
        Q8iweW4aHxjQrN3tHiizKgx8jzsTfUVOzH4ubHIszQ==
X-Google-Smtp-Source: AMsMyM6ZKL7rdFD2T1i6bvy9KnjQQWq1NZKyEdqAj+XsyeUJYp3ifQl1EA8TE/V4w+GlY/4+m/n4n+nRCQQzd4NZIAY=
X-Received: by 2002:a4a:d4c1:0:b0:476:42e3:b45e with SMTP id
 r1-20020a4ad4c1000000b0047642e3b45emr3369161oos.89.1665974981414; Sun, 16 Oct
 2022 19:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com> <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
In-Reply-To: <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 17 Oct 2022 08:19:30 +0530
Message-ID: <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
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

On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
> > Samsung MIPI DSIM controller is common DSI IP that can be used in various
> > SoCs like Exynos, i.MX8M Mini/Nano.
> >
> > In order to access this DSI controller between various platform SoCs,
> > the ideal way to incorporate this in the drm stack is via the drm bridge
> > driver.
> >
> > This patch is trying to differentiate platform-specific and bridge driver
> > code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
> > and common bridge driver code in samsung-dsim.c providing that the new
> > platform-specific glue should be supported in the bridge driver, unlike
> > exynos platform drm drivers.
> >
> > - Add samsung_dsim_plat_data for keeping platform-specific attributes like
> >    host_ops, irq_ops, and hw_type.
> >
> > - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
> >
> > - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
> >    samsung-dsim.c.
> >
> > - plat_data hooks like host_ops and irq_ops are invoked during the
> >    respective bridge call chains.
>
> Maybe the Subject should say "Split ... driver" or "Move ... driver" ,
> since it is not adding a new driver here ?

Though it is not added a completely new driver, it is adding more
infrastructure platform code to be compatible with both Exynos and
i.MX8M. This is the prime reason for adding that commit head and
explaining the same in the commit body.

Jagan.
