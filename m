Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7D3C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jul 2022 11:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbiGULNA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jul 2022 07:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbiGULM7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 07:12:59 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3FB82128
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2022 04:12:58 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ss3so2500526ejc.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2022 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bWB1n3BjW/TWB6swVQ3izNKlloaKqYiwDk5KO5rsGQ=;
        b=prTqJ3kszRl/Y6aPlIRDyWcAdAdZZVSCgCKaZOW5wh9Qt6FYpuattroTDjlAnkG9bT
         SEHTFuTrk7VKRDs8xBtNq8xD56FJcgcMQwIGGZuh2D3Xlz4B2JHMGGwgTzsIW3f8hzIY
         4jQhmtwrivDGIg9yija8XOcC92kLB2Zgk3ess=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bWB1n3BjW/TWB6swVQ3izNKlloaKqYiwDk5KO5rsGQ=;
        b=z5v8Kgla8HH6Zw6JAgol4S+OKYHWvZLuPp+F6eqOVLEqHFWf3VNscoyYp6gXrEjHzw
         e3vSNaKA+EPiLiY2QKGw42ygrK+qdzvLG+Y1t4Fgpt7wkpX87hZHJYr3oAml8/l61/ZE
         RAMSA8wcTPsoz+gd+DB9qPCPSjnA8DBGAa6XTCTj9M+baCEv0JHGQTL4FiTLpPPDwsdj
         pWTs5S0InZ2cFCLr11jZ4/YIMNCpebGIaukpkY6eqPyBocd1dyVVdVQPq1SMFGCglahr
         DVnvqpMEyWlPWXzW49WnwDGh30JdVI1LwMQXIdJyzj6oJl0kcOToXptL0FCMTTBMVP8B
         ddIQ==
X-Gm-Message-State: AJIora/k/iR/zKF9IAdjD290mEb+xt8shXhQtnYzxF0TOhd0U94wKlb5
        My5kotwkjQfWYGph3XRDSdTGyOwrQdlfDSIQVvP98A==
X-Google-Smtp-Source: AGRyM1sF67vJVc6cIWxuhYrLplHoU7hktpFBGLNNhVWl498hs+oHq2RaVIFs7/eP0Tc1GWg9p0GxCg1EHAqrObvx1x8=
X-Received: by 2002:a17:907:1629:b0:72b:68e9:bf2c with SMTP id
 hb41-20020a170907162900b0072b68e9bf2cmr39581240ejc.760.1658401976678; Thu, 21
 Jul 2022 04:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155329eucas1p1643af66a6bc9eb3cf478fc8b064a620f@eucas1p1.samsung.com>
 <20220720155210.365977-9-jagan@amarulasolutions.com> <de9b3aa2-c1d4-6ee5-5061-27cec4bab679@samsung.com>
In-Reply-To: <de9b3aa2-c1d4-6ee5-5061-27cec4bab679@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 21 Jul 2022 16:42:45 +0530
Message-ID: <CAMty3ZAwJ9SSiJatk0mjLUfyRUd=H7BwWooD65CY+az4ESUvbA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] drm: bridge: samsung-dsim: Add module init, exit
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
        Neil Armstrong <narmstrong@baylibre.com>,
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

Hi Marek,

On Thu, Jul 21, 2022 at 4:39 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 20.07.2022 17:52, Jagan Teki wrote:
> > Add module init and exit functions for the bridge to register
> > and unregister dsi_driver.
> >
> > Exynos drm driver stack will register the platform_driver separately
> > in the common of it's exynos_drm_drv.c including dsi_driver.
> >
> > Register again would return -EBUSY, so return 0 for such cases as
> > dsi_driver is already registered.
>
> I've already pointed that this is a bad style solution. It will also not
> work in the following cases:

Yes, I have seen it in v2. (sending again since its part of the series
and resolved other issues on v2)

>
> 1. exynos drm and samsung-dsim compiled as modules - samsung-dsim
> module, once loaded, will register the driver and exynos_drm won't be
> able to register the exynos_dsi.
>
> 2. multi-arch case - if one compiles a kernel (disto-style) with drivers
> for both supported architectures (exynos and imx) - in such case it will
> not work on imx, because exynos_drm driver will always register
> exynos_dsi driver first (even if the kernel is booted on non-exynos board).

Okay. I need to check the best way to handle this - so far this seems
new. any suggestions, please let me know.

Thanks,
Jagan.
