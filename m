Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A57C07E9B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Jul 2021 12:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6C9C6145D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Jul 2021 12:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhGEMDs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Jul 2021 08:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhGEMDr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Jul 2021 08:03:47 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF9DC061574
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jul 2021 05:01:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id b2so28743456ejg.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2021 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGuPeMN8zkdPQjcnEwbeIwIBVsqBhILaUCgkLVxvDIw=;
        b=q3OLm05fCG+cXVayBfPolQ96fFMDwVcgLxLGIcY4So4KhtjqNPNTLrERdFct/xcQnG
         uIlG0SDO2xgAUTdopMDtBVQahhjaoVA/69qpm1ZspLq6Huy/YIIWqVdMGwAZbkeiuJcQ
         5pgJuce66IkiMI4ik/NnrFz3vxrQCVXjtz5g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGuPeMN8zkdPQjcnEwbeIwIBVsqBhILaUCgkLVxvDIw=;
        b=FMwQInX52khv92RKOd7M+/CV1hvNmfm8iD3EVTjNmUmuHFDdY5x06fBcHO12w6yDLn
         xLt2a8P3tdF+YbxCrIJW7e0+7CjAw1uwQlsW/n6jLLC7Oh2yF4tCa67X29JT2ex+Cf3Q
         zegwV0AKTBJqxwLI3U1vX2mEBbUd6OeG8Dktdf3Ql6WlFZ9fZU8IVJc6Wb8hr6J+jbzv
         El+fxEg0McfxHQ0YmafvoqFXny+o2Q2MlDHDUT/B5tpwQPmxyZj+RV/gHfSenklaE/EO
         uHIvVw43/t7JlXrpF/EORVXIS9wNjUck8UsMgVXFavcT96GJpuTPjM1VQ3xcesladKcS
         D1Yg==
X-Gm-Message-State: AOAM531hhXyxQQx61U8cxB54lJtV20jxEljl01of0TP2nEzyiayahXjm
        m3zFMxYTn0HCUmLhfwMpJ7si/OGSIcUcYX6Paw94XA==
X-Google-Smtp-Source: ABdhPJwVDTheCeyDFdym6u4brcx0LurzRRARJzXqy0PRVQGeyD8MwvD5M4rgTnKegCf3lV+bZY+DgUAx4Vn9RaDMVJo=
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr13163327eju.295.1625486468878;
 Mon, 05 Jul 2021 05:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <CGME20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff@eucas1p2.samsung.com>
 <20210704090230.26489-4-jagan@amarulasolutions.com> <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
In-Reply-To: <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 5 Jul 2021 17:30:57 +0530
Message-ID: <CAMty3ZB6Y91iOBPujNWZh9h5kO4p04NioiL2zJY_j_c_LqOxBw@mail.gmail.com>
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

On Mon, Jul 5, 2021 at 5:18 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 04.07.2021 11:02, Jagan Teki wrote:
> > Use drm_panel_bridge to replace manual panel and
> > bridge_chain handling code.
> >
> > This makes the driver simpler to allow all components
> > in the display pipeline to be treated as bridges by
> > cleaning the way to generic connector handling.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> This breaks Exysos DSI driver operation (Trats board worked fine with
> only patches 1-2):
>
> [    2.540066] exynos4-fb 11c00000.fimd: Adding to iommu group 0
> [    2.554733] OF: graph: no port node found in /soc/fimd@11c00000
> [    2.602819] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> mapping operations
> [    2.609649] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> fimd_component_ops)
> [    2.632558] exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops
> exynos_dsi_component_ops): -22
> [    2.642263] exynos-drm exynos-drm: master bind failed: -22
> [    2.651017] exynos-drm: probe of exynos-drm failed with error -22

Thanks for testing it.

Can you check Squash of 3,4 or 3,4,5 will work or not?

Thanks,
Jagan.
