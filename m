Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CC4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 07:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiJQHni (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Oct 2022 03:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiJQHne (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 03:43:34 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CE95AC69
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 00:43:31 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-132af5e5543so12381086fac.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 00:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATIms5kSTeUsYq3a6qs11i+14w2DWzAnEfeQbKlhXNk=;
        b=o8/ijuKiI+M1K0ijv8Sha8wXlREe8jjsWPdKkjL9hXNVWw/85rnuUq7HwKkVFkyPfD
         9L+4j0PC3hCYuScHLDzYGjBQ5SmXUudwerY80y5nviCg+iLjcLwxY9LkdYTup6bCyqck
         DWqFXs+Al5B4g4Idf1fYg/W6XwOuNM8WFmhsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATIms5kSTeUsYq3a6qs11i+14w2DWzAnEfeQbKlhXNk=;
        b=Bxnd9UMRb5jkVKnqRrJVXQxC3Nj1DrcAiYSxPiWGPeWL8GEzCTeVPla7f0ZYbirSkm
         r97+HC25doDWGtK4KcDx1BFoEsdiZGhB8QA3M5SfqV5kq1SCXTXn6bcfuL0frX+gJ6rP
         BK9zJcaUm3Psvz7EUAfQR6NpWgdB/9dI484R7otQGhQSDhzaXDH+CxtkfLRCmlcAWxec
         s9Mt/TLoPh3g4vAjSgKR+g5NKdhnexGOKVSbyZ/GvjmmJfM5SIIHLXf5/ch1GEBbwpAJ
         m8aClTdG7hXMm+KIPnHI/6TOb3UgH6e/wWD6AaFDVcMKP7K3yVx9kgCfzZLs1SF73hTM
         w21g==
X-Gm-Message-State: ACrzQf0zgSzVrg6N5nMxumH0KT6yVduu1bKEhwhucFm+SMmMndNE4rey
        YV57tf1muyqePZvI9gFcUn+Tgn0iEMvZWx60Qe+yyw==
X-Google-Smtp-Source: AMsMyM7g02EeiDnhBL3r7CZltNPjxIRCJahMTfVKO6Vls9khNac8f62uFegFqqR3ndIn/92rvrJhd+h2mC8jDJJ37HI=
X-Received: by 2002:a05:6870:8999:b0:133:15f9:82fd with SMTP id
 f25-20020a056870899900b0013315f982fdmr4939223oaq.276.1665992608900; Mon, 17
 Oct 2022 00:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com> <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com> <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
In-Reply-To: <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 17 Oct 2022 13:13:17 +0530
Message-ID: <CAMty3ZBLQu8YijrSVdt84-J9hoOx8qcRSaGF-FvZVsJEWVaXjQ@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 12:49 PM Marek Vasut <marex@denx.de> wrote:
>
> On 10/17/22 04:49, Jagan Teki wrote:
> > On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/5/22 17:13, Jagan Teki wrote:
> >>> Samsung MIPI DSIM controller is common DSI IP that can be used in various
> >>> SoCs like Exynos, i.MX8M Mini/Nano.
> >>>
> >>> In order to access this DSI controller between various platform SoCs,
> >>> the ideal way to incorporate this in the drm stack is via the drm bridge
> >>> driver.
> >>>
> >>> This patch is trying to differentiate platform-specific and bridge driver
> >>> code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
> >>> and common bridge driver code in samsung-dsim.c providing that the new
> >>> platform-specific glue should be supported in the bridge driver, unlike
> >>> exynos platform drm drivers.
> >>>
> >>> - Add samsung_dsim_plat_data for keeping platform-specific attributes like
> >>>     host_ops, irq_ops, and hw_type.
> >>>
> >>> - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
> >>>
> >>> - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
> >>>     samsung-dsim.c.
> >>>
> >>> - plat_data hooks like host_ops and irq_ops are invoked during the
> >>>     respective bridge call chains.
> >>
> >> Maybe the Subject should say "Split ... driver" or "Move ... driver" ,
> >> since it is not adding a new driver here ?
> >
> > Though it is not added a completely new driver, it is adding more
> > infrastructure platform code to be compatible with both Exynos and
> > i.MX8M. This is the prime reason for adding that commit head and
> > explaining the same in the commit body.
>
> Diffstat looks like this:
>
>   drivers/gpu/drm/bridge/samsung-dsim.c   | 1703 ++++++++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig          |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766 ++---------------------
>   include/drm/bridge/samsung-dsim.h       |  113 ++
>   7 files changed, 1952 insertions(+), 1653 deletions(-)
>
> Looks to me like most of the code is just moved from existing driver in
> this patch.

Yeah, as I explained (from commit) it is moved, updated, and written
the plat code. How about this head?

"drm: bridge: Add Samsung DSIM bridge (Split from exynos_drm_dsi)"

Jagan.
