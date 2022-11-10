Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226B3C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 17:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiKJRhn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 12:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKJRhm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 12:37:42 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D084819C39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 09:37:41 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id r2so1349142ilg.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W70VhU4UmtkfhYe6LcJTIV91uyNsXWZMqQbzBIL/iIo=;
        b=B0L/L115Lg2iNNoAwkSzKmtGvnFGkjsMmGulxTnWcGEj+d0eZgKD+IdBPGLANc5byZ
         HrGvWr4laXLkCCDxaXq5CHW41Q+f7Ix+HSnYIC70VVWkF0AO2XjMqT9njsp6fQ4HtvgK
         er7Cqkn972kHAArcC78G/VtVo1Zdta+cWiqA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W70VhU4UmtkfhYe6LcJTIV91uyNsXWZMqQbzBIL/iIo=;
        b=1aGGxgOB1GoM/zFNsqW3neqoeSxpORsvhU5vN0j8jsk7XdyGZH6S0y2hCk5Zi5aKjF
         OHxMLTHSLK4ATUYss0Gji9JNb2J4NWj5s6s5CrddzMjvAEF0MbOgY5YLkAH2YJ0k/s/B
         gG+SEiCl4lAOaOyoiUXcJOF1XG98ld5azXh5pkgtjOU2y+Dt876BpzPncQLnGiY5Jw15
         Ey8b3mTnKU2ScvP6N92Iojfj2GFeJ5IWBMFAJj3QjwP6sKxpeR41pHejQi0+DY/WZVSd
         FhKMY5TpfIG0ScjyX2U46DjgzXjy2TEJM3Zz+1kaw7WOvuGB7J8532HJgbg6h7SP0kkp
         A9bQ==
X-Gm-Message-State: ACrzQf01LEDLX8v3GjZmCibcMMZg2161Ab8vzbrzPgxgzNBH2XV+HhcV
        4+mnJ4C/qkKqNsAjCHLw0TTZh6yIjI4+YlZ0kKMXgQ==
X-Google-Smtp-Source: AMsMyM6XyEdsXU2nFmT/1CwysC/chyHNqPpPCI/YoB+liihMr9GQ5b36r7Cjw2mCudTxJTtErd/nDVXb9BekUTKvBOU=
X-Received: by 2002:a05:6e02:1108:b0:2ff:e796:926 with SMTP id
 u8-20020a056e02110800b002ffe7960926mr3224282ilk.216.1668101861150; Thu, 10
 Nov 2022 09:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de> <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
 <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com> <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
In-Reply-To: <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 10 Nov 2022 23:07:30 +0530
Message-ID: <CAMty3ZCLZKDnmG3XdxidKPNYLieoxUqW0or3RTWO3EW0NAiTSA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Marek Vasut <marex@denx.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 10, 2022 at 10:29 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 17:03, Jagan Teki wrote:
> > On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
> >> <frieder.schrempf@kontron.de> wrote:
> >>
> >>> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
> >>> and a Jenson 7" LVDS Display.
> >>>
> >>> Thanks for your work, Jagan!
> >>>
> >>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
> >>> i.MX8MM
> >>
> >> As this series has been successfully tested on multiple devices, is it possible
> >> to apply it so people can make further adjustments?
> >
> > I think the next version patchset on this would be clean and properly
> > address a few comments from Marek Vasut. However, I'm still waiting
> > for Marek's response to my comment on the input bus formats - if it is
> > Okay I will send the v8.
> > https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/
>
> Just send a V8 and let's see how that looks, no need to wait for me.

Planning to include your 8M Plus patch as part of the v8, hope it's fine?

Jagan.
