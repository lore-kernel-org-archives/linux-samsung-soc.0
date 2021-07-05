Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6611EC07E99
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Jul 2021 12:34:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DC686135F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Jul 2021 12:34:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhGEMhG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Jul 2021 08:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhGEMhG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Jul 2021 08:37:06 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A2AC06175F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jul 2021 05:34:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id hc16so28839632ejc.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2021 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYgCutTysFjToHhxhkTGe6Ke5bNipQU+7DP9IUElXsg=;
        b=LgB9rSVsdNUUYfdjJMCGmGNKxmE2UF/Kjqs128rNHr99DqjGJlyFRjf64qSh2fzVuu
         YhIcxtUz5+MsDVvCcsfObntGC/X3zaRGXeUgaeNxBWYGAzJc1ZdidX6ySdcEDFwTmicI
         nE2fEdvZ3kRBG+3HWteSHTEstabuNuHjgJo1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYgCutTysFjToHhxhkTGe6Ke5bNipQU+7DP9IUElXsg=;
        b=gzmneU2hWx1nfNsRwtNMv/ZR4feXJmWLGuCktc1IcLb/yxC+R38l/VEXCPFJyeT3GD
         tC+5PaGEYQXQBHb1fQxOE3Je1i8FyaLF/uZbnB1t+OThibIEaCgpMGndXVY8UGq/nzx2
         n3Li9y/sGvoAF5BBtCBwQ5TuWtCs6dGes+MR6RvMVzv1KA5X/W2wSPvnftJ7caKq7CIR
         R4KNq7v/5vG6HBDtfQ4a7oBq/WRV6Fo+j/qpzviOOfXaXfy68AsRldaDI2b9F6t+ts6c
         yee1N8pzdHAF+Ykmj7dczLHtkaGnBRUg3nD5rmVHXyz9Y7c+vgo6+pesbEPRnoAs6E1K
         bFRw==
X-Gm-Message-State: AOAM530ylC2YiByZzdi+6Lsiyk/MGzDi5KUwuy2XIhWRU0yf9q3BsPpo
        t2jVR8mPJMe6mOQnP2+gWXxnmU0whOoQEu7OB2+dcQ==
X-Google-Smtp-Source: ABdhPJwGdD3qkRDbzHJZ7re9u/ZbvF8hk9l6hZz+QJMz7zwD2KihNnr1v6zzB8WCDMxiReKthjN3KTtJiypPnR6+HYA=
X-Received: by 2002:a17:906:bb10:: with SMTP id jz16mr13254166ejb.252.1625488467616;
 Mon, 05 Jul 2021 05:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <CGME20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff@eucas1p2.samsung.com>
 <20210704090230.26489-4-jagan@amarulasolutions.com> <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
 <CAMty3ZB6Y91iOBPujNWZh9h5kO4p04NioiL2zJY_j_c_LqOxBw@mail.gmail.com> <03653aa2-ed43-88b3-213a-9ccc99587844@samsung.com>
In-Reply-To: <03653aa2-ed43-88b3-213a-9ccc99587844@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 5 Jul 2021 18:04:16 +0530
Message-ID: <CAMty3ZCd7DugDYbOfro3e5uRgtXviP9p-5nXp30mRPcoy5gG4g@mail.gmail.com>
Subject: Re: [RFC PATCH 03/17] drm/exynos: dsi: Use the drm_panel_bridge API
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 5, 2021 at 5:43 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 05.07.2021 14:00, Jagan Teki wrote:
> > On Mon, Jul 5, 2021 at 5:18 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 04.07.2021 11:02, Jagan Teki wrote:
> >>> Use drm_panel_bridge to replace manual panel and
> >>> bridge_chain handling code.
> >>>
> >>> This makes the driver simpler to allow all components
> >>> in the display pipeline to be treated as bridges by
> >>> cleaning the way to generic connector handling.
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> This breaks Exysos DSI driver operation (Trats board worked fine with
> >> only patches 1-2):
> >>
> >> [    2.540066] exynos4-fb 11c00000.fimd: Adding to iommu group 0
> >> [    2.554733] OF: graph: no port node found in /soc/fimd@11c00000
> >> [    2.602819] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> >> mapping operations
> >> [    2.609649] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> >> fimd_component_ops)
> >> [    2.632558] exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops
> >> exynos_dsi_component_ops): -22
> >> [    2.642263] exynos-drm exynos-drm: master bind failed: -22
> >> [    2.651017] exynos-drm: probe of exynos-drm failed with error -22
> > Thanks for testing it.
> >
> > Can you check Squash of 3,4 or 3,4,5 will work or not?
>
> I've check both sets: 1-4 and 1-5 and none of them works. The result is
> same as above. If I remember correctly, last time when I played with
> that code, there was a problem with DRM core calling bridge ops in
> different order than when they are used by the Exynos DSI driver.

Okay. Let me check with sun6i-mipi-dsi as it is component_ops based.

Jagan.
