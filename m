Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC3AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 10:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJAKe6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 06:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJAKex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 06:34:53 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D83AE47
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 03:34:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 8-20020a17090a0b8800b00205d8564b11so6260460pjr.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jsxWmcwphpybL3dC3x6YCHCFp2gYnWKEJjkthollSQ8=;
        b=ePqSJD+hpGkOh8FKrnQQplyy9nV0YG/tXs5I8bGy3q9xHBc0Ddryu9Mv1wbgB3mlGJ
         eUjrtikRanvO7PwA8p/UWAjRt3mq2FUZb1Uz7u0uJ7o3UOoLsi4rVRyXLMkegj2YOk4t
         ficzA6700XnGBsVKlo3U3EWMTw4J2Fxzd8WA05jqB816TJmPKz7RazgcmdYDJP+Fazxo
         ybYl9ZtW97YlEBHemKy8wZ3Tp4ARKUQrPW1aafdkcZwZUBw30kqSC/gDl/8pBzhssZbT
         2Up3qtB80u/LN/CopWH5GVxp0+0Uyl2Wzc57KW+sWUjH3kkJYgAiynX2yXkvA/SkiyHO
         lV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jsxWmcwphpybL3dC3x6YCHCFp2gYnWKEJjkthollSQ8=;
        b=d6S5LecV0YCq8oZO7HwwBjTf6bMcwyKuySLdr1dzHsjqCqwkdix+pygmwYUchDumkp
         8+58JGrX2+ZHDtoGQyj8WCvOZq5ns+dYL3ZIH0YMNr7yyffEoP2l2f+5YJezBGm5BLko
         FwwoF8O7RBaA3M71MgVDf7lsMyzI8jSJ7OujlsGcgNQBF8QYCfMBQerPnHhEuK09BOG7
         jrjCCtayoxIcXiRpWq8DfyPkdBcoNBr6tcteq70hVEmeqHNIhLIvhibpxW3/j8vS0jI6
         8jdts1MBE+2bDG+McsU+fJCrDgw1rd6WBI8i68I4iuMKi53dIczidGrmMydHDr1yGISd
         z/+g==
X-Gm-Message-State: ACrzQf1Px++6/fgEIWWnbUAzA1GmS5tkUSR/ivkzZ4AtZzpI0Ndaxo98
        /Yg2diHYNkU3iPwizw7/bF/ItQMKGe9w10Q5Hs8=
X-Google-Smtp-Source: AMsMyM5eOJEjCBWuJQFr2T8CTbIQxzVpeAMBWpD/N1SJ+Z1C0Rs9T0TveCvSOatrBw+Fu+YCypM/IeZb2rNX/oqxSSU=
X-Received: by 2002:a17:902:eb82:b0:17d:eb32:5ed9 with SMTP id
 q2-20020a170902eb8200b0017deb325ed9mr1320791plg.130.1664620492454; Sat, 01
 Oct 2022 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 1 Oct 2022 07:34:40 -0300
Message-ID: <CAOMZO5CsDePtApxwU1RCJj+BJkDuWj-bCHx5SkWO-e5zf7PRBA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
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
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

On Sat, Oct 1, 2022 at 5:07 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v6

This URL returns an error. Please double-check.
