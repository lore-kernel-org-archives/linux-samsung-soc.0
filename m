Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D53DC38145
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Sep 2022 19:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiIFTHb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Sep 2022 15:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIFTHa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 15:07:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DACF371B1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Sep 2022 12:07:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 29so11339169edv.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2022 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LMW+jVRAUtxo0G5/AqL3ArJNzArMc0GdnLOnyNW830Y=;
        b=BJe01478kvZ4x9YS2hi1J8b0dF6VrcUHu60BeTRLk7dNMu4+hCwvHGgzYECpi6sYrE
         NRBp92Wprr8NLudaQWAzD4tXggjB8RyBJ78j048KxGIy4uyBc38N16WCrmtU5HIMZv+6
         cMebJz8zfq66aYV8UvRM6f0BlK7P+g+S2+Wa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LMW+jVRAUtxo0G5/AqL3ArJNzArMc0GdnLOnyNW830Y=;
        b=eB0lW27npaurzLx/3FMVQCpfjwbWlEfkaiq4JmyQr+jCgRZ72IwyWh33p/k0ZbFhmT
         mtdofr2uvYIytEVKiDp0MQAcWEQCAMLaaHT+P902p0sKEr6tsqVBSp71e9918dSbuuRo
         ral/mXVXGzFYB35b2UAyI01kmZ6s+99+Sht4q9PFXDQZPjwP2wiExT/DL7xwkzlS1GzJ
         wfaVQnyV/5GnJNcuqi9ekHXVkh8KxOYSuNYNgo9AJ91ZN9j63CM0QnwZahQoxiK+sae6
         mvC4j+TrPWWK7RXKe/iNo7B/crcClCSXhMR3BBW5P1aysDh0tIkOFW0Ggpz2Hs+ZL5sX
         p+YA==
X-Gm-Message-State: ACgBeo1P6P7dRZmauaL653Bqni1sKNjL8zno8lM0WBTtJ6CYgPF8ArKW
        j3quYzcag1v89EHsmwMTnHgviA+l/vk83jZh+zmEOV492aNv3A==
X-Google-Smtp-Source: AA6agR7YChizRCzP04sB2ovdCtbQoLg25OAxC/J2Huz/9j7HTYrEBSOd8/xgRyQaVJ/EPOqsfoRRDLvNGf+zhrvNa9g=
X-Received: by 2002:aa7:d883:0:b0:44e:bbbe:d661 with SMTP id
 u3-20020aa7d883000000b0044ebbbed661mr76210edq.248.1662491247794; Tue, 06 Sep
 2022 12:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com> <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
In-Reply-To: <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 7 Sep 2022 00:37:16 +0530
Message-ID: <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
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

On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi All,
>
> On 02.09.2022 12:47, Marek Szyprowski wrote:
> > On 29.08.2022 20:40, Jagan Teki wrote:
> >> Samsung MIPI DSIM controller is common DSI IP that can be used in
> >> various
> >> SoCs like Exynos, i.MX8M Mini/Nano.
> >>
> >> In order to access this DSI controller between various platform SoCs,
> >> the ideal way to incorporate this in the drm stack is via the drm bridge
> >> driver.
> >>
> >> This patch is trying to differentiate platform-specific and bridge
> >> driver
> >> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> >> glue code and samsung-dsim.c as a common bridge driver code.
> >>
> >> - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >>    detach code along with conventional component_ops.
> >>
> >> - Samsung DSIM is a bridge driver which is common across all
> >> platforms and
> >>    the respective platform-specific glue will initialize at the end
> >> of the
> >>    probe. The platform-specific operations and other glue calls will
> >> invoke
> >>    on associate code areas.
> >>
> >> v4:
> >> * include Inki Dae in MAINTAINERS
> >> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> >
> > This breaks Exynos DRM completely as the Exynos DRM driver is not able
> > to wait until the DSI driver is probed and registered as component.
> >
> > I will show how to rework this the way it is done in
> > drivers/gpu/drm/exynos/exynos_dp.c and
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>
> I've finally had some time to implement such approach, see
> https://github.com/mszyprow/linux/tree/v6.0-dsi-v4-reworked
>
> If you want me to send the patches against your v4 patchset, let me
> know, but imho my changes are much more readable after squashing to the
> original patches.
>
> Now the driver is fully multi-arch safe and ready for further
> extensions. I've removed the weak functions, reworked the way the
> plat_data is used (dropped the patch related to it) and restored
> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
> free to resend the above as v5 after testing on your hardware. At least
> it properly works now on all Exynos boards I have, both compiled into
> the kernel or as modules.

Thanks. I've seen the repo added on top of Dave patches - does it mean
these depends on Dave changes as well?

Jagan.
