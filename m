Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C28C6FA82
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Sep 2022 08:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiIWIbk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Sep 2022 04:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiIWIbj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Sep 2022 04:31:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A65BE1713
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2022 01:31:38 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id a41so17040641edf.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2022 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vje7rqmfVDBOBMrBDL33KnVd0h6LDfzOlkHm4bdHrlM=;
        b=ESMQoh9pul519xiFeItMjUeH5Saqg5zMGGjIlD63Ral2iVH+ndyuGppp6O4nDZRi/J
         DkDsY+UBFeJgpdbKft8NSrLqWlhFD/MoLRIBJhHlzj9cC1VMrR8wWWffZFprjrubFuTN
         mrhteV8KSybXaGjSWET7W9/Ufen7iDjEcicg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vje7rqmfVDBOBMrBDL33KnVd0h6LDfzOlkHm4bdHrlM=;
        b=k78EueLJwhluegUlnIHSHrUjflf4LMzbvLvt9x7Dk3BW3xXnwGDBjWXFxv651lU0mp
         ayWDEXEjPNIKHYkc3hsF+G/mtpUD4kJVZ7U8orZkcaX8BjkhyLlCwgUjVvkas+bUyvLa
         6Xt6ODVQJBkL815nL8ecxgjuIQ8hJKSFsFlFiCxobWCY1JXjZVACihOWPGxj7F9QeYyl
         GMOYyEhIOK/mQ8gfOsC1ijHaN+pZbLFXTGfwmBOqfPoZUbIdWgVukPGECjJvUzlDTB/2
         Wg1Kxysa6d1OGsNaV9JGsvkmJPQe3GLZaVVEzrvvJ873NQ1o37pO16Rzqskvn/2wUjjp
         lNCg==
X-Gm-Message-State: ACrzQf15nz/Bj1iXi0ecMNp5Fy28MJPOF/1rSemenkgeyBHEBYJ6aJL3
        0ZqSFH9FGnREmEMYfNAoVlffuaqFYB1LEHmFaiTsTw==
X-Google-Smtp-Source: AMsMyM5hJlB4Vwc2zLPdF+6HhfFrtJtha6OqEJO/GkZlobtVkoa6dqU/Vy7VZV8JVXyOrhiZlFBix+1gS3dGYfrZP5k=
X-Received: by 2002:a05:6402:400e:b0:44f:1b9d:9556 with SMTP id
 d14-20020a056402400e00b0044f1b9d9556mr7203364eda.208.1663921896779; Fri, 23
 Sep 2022 01:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220916181822eucas1p2bfdd1247b0297638620846586598f2a6@eucas1p2.samsung.com>
 <20220916181731.89764-1-jagan@amarulasolutions.com> <9cf6b220-ac9c-3267-bdb2-29fc2f157f71@samsung.com>
In-Reply-To: <9cf6b220-ac9c-3267-bdb2-29fc2f157f71@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 23 Sep 2022 14:01:25 +0530
Message-ID: <CAMty3ZBQVab7YJBAKNkmudzDBeLUoUEW+VCEcMEtDK6fK56erQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
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

On Fri, Sep 23, 2022 at 1:04 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 16.09.2022 20:17, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > Previous v4 can be available here [1], repo on linux-next [2] and
> > Engicam i.Core MX8M Mini SoM boot log [3].
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v3:
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
> > Patch 0001:   Restore proper bridge chain in exynos_dsi
> >
> > Patch 0002:   Samsung DSIM bridge
> >
> > Patch 0003:   PHY optional
> >
> > Patch 0004:   OF-graph or Child node lookup
> >
> > Patch 0005:   DSI host initialization
> >
> > Patch 0006:   atomic check
> >
> > Patch 0007:   PMS_P offset via plat data
> >
> > Patch 0008:   atomic_get_input_bus_fmts
> >
> > Patch 0009:   input_bus_flags
> >
> > Patch 0010:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0011:   add i.MX8MM DSIM support
> >
> > [3] https://protect2.fireeye.com/v1/url?k=f5b98b61-94329e52-f5b8002e-000babff9bb7-1f9a3bf1da680bc2&q=1&e=efefced1-2052-43c5-834f-b50867c29e3c&u=https%3A%2F%2Fgist.github.com%2Fopenedev%2F22b2d63b30ade0ba55ab414a2f47aaf0
> > [2] https://protect2.fireeye.com/v1/url?k=02c0a3da-634bb6e9-02c12895-000babff9bb7-8ed3eab856890e56&q=1&e=efefced1-2052-43c5-834f-b50867c29e3c&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v5
> > [1] https://patchwork.kernel.org/project/dri-devel/cover/20220829184031.1863663-1-jagan@amarulasolutions.com/
> >
> > Any inputs?
>
> Just to make it clear. Like I already pointed [1], this version breaks
> Exynos boards with DSI panels. Either the patch #1 has to be dropped to
> keep the current hack (the current code changes the bridge order to
> force proper pre_enable calls) or the Dave's patches have to be applied
> first [3].

Yes, I understand overall. Working on checking Dave's changes in the
Allwinner DSI host. If it doesn't impact it I will send next version
by including Dave's patches.

Thanks,
Jagan.
