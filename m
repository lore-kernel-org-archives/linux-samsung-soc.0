Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88310C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Apr 2022 14:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347344AbiDKOmL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347272AbiDKOmK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 10:42:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB46F14;
        Mon, 11 Apr 2022 07:39:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v4so5204269edl.7;
        Mon, 11 Apr 2022 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGN9dUJYj47JXi0a+41k06MGWJnJyWFM/qMvB07kZsg=;
        b=VxSsL0wEXbboLeOf2wmpHxXFgzdjwQ2liqKeQ0Wa8wPsAjiLD/84l8L8pNF/DdFI/P
         nEYEQgVyTR4y+ZFDUa7G7+w1548IZWDT6rfrXZiv6VC5kPRXRvqkqzBuntY0f45Mz8nr
         W8jV7goLTKnn2d9vYhj7DN1a6bxAMbkAFYfn+yNbCTDK8rwifQf0oKDBuj+sZoHEq59H
         pWHO+IyqQWm9MJ+WPQx75yGSCc42GEo3yPgQ6Dcm1GDOdz7WgUI5n0i9CodaajRSUaFJ
         PAduKSisg7qEozDjtk96LGac/tNitPOejdAFJAxgwlJ9WYQUST8JtCCbJnGgGbBjdzjD
         U+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGN9dUJYj47JXi0a+41k06MGWJnJyWFM/qMvB07kZsg=;
        b=1fFSB7z3EtFyYk7SUFaz4zQUYyRYzqfznibTTSQreFzOFI4s5NWHuyoCr8jpJALwuQ
         HkLrNX402+e2okCVmGSLLar7XDhKh3pbbjghVS+bdQ4Ru1pz4fL1rDIATUDd3kYhu4/l
         3jwhugHfqSYO1KHIVfAqWwxrFV0vu2oGQ9jANvKh/R8F9vGxYbJuICDAlLPkz6duj6PM
         uK6593wGlSLohjN26xB/SrnaqM6CY+UpjTSamR12ofDOd7Qy7CvPYwjGv5xGOq1v5M1S
         MYoEUhfzX9QQUIWahPHXfJzb0AR+mnB5vpyfLtLxEXyADV7kQn4ttjjpq0+00nFxGHLS
         0+DQ==
X-Gm-Message-State: AOAM5332adUbgycTB/9qXkZAEWwT30cvI2Dm+/EwPCMV53LlCJM2vXC9
        IdknWDjLti3T0l7VcaZvIvwxiyR1qPDpRBoi/bY=
X-Google-Smtp-Source: ABdhPJwwgcOrCgzva5OHLdgmGhUkVRkz1EOhBjroc03r3EyT8eRz+X7v727q27f23vS1qHhjpn/8fDRQ0xyrx+vrUSs=
X-Received: by 2002:a05:6402:2142:b0:413:6531:bd9e with SMTP id
 bq2-20020a056402214200b004136531bd9emr33389701edb.5.1649687994494; Mon, 11
 Apr 2022 07:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3@eucas1p1.samsung.com>
 <20220408162108.184583-1-jagan@amarulasolutions.com> <4c693c6e-512b-a568-948a-4a1af6a1313a@samsung.com>
In-Reply-To: <4c693c6e-512b-a568-948a-4a1af6a1313a@samsung.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 11 Apr 2022 09:39:43 -0500
Message-ID: <CAHCN7xK_H-nLA5Z6hJW5V0Bpo8bDKPU6UpN05kMBkG+PXmwBBw@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Apr 11, 2022 at 8:56 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 08.04.2022 18:20, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > Previous RFC can be available here [1].
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > On, summary this patch-set break the entire DSIM driver into
> > - platform specific glue code for platform ops, component_ops.
> > - common bridge driver which handle platform glue init and invoke.
> >
> > Patch 0000:   Samsung DSIM bridge
> >
> > Patch 0001:   platform init flag via driver_data
> >
> > Patch 0002/9:   bridge fixes, atomic API's
> >
> > Patch 0010:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0011:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Anyone interested, please have a look on this repo [2]
> >
> > [2] https://protect2.fireeye.com/v1/url?k=930e329a-f28527b5-930fb9d5-74fe485cbfe7-b0c53e2d688ddbc5&q=1&e=e6aa727d-5ae2-4ca5-bff3-7f62d8fae87e&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v1
> > [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
> >
> > Any inputs?
>
> I wanted to test this on the Exynos, but I wasn't able to find what base
> should I apply this patchset. I've tried linux-next as well as
> 95a2441e4347 ("drm: exynos: dsi: Switch to atomic funcs").
>
> Please note that pointing a proper base for the patchset is really
> essential if you really want others to test it.

Can you clone his repo and test that?  He posted it above.  I was
going to clone it at some point this week to give it a try.

adam
>
>
> > Jagan.
> >
> > Jagan Teki (11):
> >    drm: bridge: Add Samsung DSIM bridge driver
> >    drm: bridge: samsung-dsim: Handle platform init via driver_data
> >    drm: bridge: samsung-dsim: Mark PHY as optional
> >    drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
> >    drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
> >    drm: bridge: samsung-dsim: Add module init, exit
> >    drm: bridge: samsung-dsim: Add atomic_check
> >    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
> >    drm: bridge: samsung-dsim: Add input_bus_flags
> >    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
> >    drm: bridge: samsung-dsim: Add i.MX8MM support
> >
> >   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
> >   MAINTAINERS                                   |   12 +
> >   drivers/gpu/drm/bridge/Kconfig                |   12 +
> >   drivers/gpu/drm/bridge/Makefile               |    1 +
> >   drivers/gpu/drm/bridge/samsung-dsim.c         | 1803 +++++++++++++++++
> >   drivers/gpu/drm/exynos/Kconfig                |    1 +
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1704 +---------------
> >   include/drm/bridge/samsung-dsim.h             |   97 +
> >   8 files changed, 1982 insertions(+), 1649 deletions(-)
> >   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
> >   create mode 100644 include/drm/bridge/samsung-dsim.h
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
