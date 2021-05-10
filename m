Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F03C43460
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 May 2021 16:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BF2A610F7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 May 2021 16:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhEJQVd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 May 2021 12:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhEJQVb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 May 2021 12:21:31 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F98AC06175F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 09:20:26 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id 69so4777241plc.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fWnbepkZzpOXZd5Aej2WwUh93xVx+Nhqui+NqMG42w=;
        b=eJUsSClChBveOTjxjQQ+bmWoecQYo3UAy1n/6GJMl++HeGQLcRlhEyapA7XW4zlZdQ
         YcsqGGsw4lOSRL5K0tBy+ZOjY6aWUCsv0iw92e9cdh0phgkSpdLoZrEsREIIlmd3KDzf
         2tY6aRxMKHQuS/YZL//pd5Yv2E+N09/DaIb7ZM5BngZDdxGQnJOTF75kHn8S0wfrs72J
         Y85sJ/cSWK+HNJUsrpydfTgc/bTTDFFnEK86hwnKi3P10Zj3GkIxq0RFclaq2orhjr8O
         BI/BLnaeXl1XcgJwHC5QB35X55iE8cdnkbfuFDbPvpny53P6kpfhSCGJigsq0Y6yKJVG
         Pv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fWnbepkZzpOXZd5Aej2WwUh93xVx+Nhqui+NqMG42w=;
        b=YITFu0g2k47xdpyJuwTz1yniuZ+ixJZpy3Of/YOFqbTYREcx2922dg6nF16xbaDu/s
         MzIZUMFnvpqiGkbZzid2dmAZdcLUdxCksHZgOR3pfOPmzZ/AAohufI0iz/Ywttkyuno0
         tZYVBNlfiNx1RYSkTbM/kzrVjw5wtLCV0Ed2wZUiZfkiEnSc5S9A/A1PBt0Ktujts/jh
         qFiN0tbokvAcfeMWbjk2ixz7ygGDgVu+fxySMIT4cFHPCKcNbn8Byja31SNG8sjeAkX1
         aFgjckydVPxZou1zXJ4yE/j8AzsUC0fPZqYEz3UAghTm7IAgaqOnA4+dyTcIfqShuAKm
         q2qA==
X-Gm-Message-State: AOAM5334TqBbaQzvzmlPq4wZ3re7jAyDU0jOKZoOBEvS6OEV9HZDrG3v
        S2HS7LzlWglDKRnFM/yUpfvO6l3adIIeLTZ/ebUa2w==
X-Google-Smtp-Source: ABdhPJxUc61uV0PzwOO5GQyXabJ7EkGoObQ6Q+wiAfx+OxvyUE0V+UlwJ9niWyall6JkUFyEFsvYwXMSThRrfKTSX40=
X-Received: by 2002:a17:902:d2d2:b029:ee:fb71:c05e with SMTP id
 n18-20020a170902d2d2b02900eefb71c05emr25806031plc.13.1620663625728; Mon, 10
 May 2021 09:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201005134250.527153-1-marex@denx.de> <20201005134250.527153-3-marex@denx.de>
 <CAHCN7xJtnYHvLWkawYpi=BYbtfSrvHnNzqp767rOZjOGsAJV=g@mail.gmail.com>
In-Reply-To: <CAHCN7xJtnYHvLWkawYpi=BYbtfSrvHnNzqp767rOZjOGsAJV=g@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 10 May 2021 09:20:14 -0700
Message-ID: <CAJ+vNU2GU=dYznHjYvhWqS9fFssesj_Bg8HBW0891mcBB6WhvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] drm/exynos: Add basic i.MX8MM support code
To:     Adam Ford <aford173@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, May 10, 2021 at 7:12 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Oct 5, 2020 at 8:48 AM Marek Vasut <marex@denx.de> wrote:
> >
> > This adds basic i.MX8MM glue code for the Samsung DSIM PHY.
> > There are still a couple of items which need to be sorted out
> > in drivers/gpu/drm/bridge/samsung-dsim.c before this can even
> > be merged, specifically:
> >
> > - The dsi->out_bridge is not populated until samsung_dsim_host_attach()
> >   is called, however samsung_dsim_host_attach() is not called until the
> >   next bridge attaches and calls mipi_dsi_attach(), and that only happens
> >   after the DSIM calls drm_bridge_attach() on that next bridge.
> >
> > - The samsung_dsim_bridge_mode_fixup() is needed for iMX8MM LCDIF to set
> >   the correct sync flags. This likely needs to be done in the glue code.
>
> Since you asked for an RFC, I
> I applied Michael's series and this series to 5.12 since we are so
> close on having the blk-clk and the power domain stuff working.  I
> also tried your patch for the ti-sn65dsi83 and the adv7511 on the
> Beacon imx8mm development kit.
>
> In both the HDMI bridge and LVDS bridge, I am able to get the modetest
> and drmdevice to return data that looks valid.  The resolution and
> refresh look correct, but I am not able to can an actual image to
> generate out to either the LVDS or the HDMI.  I am able to get the
> image to appear using the NXP kernel with the ADV7511 HDMI bridge, so
> that leads me to believe there might be something wrong with either
> LCDIF or the Samsung DSIM layer code.  I am guess it's the Samsung
> DSIM stuff since the LCDIF has been around for a while.
>
> I am not particularly well versed in the video world, but if you have
> something you'd like me to try, i am willing to try it.
>

Adam,

Try the patches Frieder had to make for his display from his git here:
https://github.com/fschrempf/linux/commits/v5.10-mx8mm-graphics.

I found I needed these for the display I have:
drm/exynos: Fix DE polarity for usage with LCDIF encoder
drm/exynos: Fix PLL PMS offset for P value bitfield

Best regards,

Tim
