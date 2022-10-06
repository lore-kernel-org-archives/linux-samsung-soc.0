Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1F6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Oct 2022 14:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiJFOVj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Oct 2022 10:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiJFOVh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 10:21:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC7F26C9
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Oct 2022 07:21:36 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so4838724ejb.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Oct 2022 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fXBXPvzEiAEH5ehv1zHDRG9gqpMMOtis32/SucrCl80=;
        b=Wcj68O3BWIgWWj19pCPkOJ1c7xaya+yrBKMqyHBXAG2vcU8EsrOR0oAunzIXiBWn2b
         FkNWsWDQ3LZ6YKBA2T8VwhsoaQmnttOGXoSduqCq/I1kzOMvRmS7WjZxpVQyNcgAw1Rq
         cRt9bMVLA01HuYpifaVfgmApE7JHhyN4QhhOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXBXPvzEiAEH5ehv1zHDRG9gqpMMOtis32/SucrCl80=;
        b=oqEIyoUB5KKcKTBZOKl86q0ahv07RtEPv1Y0mfdAVowCTWCD06yWg9WvIS6na3Rd8E
         O6NGRXKdEkiBdVzh4IwQCieZ/S37bSvWGEBijO5i4xQHgSw9OipzHRryxkewoNwFZdZz
         Jd1htdrA1Or2qu9rvzu7/GVND2Iht64cytACNBtBtKKOktvPuF8v1P0RDQ7YNQ0HOYMi
         YcaFMQCm5aipT4FKjK1XqNESaPahrVQAlKvfB3jIwrMnGSz21N04KwxP6sn50emSPpTr
         4AQOkKXSAkbSWLTJWPEtR4jlEt1Qpfpc4ECb7ekauRDGpwyJP4rc1+LeCcss2j596CPa
         RLcw==
X-Gm-Message-State: ACrzQf3fiEKINqFPZJVcj1cnFjosKPNYhej81IGu1h7DqRUVyKUpSuqm
        pHoktXfVrHdXh0HtgaViGks6REOBqBo/z8hz8X/iJA==
X-Google-Smtp-Source: AMsMyM5zfD+IcIiD4jIzzJDInCXOJceYLLjeWumY18xRsBZqIMlxpH/IpvyguY/dHTVbb8rSW4Yk4t4RAniBUAaC698=
X-Received: by 2002:a17:906:5a4c:b0:78c:c893:74e6 with SMTP id
 my12-20020a1709065a4c00b0078cc89374e6mr40190ejc.545.1665066094875; Thu, 06
 Oct 2022 07:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35@eucas1p2.samsung.com>
 <20221005151309.7278-1-jagan@amarulasolutions.com> <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
In-Reply-To: <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 6 Oct 2022 19:51:23 +0530
Message-ID: <CAMty3ZDN6jK-fup=eHeU5doF8xqcuq87YPah4gVhcWuL-xdFmA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
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
        Neil Armstrong <narmstrong@linaro.org>,
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

On Thu, Oct 6, 2022 at 2:21 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 05.10.2022 17:12, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v7:
> > * fix the drm bridge attach chain for exynos drm dsi driver
> > * fix the hw_type checking logic
> >
> > Changes for v6:
> > * handle previous bridge for exynos dsi while attaching bridge
> >
> > Changes for v5:
> > * bridge changes to support multi-arch
> > * updated and clear commit messages
> > * add hw_type via plat data
> > * removed unneeded quirk
> > * rebased on linux-next
> >
> > Changes for v4:
> > * include Inki Dae in MAINTAINERS
> > * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> > * update init handling to ensure host init done on first cmd transfer
> >
> > Changes for v3:
> > * fix the mult-arch build
> > * fix dsi host init
> > * updated commit messages
> >
> > Changes for v2:
> > * fix bridge handling
> > * fix dsi host init
> > * correct the commit messages
> >
> > Patch 0001:   Samsung DSIM bridge
> >
> > Patch 0002:   PHY optional
> >
> > Patch 0003:   OF-graph or Child node lookup
> >
> > Patch 0004:   DSI host initialization
> >
> > Patch 0005:   atomic check
> >
> > Patch 0006:   PMS_P offset via plat data
> >
> > Patch 0007:   atomic_get_input_bus_fmts
> >
> > Patch 0008:   input_bus_flags
> >
> > Patch 0009:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0010:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
>
> This finally doesn't break Exynos DSI. :) Feel free to add:
>
> Acked-by: Marek Szyprowski
>
> Tested-by: Marek Szyprowski
>
> The next step would be to merge Dave's patchset and remove the hacks
> added here and there. Otherwise we will end up adding even more hacks soon.

I've some concerns about one of those patches, I will try to comment
on that patch in mailing list or will send updated changes on top of
those.

Thanks,
Jagan.
