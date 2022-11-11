Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DE6C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 12:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbiKKMM5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 07:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbiKKMM4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 07:12:56 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DDE64FC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:12:55 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id o24so1165512vkl.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+bqRX/1AGL3Fy1iw8VYJyV8azK5p+mNvSynHj9OnX4=;
        b=RYKtB5c1TQD4IZCuBjyXdrjPhoWA6iK+klMuG+68e8aVi+Vh+1VtMg5I7NE4phkWdW
         wV/TTQipXQd+kbpMWSFzW9bjPuo8xRXEVv6kiUn0zBeb1BBLivyu6kIZDc3Xxuk6sZUY
         5Ed1Twx1j9Yfl03hhHTQds/4q4dc/iTJmUWeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+bqRX/1AGL3Fy1iw8VYJyV8azK5p+mNvSynHj9OnX4=;
        b=MY+ebKl+tV0b5utS6WnL5nyLodg3ElH8/b5LRmpwSnYQUeSzkC0wHaUf3tffKAW0tm
         wY9AppJXyJP/FpwwXSMXMLtYozlTjAKWDmQvYUXH26udOHddx6UWFhOHxOZDGoiiCchG
         n6ueoKmR2Sgqfwv0acVl0wVzbhwRAeu+MRmrwFElb/njh7urn2XTmktlXWxRWlAartAh
         TZpTJ136Zb7HCOp+UacKUfMGv7jlrUq3K0xdGsBlOwmDVTLzPEN48CbjEjtRLopl0nek
         HRkXRJGpGB0TC4V6J4PYwtXeD+Agn6PkeUdM3SA6RilR15TM/AJFNpBuvs03wV6PyOcd
         Ei5w==
X-Gm-Message-State: ANoB5plB79bdQ3r3IMNrAVHYqCqXq/9DLl/EomQiOzif44Jvoo+kbWhO
        NNo0/R7dHgwCJQH9pbQkHp6xOeyFofb7wuk33KV0yw==
X-Google-Smtp-Source: AA0mqf6io/7aUf/ki3e5SFEAWsCBMKBT/LHbJFo0J5p5HR4Eh+bQBCLzYTJ+DCuZyb88MV2zAsE1kwMiUGly43OvF4o=
X-Received: by 2002:ac5:c385:0:b0:3b8:4e2b:4540 with SMTP id
 s5-20020ac5c385000000b003b84e2b4540mr729215vkk.26.1668168774665; Fri, 11 Nov
 2022 04:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com> <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
In-Reply-To: <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 11 Nov 2022 20:12:43 +0800
Message-ID: <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
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
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 11, 2022 at 4:49 PM Jagan Teki <jagan@amarulasolutions.com> wro=
te:
>
> On Fri, Nov 11, 2022 at 6:19 AM Nicolas Boichat <drinkcat@chromium.org> w=
rote:
> >
> > On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.com>=
 wrote:
> > >
> > > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > > 0 =3D Enable and 1 =3D Disable.
> >
> > Oh I see, that's confusing... IMHO you might want to change the
> > register macro name... (but if that's what the datasheet uses, it
> > might not be ideal either). At the _very_ least, I'd add a comment in
> > the code so the next person doesn't attempt to "fix" it again...
>
> 02/14 on the same series doing the name change.
> https://lore.kernel.org/all/20221110183853.3678209-3-jagan@amarulasolutio=
ns.com/

Oh thanks I wasn't cc'ed on that one, makes sense.

You can add my reviewed tag to this one, as my HSE comment doesn't change t=
his.

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

But please double check HSE.

>
> >
> > BTW, are you sure DSIM_HSE_MODE is correct now?
>
> Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymanski
> initially observed this issue on the imx8m platform.

I'll repeat, are you sure about HSE specifically? You invert the
polarity for HBP, HFP, and HSA, which makes sense given your patch
02/14.

I'm concerned about HSE. Is the bit really a disable bit?
MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
should not do `reg |=3D DSIM_HSE_DISABLE;`, probably.

Thanks,

>
> Jagan.
