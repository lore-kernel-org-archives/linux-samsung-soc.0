Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE50C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 May 2022 07:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbiEEHml (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 May 2022 03:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbiEEHmk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:42:40 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F7648E7A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:39:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id p18so4213172edr.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 May 2022 00:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6iJR95dCQe/jE0fXiwNw2SOTk6uzj9U7Yx5URoMZENE=;
        b=AwyRT/doF7/LoEqyDAqRtTknqtYm95ElPBpWm5pUuA7wYZojLPCMvxY2e//0vODY7i
         pX0Dqa4zoUz5jGx1SCeL91ePGCEHgwOETzzE89X9pU+qUgdptb9t0zDZQRbm0vDMwCpR
         wISZk5oDQSSDPzRITYJoPV00xG2HM2AC9d4kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6iJR95dCQe/jE0fXiwNw2SOTk6uzj9U7Yx5URoMZENE=;
        b=r7HlsyUGNkTzZPyZzx8dNv25ATZTpKarHpK1VoiB12onRrocEolnrMXRvi+yFoxrkM
         +ikO/JtRE7vdASiFnpvm+vexiogW2cwRfaGiv/s+kDjk8qyU3IQ5lCey29ZYk80VADe/
         pts9vgmALXXgpO+pRMVha/mDqQSzoSCJJAZSGJuPtytQsBc8+LwlfPv6PIc1CaN/KmKo
         TsU33+1l3feJ2j/QMYgviMwBkLwlwhSzoXD1gl7bGYMk3pbGpxWS4a7O0ewWyvLeYMVt
         OYiyET219vCxz5mDG7TXcaCGZ1mBrdcQ5tjERrRZCXYJpOneB7O4bs8TkCFWcxovJDZF
         DKtA==
X-Gm-Message-State: AOAM533M2twAIci2zf0a96cPFl2ssoPZoAJF3fDnUbXfVarrJjMaIV7u
        ENwK7DmG23GoXwvQljGcAl/re0+J19ta65K+jWSD1w==
X-Google-Smtp-Source: ABdhPJyEAFkfvN4dY2ZtOBeJ5gS6IRtgCLf0IefxhbigcnBcWZluCmsWpdXMGbgxLKiinLPH8EQgyPXX/A0voLDHtJc=
X-Received: by 2002:a05:6402:370b:b0:41d:8508:20af with SMTP id
 ek11-20020a056402370b00b0041d850820afmr28543149edb.16.1651736339766; Thu, 05
 May 2022 00:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com> <2184168.iZASKD2KPV@steina-w>
In-Reply-To: <2184168.iZASKD2KPV@steina-w>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 5 May 2022 13:08:48 +0530
Message-ID: <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
Subject: Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, May 5, 2022 at 12:57 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hello Jagan,
>
> thanks for the second version of this patchset.
>
> Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > Previous v1 can be available here [1].
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > On, summary this patch-set break the entire DSIM driver into
> > - platform specific glue code for platform ops, component_ops.
> > - common bridge driver which handle platform glue init and invoke.
> >
> > Patch 0000:   Samsung DSIM bridge
> >
> > Patch 0001:   Common lookup code for OF-graph or child
> >
> > Patch 0002:   platform init flag via driver_data
> >
> > Patch 0003/10:  bridge fixes, atomic API's
> >
> > Patch 0011:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0012:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Anyone interested, please have a look on this repo [2]
> >
> > [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2
> > [1]
> > https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.184583-> 1-jagan@amarulasolutions.com/
> >
> > Any inputs?
>
> I was able to get my LVDS display running using this driver and an LVDS
> bridge. Actually my setup is similar to yours. My chain is like this:
> MIPI-DSI -> sn65dsi83 -> LVDS panel
> I noticed some things though:
> My setup only works if I use less than 4 lanes. See [1]. When using 4 lanes
> the image is flickering, but the content is "visible". Your DT has only 2
> lanes configured, do you have the possibility to use 4 lanes? I have no idea
> how to tackle this. It might be the DSIM side or the bridge side.
> Apparently the downstream kernel from NXP supports 4 lanes, if I can trust the
> config. I have no way to verify this though.

What is dsi_lvds_bridge node? have you added your dts changes on top
of imx8mm-dsi-v2 branch I'm pointing it.

I will check 4 lanes and let you know.

>
> Another thing is I get the following warning
> > sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check output
> bridge driver. Falling back to SPWG24.

This couldn't be much affected but will fix it.

>
> This seems to be caused by a wrong bridge chain. Using commit 81e80429 at [2]
> I get the following output:
> > bridge chain: /soc@0/bus@30800000/i2c@30a40000/dsi-lvds-bridge@2d -> /
> panel_lvds0 -> /soc@0/bus@32c00000/dsi@32e10000 ->
> Which seems weird. I would have expected something like
> dsi@32e10000 -> dsi-lvds-bridge@2d -> panel_lvds0
> Do you happen to see somthing similar? But this is completely unrelated to
> your patchset though.

Can you share the link to the exact commit?

Thanks,
Jagan.
