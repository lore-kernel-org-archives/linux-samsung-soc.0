Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14927C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 16:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiKJQDX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 11:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiKJQDU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 11:03:20 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC7A32070
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 08:03:17 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id y6so1556194iof.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 08:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RIxTRYd8LXmwSWWSkhggCPCFSFpw6CNw0xX91rswKjg=;
        b=BRbX2/V5HybGHHyn2aaIrJ51X6Xy2F1MOf4NAWdltjawfjvylCiqK0Dv9/NWVpG1DC
         LupQoAhjH5uv9xe5mNBHMyZKm/Inwxn+rul07Pi+Km6j/uEGSFxP5KpjjCZN7fW2DuCQ
         I0zQ05+1Jl4tjjmzl08dShWn0rIoHS/lRGpdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIxTRYd8LXmwSWWSkhggCPCFSFpw6CNw0xX91rswKjg=;
        b=lRWNIDedRqdwmTOwp54oE3S1Hvb7aPm13fDIJFCHw1dQfr9O0Oz4J1ou423nFe27PI
         MUUMEaScAmgysWrVk5zTeXaRy8M2k6cjjVcXKtMIbxflFFITTX52rSJu1c+8gJ2liVNP
         cYwiwj1R8LQGLJhgOKXl10kW9LRCuWkMxQ1nwbLyJYPYkggohnM+Cc9YOYvSMC1xhwp3
         1BNdLEi93s+88/hdKdHJ2G/vYKbEpq+OCUWo7P40zhwDT4PAWMJ4y/9sre9b3atg+AiK
         pFbWvTZ8NpDpWC3YvyaxV3Va++7yQff/u62ivgGlBFpbBZD3Ngvg9yO/P4qlF+jqhII6
         fvdg==
X-Gm-Message-State: ACrzQf0qx+ui7EAdBFm2UHR8kfwjnCmE9hlU2pYCcnq0p1btkepKuqCX
        U2BpZwnl5PidbDYGRTEALJZqwjHPj4uAUtI4aBW/Hw==
X-Google-Smtp-Source: AMsMyM4fDoK33KDDH0EOAkYrqGWWMRDg6cHZ6bI+cXayZHtFVq/RgBH7wHIQaOmyPCFA/9zQ1nbl9V4uV9ZqLXFF+8o=
X-Received: by 2002:a6b:6f19:0:b0:6c3:168a:a25e with SMTP id
 k25-20020a6b6f19000000b006c3168aa25emr2885739ioc.174.1668096197188; Thu, 10
 Nov 2022 08:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de> <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
In-Reply-To: <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 10 Nov 2022 21:33:06 +0530
Message-ID: <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Frieder Schrempf <frieder.schrempf@kontron.de>,
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

On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>
> > I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
> > and a Jenson 7" LVDS Display.
> >
> > Thanks for your work, Jagan!
> >
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
> > i.MX8MM
>
> As this series has been successfully tested on multiple devices, is it possible
> to apply it so people can make further adjustments?

I think the next version patchset on this would be clean and properly
address a few comments from Marek Vasut. However, I'm still waiting
for Marek's response to my comment on the input bus formats - if it is
Okay I will send the v8.
https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/

Thanks,
Jagan.
