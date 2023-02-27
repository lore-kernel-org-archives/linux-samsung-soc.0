Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19368C7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 19:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjB0TPo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjB0TPn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 14:15:43 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C2324CA5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:15:42 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536bbef1c5eso204486667b3.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vJ0PEb+cdNY7DG4C7LQ/ErPjGFU907p7f+jGsEX+0Y=;
        b=LPDlavxV0IgkdbK41fkEgVVOAF5S1ar8xXlkMFoeOOdKOKvMfCfiPOTsvGfykIK3P7
         Pbmlp53oSpmt4FPh5qyB14Xne+yuy1OE7icqEiKM9mRT3puzAMX53TspDEHohtZfNIKD
         rvku2OJvpF/XPLBBgOnhigEkDK+3i1luS+reY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vJ0PEb+cdNY7DG4C7LQ/ErPjGFU907p7f+jGsEX+0Y=;
        b=zl+u82PQwRkCL4rl9Bj/gw3XEWYkViWZyjjcY1pzQxdgGC4t4gBLnu/rMHBt+k2F5I
         LROP2lbSjAl5BMC8Oe8oAPfDiYERx3q7NhHRE2aedwO0Q6XgLaUkJd+blswaC0k3njPE
         /ARC01loxLxSXsCUzao+O9yK3dIr1rPK4WHpdCRttnhR0BQYXj82fiB8l2fjynTa4P1Q
         V+hmaVr55RNW0Y0JZuy/pW6jaVJ3XyiPp43x6GxjFCPRs+hic7YpDWfCDkUAYG0sDFI/
         snT60nOPLeTBLvawNpYxgDsehzeUkFqbuy4hh1PKSM4/Ln+5TUznW7k9QVzaC0E+hbBT
         D6Yw==
X-Gm-Message-State: AO0yUKW8cIKhOMKmE4uO4uhDkkhwNRSPMYhETOCuUFHGZj/l1qi/uVX5
        xzYn33u+n3HmpPCgs+Nq58EcdFH5EPTovbTRTq5XCw==
X-Google-Smtp-Source: AK7set+WBush+SD7X8YrWjXfq7TBxgTqfRk6xq+el+E8D/KPl3wAJ0QPXF23UO1RHgty640vs6wpkls4Sab6muTsMjI=
X-Received: by 2002:a25:5d0c:0:b0:aa2:475c:2982 with SMTP id
 r12-20020a255d0c000000b00aa2475c2982mr882946ybb.1.1677525341640; Mon, 27 Feb
 2023 11:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com> <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com> <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
In-Reply-To: <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 00:45:30 +0530
Message-ID: <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 20:01, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/27/23 12:39, Jagan Teki wrote:
> >>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> >>> downstream DSI bridge and panel and trying to add a panel bridge
> >>> if the panel is found.
> >>>
> >>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> >>> followed with drmm_panel_bridge_add.
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>> Changes for v13, v12, v11:
> >>> - none
> >>> Changes for v10:
> >>> - new patch
> >>>
> >>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> >>>    1 file changed, 13 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> index df15501b1075..12a6dd987e8f 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> @@ -25,6 +25,7 @@
> >>>    #include <drm/drm_atomic_helper.h>
> >>>    #include <drm/drm_bridge.h>
> >>>    #include <drm/drm_mipi_dsi.h>
> >>> +#include <drm/drm_of.h>
> >>>    #include <drm/drm_panel.h>
> >>>    #include <drm/drm_print.h>
> >>>    #include <drm/drm_probe_helper.h>
> >>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >>>        struct device *dev = dsi->dev;
> >>>        struct drm_encoder *encoder = &dsi->encoder;
> >>>        struct drm_device *drm = encoder->dev;
> >>> +     struct drm_bridge *bridge;
> >>>        struct drm_panel *panel;
> >>>        int ret;
> >>>
> >>> -     panel = of_drm_find_panel(device->dev.of_node);
> >>> -     if (!IS_ERR(panel)) {
> >>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> >>> -     } else {
> >>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> >>> -             if (!dsi->out_bridge)
> >>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> >>> -     }
> >>
> >> As far as I understand this from my conversation with Maxime (please put
> >> him on CC of V15), the change here should instead perform the panel look
> >> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> >> the component_ops .bind callback . Here is an example of correct
> >> implementation:
> >>
> >> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
> >
> > But, we don't have component_ops.bind for imx8m case, so where do we
> > want to place the panel hook?
> >
> > Exynos drm drivers are component-based but, imx8mm is not.
>
> In 14/18 patch, the same should be added to generic_dsim_register_host()
> , which is called from the driver .probe() callback, but that is OK.
>
> That's ^ is the iMX part.

Ohh. You mean, we need to find the panel hook separately in two places like
- bind for exynos
- probe for imx8mm

If so? how can I find the drm_device pointer in the probe?

Jagan.
