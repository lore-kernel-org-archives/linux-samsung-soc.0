Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8406C0502C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Aug 2022 14:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiH3OY1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Aug 2022 10:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiH3OYX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 10:24:23 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8720711C140
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2022 07:24:21 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qh18so2246402ejb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2022 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=A9MdfBpTYZweRzcx0dE2DjVkPmCEU7qIzUPOygK0u3Y=;
        b=PrJpNjXxS/kHCmg3zADO3pAI+WRrI0XP21sq/wz47VAQ12xjjbncXLYGJX1VNayTfP
         E44HTE0ac5ORJCWKKgbbUJEzGDuioC/WEw2weUoosz7sWiz47vB/VI1XZgE3T3WirnPy
         sVnkKTRtZs2v4sna9FAaGbnbeBiraaCXZKNxa4487kpet5gJlU0ad7Ws8PUcXUOZBLxj
         feLvciPzn4g4AzPPjpp2G4tH2l/pXRCEggUv05W+qHGFmpL2bDDY4MMr6de6HeSqxcur
         5+6ZATGsB5GGFFzm+6Elb/j2UELv3Fj2GK9JpUaGgbDb1LRVbr50yklz3qUyCZkXndcI
         GQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=A9MdfBpTYZweRzcx0dE2DjVkPmCEU7qIzUPOygK0u3Y=;
        b=2zWtb2yTPEhDu7UqQiZ+bYO3lI/0L7Af4x8xWKnMuNFyQpF1wFZ7MycotNDXVsquAS
         pc6Ys5AGV4fUgK6C0345ktATezeUQlk1jvl5oeXqHjJk1fAxiLQYInEzQturpY8lXtxL
         Ql1Rk1+dyk1ulEoQW5Z7EkDpnDJurIFkhv7/0Daw487j9IDbiitdryH6w9d0USta5nWx
         FOrqTbfkCu6O5i19z50m1JnfEq5n++y1hppRXvcfjXjtWFZIpXe/UnjwP3bGxpLnd4Tl
         lewunpSzeQgMMmLaJp8hi5d4w6DsghP36tPNuYqbS1XwVqgF+DzdZnhODc49FfoLHqX2
         3u8g==
X-Gm-Message-State: ACgBeo0xGVLm9AiJQaGZxEErf8dKGT5xpFySG34dPd7eN9yQPy4G5nd5
        GWK9et/Ns/6o1pudpr4X6Bigzcm1YubhFjDrlrOiCQ==
X-Google-Smtp-Source: AA6agR6rk/3ZCEAGhGdlEIe1iBV/6Pk7Zr4lQyB2xbohhGWKkJSMTywMD4pMVUuVfGgD/C21Z09ZtrsmM/DDKQ/lUnY=
X-Received: by 2002:a17:906:8a74:b0:73d:d6bd:660b with SMTP id
 hy20-20020a1709068a7400b0073dd6bd660bmr16584196ejc.200.1661869459972; Tue, 30
 Aug 2022 07:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com> <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
 <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com> <CAMty3ZC0pfwHff8Q0Dhh5iyipVmYVo3Gb6zEgEh7x9hQcK=oJw@mail.gmail.com>
In-Reply-To: <CAMty3ZC0pfwHff8Q0Dhh5iyipVmYVo3Gb6zEgEh7x9hQcK=oJw@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 30 Aug 2022 15:24:04 +0100
Message-ID: <CAPY8ntB3WwwWBLrJ9T_Zxc=K1PidmJo1pKYQP8UoeFaG0iuh_A@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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

Hi Jagan

On Mon, 29 Aug 2022 at 19:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Dave,
>
> On Fri, Jul 22, 2022 at 9:35 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jagan and Marek.
> >
> > On Fri, 22 Jul 2022 at 16:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >
> > > On 20.07.2022 17:52, Jagan Teki wrote:
> > > > Host transfer() in DSI master will invoke only when the DSI commands
> > > > are sent from DSI devices like DSI Panel or DSI bridges and this
> > > > host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> > > >
> > > > Handling DSI host initialization in transfer calls misses the
> > > > controller setup for I2C configured DSI bridges.
> > > >
> > > > This patch adds the DSI initialization from transfer to bridge
> > > > pre_enable as the bridge pre_enable API is invoked by core as
> > > > it is common across all classes of DSI device drivers.
> > >
> > > This is still problematic in case of Exynos. Without a workaround like this
> > >
> > > https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961
> > >
> > > the display on the all real DSI panels on my Exynos based boards is broken.
> >
> > I'd queried on the other thread trying to address DSI operation [1] as
> > to whether the test for STOP_STATE (presumably LP-11) at [2] was
> > actually valid, but had no response.
> > There is no need to check for bus contention at that point, but should
> > it happen the driver doesn't write the registers in lines 862-868
> > having returned -EFAULT at line 853. The controller is therefore only
> > partially initialised.
>
> Can you link me if you have any updated series on this? or the
> existing one is the latest one itself?

I've not updated my patch set as I didn't think there had been any
significant review comments to action -
https://patchwork.freedesktop.org/series/100252/ is still the latest.

Sam had suggested changing upstream to prev/next, but seeing as no one
else has expressed a view on that I didn't see much point in
respinning. If others agree with Sam, then I'll do it.

Checking I do note that the suggested change to drop
drm_bridge_chain_* API has been done by Sam. I don't see that having
been merged, but once it is patch 1 needs to be dropped / reworked.

I don't have any Exynos hardware, so can't really help out on the DSI
issues there other than making suggestions by inspection of the code.

  Dave

> Thanks,
> Jagan.
