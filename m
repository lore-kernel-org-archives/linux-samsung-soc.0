Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60D6ECAAD2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiH2SbI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiH2SbH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:31:07 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF2E6D568
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:31:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id m1so11262956edb.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0apWzmbxZ6VSMOSdxKLI7EIdOM+xw2GQX81OaATu8Xk=;
        b=VQm2vxWIVG7VhOXm+l44OyLuO1EGS2doyKKeO+pYoldh+F5GQvYH+xdT6VQwFrTLK7
         9+p7YwwPXammzdBtQTFvM04ovVkcdB9vAteGSZDSyH+WsVg1uvfVvn5kOi0Hp5EqWurs
         ZVj0xlbW+Bpo7kr0mJHWYY32+JgIhit+X1/Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0apWzmbxZ6VSMOSdxKLI7EIdOM+xw2GQX81OaATu8Xk=;
        b=yO9P7Yj8Hxt9wVKYTZ540mtxQCLpskjxwepjpTkmmKa+ufJl+UppweLujCzbDL6ez1
         O1uceWLDas4oJY9B1UEA16gcXASAlQCNGZBiNsQjFmMgahU/M9JummGqUp7oAXM2Rs7/
         OUBHM2cO85a9EP2foQuKf9zFmVjELibRH7+SyQH5gB/RCGgMx3uupuXTzBQbKWT0+AIK
         KLfeYiwJ2GwJYmXwqrwPaLdQZtHUV7dYmN65WsoJh4L91mKBRJnbkl41DwigRNSJFJ3p
         nU4+qJjpLsQ2+wBCWbhS8De3YVgeCV69EWxCBG2Mo8BkHWaFwu5YDbu1nEIIu69BnIYB
         fpHA==
X-Gm-Message-State: ACgBeo0JYVk2BZ6Kw7otubj3v19hCM2e1K0hYsWtVRPdWA+vnoTIfz60
        +fJbF04636RpEP7WBwMtC/GSbakIE3IPuAKglRpOpw==
X-Google-Smtp-Source: AA6agR444uPYW0vCPhT+kHRjNy4qs7ja3fkxUys6kNXipAnb61aEE8/q1huyMzG1RZWXLvlDG7gao1/Wl3uyjiJsD8o=
X-Received: by 2002:aa7:cdc5:0:b0:447:91ef:a3cd with SMTP id
 h5-20020aa7cdc5000000b0044791efa3cdmr16933133edw.168.1661797862702; Mon, 29
 Aug 2022 11:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com> <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
 <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
In-Reply-To: <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 30 Aug 2022 00:00:51 +0530
Message-ID: <CAMty3ZC0pfwHff8Q0Dhh5iyipVmYVo3Gb6zEgEh7x9hQcK=oJw@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
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

Hi Dave,

On Fri, Jul 22, 2022 at 9:35 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan and Marek.
>
> On Fri, 22 Jul 2022 at 16:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > On 20.07.2022 17:52, Jagan Teki wrote:
> > > Host transfer() in DSI master will invoke only when the DSI commands
> > > are sent from DSI devices like DSI Panel or DSI bridges and this
> > > host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> > >
> > > Handling DSI host initialization in transfer calls misses the
> > > controller setup for I2C configured DSI bridges.
> > >
> > > This patch adds the DSI initialization from transfer to bridge
> > > pre_enable as the bridge pre_enable API is invoked by core as
> > > it is common across all classes of DSI device drivers.
> >
> > This is still problematic in case of Exynos. Without a workaround like this
> >
> > https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961
> >
> > the display on the all real DSI panels on my Exynos based boards is broken.
>
> I'd queried on the other thread trying to address DSI operation [1] as
> to whether the test for STOP_STATE (presumably LP-11) at [2] was
> actually valid, but had no response.
> There is no need to check for bus contention at that point, but should
> it happen the driver doesn't write the registers in lines 862-868
> having returned -EFAULT at line 853. The controller is therefore only
> partially initialised.

Can you link me if you have any updated series on this? or the
existing one is the latest one itself?

Thanks,
Jagan.
