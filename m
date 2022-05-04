Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0F7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 09:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347071AbiEDJVw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 05:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347082AbiEDJUu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:20:50 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AA425E89
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 02:16:32 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g23so971145edy.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=da581RkMgZGvhZwLWVEWYBqPGlo/ZQ+aiTnsSHDQZvg=;
        b=VUu1PeIZgsLWQZcfyMt3xaF/2RYXrlQGuhDH4eIiWDqVVEoCEJv7VFKQmEjhGWnr0j
         VwVv8xFU6m+oPpjMrEE1y//U9kJjmLj3lJ2ueVmrDm9Rfibh+aLxLljdfCS3GXnEmU0B
         08c6HRmDCXtvWoohmXgdEKKJ2jkxHi/f4Qf5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=da581RkMgZGvhZwLWVEWYBqPGlo/ZQ+aiTnsSHDQZvg=;
        b=IsikyK0fJ0j6iJqlH/5T2Yx/AOqvum7REjuOszb1U9TEOwPE5D+F+cCdM0rUVsLQZi
         /lckwLIHn/Uoo+3uKFouhE4aSNzyLn8yuX4ft0/aICTW5FSMUeOKOz8SXblG8n3vsKkR
         HZ8wbVc3MCKFrEnBl9ad+caB6q11+esmkaxX6FPBx1pG7t4OWwAmPLo2Z2gurdfyHF2R
         6dUgX2h16odprZMbf8jLl0fQfP5HWiu9bv7SJ6iE6j6+T+MrSGQaHyEqxZ+WUF5Ucijd
         ASMk/Na0TGJn8dX+47bXBnEgu63SWMDoOoCnEA4Zbxl01h4ntybnULYFD4nIcSu1VHJ9
         I6Rw==
X-Gm-Message-State: AOAM531Rj4OZxmXBYdBf8JikENo8mvM0cCA4aSoNgHe0VOqqDeAnTLR7
        6mCWbtfpOsb0YuhYuAn1B+rcF+UuKO2amIx3GCkclA==
X-Google-Smtp-Source: ABdhPJxPmefC2PO6Pp4JkUx8X+XPLZJi7VWWpgAVjdNtNFSLnP08fQm8AMIc2msy6Dv26Ew10hHVsT3InC1MV+jFK4g=
X-Received: by 2002:a05:6402:254a:b0:427:c112:6df9 with SMTP id
 l10-20020a056402254a00b00427c1126df9mr14754378edb.367.1651655790467; Wed, 04
 May 2022 02:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <CGME20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16@eucas1p2.samsung.com>
 <20220408162108.184583-2-jagan@amarulasolutions.com> <0146abe6-c588-820c-09f4-b12de2e734ac@samsung.com>
In-Reply-To: <0146abe6-c588-820c-09f4-b12de2e734ac@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 4 May 2022 14:46:19 +0530
Message-ID: <CAMty3ZBN=SPZze6n8=0hHPRc0jw6U+UJ7Ejv+8Bg3bkvwdY46w@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm: bridge: Add Samsung DSIM bridge driver
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
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Tue, Apr 12, 2022 at 3:15 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 08.04.2022 18:20, Jagan Teki wrote:
> > Samsung MIPI DSIM controller is common DSI IP that can be used in various
> > SoCs like Exynos, i.MX8M Mini/Nano.
> >
> > In order to access this DSI controller between various platform SoCs, the
> > ideal way to incorporate this in the drm stack is via the drm bridge driver.
> >
> > This patch is trying to differentiate platform-specific and bridge driver
> > code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> > glue code and samsung-dsim.c as a common bridge driver code.
> >
> > - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >    detach code along with conventional component_ops.
> >
> > - Samsung DSIM is a bridge driver which is common across all platforms and
> >    the respective platform-specific glue will initialize at the end of the
> >    probe. The platform-specific operations and other glue calls will invoke
> >    on associate code areas.
> >
> > Updated MAINTAINERS file for this bridge with exynos drm maintainers along
> > with Andrzej as he is the original author.
> >
> > Tomasz Figa has been not included in MAINTAINERS as he is not available via
> > samsung.com.
> >
> > v1:
> > * Don't maintain component_ops in bridge driver
> > * Don't maintain platform glue code in bridge driver
> > * Add platform-specific glue code and make a common bridge
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Well, it took me a while to make this working on Exynos. I'm not really
> happy of the design, although I didn't spent much time thinking how to
> improve it and clarify some ambiguities. It doesn't even look that one
> has compiled the Exynos code after this conversion.

Well, I was successfully built the each commit on exynos and non-exynos

>
> The following changes are needed to get it to the same working state as
> before this patch (the next patches however break it even further):
>
> commit e358ee6239305744062713c5aa2e8d44f740b81a (HEAD)
> Author: Marek Szyprowski <m.szyprowski@samsung.com>
> Date:   Tue Apr 12 11:30:26 2022 +0200
>
>      drm: exynos: dsi: fixup driver after conversion

What exactly it is fixing the existing conversion, could you point that out?

Jagan.
