Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850B0C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Dec 2022 22:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiLRWZL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 18 Dec 2022 17:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiLRWZK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Dec 2022 17:25:10 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB89265A7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Dec 2022 14:25:08 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id d14so3945143ilq.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Dec 2022 14:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJn2MDoU1A6B7Lh1bcBEabZYUhEnRMX2vIfDQug5IOE=;
        b=Wfqz0RGW1s2n8bYaCllv2CAZHC7aVJ5xeadi5FHlv9dAYKqxLwWgudLWUfoIDn+MwV
         rbcGsbPMM2boqBYoJkXW65r3mkvYbKIMM38oPqM98fnuXS2n0wVlsl8Bu+JNeWJ3oDf/
         5n9Az8E89p8tkGLzw4jQu3j3iq+h9kxkcQXfT/4+/itOPvKz6+Bj2LPGUHYCekBv3jJq
         Lh6/Sk+cTcUEt5maOyRighUaogJb6Z5C9/ssaL+Knl7zr2V7nNbqs4mjlCJT5sZBmzvY
         IDC0//m+VsFRKMHSccffGUoFCUMdKXjThDKVeSmdBVP1yHG6KpPbKVEFEP5z9MIT5y8R
         9RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJn2MDoU1A6B7Lh1bcBEabZYUhEnRMX2vIfDQug5IOE=;
        b=AXAXOnrudlzvBZ3MRUS5mO5YNON+BIDLXfdRNAy9wYJ17YHgCJGhjHomCplOZNxyCu
         ynnNOVjW1a1y/c3g5EBx1J7cdODqMGShz7c20eqmfo5JMv0DYRtV+j5oIjPKwnEs8e6O
         WEjgLQ4m4pvLLMN3IBPgDwMj3AK/1w3oP5Z6rvL+IqMT3is6Aj4rrc//+4xCqaVbg3fj
         econ8+ilyjKHyUSw9M3+y7ztNoX4yw46odVUI6vv4Zg7IRIQssYSEgm1Lee82rZC7UYF
         nidq1SO3DoYqbTaJ62+w1eGVwpSRKyIH0TSsLptLVG2OyRnftPwvryfP1GL2Ob9ti05s
         DREQ==
X-Gm-Message-State: ANoB5plhF1jTAt14KjYm9LCZs4mgDnwJrX5zZ4iOAS/lz5ve5PxOfwDQ
        XlBQT3y1DTrXq7LhO6iwGA46QpVKz2T/jrt7g9U=
X-Google-Smtp-Source: AA0mqf4139X6E5YCfqSa1dFv3iMzX45chU56RHC5NfLSaaNKXCS6qvx2wXaFtKEqa6EaIpzDZStYGu6vri8b/1sOE0A=
X-Received: by 2002:a05:6e02:1d84:b0:304:ad4b:974a with SMTP id
 h4-20020a056e021d8400b00304ad4b974amr2379205ila.93.1671402308085; Sun, 18 Dec
 2022 14:25:08 -0800 (PST)
MIME-Version: 1.0
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de> <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
 <8e5755da-db8c-7169-b140-d5f964f34a86@denx.de>
In-Reply-To: <8e5755da-db8c-7169-b140-d5f964f34a86@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 18 Dec 2022 16:24:57 -0600
Message-ID: <CAHCN7xL1qqhFkroBUswpSyTGUFo6B26rmp0zRL2K8ATT4HtUGg@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <Alexander.Stein@ew.tq-group.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Dec 17, 2022 at 10:33 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/18/22 05:23, Adam Ford wrote:
> > On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/16/22 14:25, Alexander Stein wrote:
> >> Hi,
> >>
> >> [...]
> >>
> >>> Oh, nice, thanks for the pointer. When setting
> >>>> samsung,burst-clock-frequency = <668250000>;
> >>> in imx8mm.dtsi
> >>> I get a non-flickering display using 4 lanes. Although admittedly this is just
> >>> random guessing. I'm not sure which clock exactly has to be in the range
> >>> CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for
> >>> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
> >>>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
> >>>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250, esc_clk
> >>> = 16706250
> >>
> >> If I recall it right, minimum PLL frequency is:
> >>
> >> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
> >>
> >> the link frequency is then
> >>
> >> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
> >>
> >> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
> >> this right. Can you check what is the value of mode->clock, the
> >> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
> >> sm65dsi83_get_dsi_range() ?
> >>
> >>> AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT
> >>> properties, while SN65DSI84 is using display mode and number of lanes.
> >>>
> >>> Is it expected that the DSIM PLL frequencies are set in DT for a specific
> >>> bridge/display setup?
> >>
> >> No, there should be negotiation between the host and bridge/panel, I
> >> tried to propose two variants, but they were all rejected.
> >
> > For one of Jagan's previous revisions, I added some code to let the
> > PHY auto adjust the frequencies instead of being fixed.  NXP had this
> > in their downstream kernel, but with this patch and another, I was
> > able to set a variety of pixel clocks from my HDMI monitor and my
> > DSI83. I haven't had time to re-base my work on Jagan's latest work,
> > but you can link to the patch I did for the older stuff here:
> >
> > https://github.com/aford173/linux/commit/e845274b0f22ba3b24813ffd6bb3cb88ab4b67e4
> > and
> > https://github.com/aford173/linux/commit/3f90057eb608f96d106029ef639813475241936f
> >
> > I've been traveling a lot lately, so I haven't had time to evaluate
> > his series, but I hope to get something like those re-based once the
> > DSI stuff has been accepted.
>
> I have these two attempts, both rejected:
>
> https://patchwork.freedesktop.org/patch/475207/
> https://patchwork.freedesktop.org/patch/496049/

I have some patches re-based to Jagan's latest branch.  It doesn't
impact any drivers other than the new samsung-dsim driver, and it
doesn't touch any of the drm helper functions either.  It adjusts hs
clock based on the connected device.  I am not sure what the impact
will have on the attached Exynos devices, so I am expecting some
iterations.  Right now it's working with my DSI83 chip, but I need to
get it working with my adv7535 part as well.  On the older branch, I
was able to sync the ad7535 with a variety of resolutions using
different pixel clock rates.

Once I get it working again with my adv7535 and cleaned up, I'll
submit the patches to the drm group, and I'll CC you, Jagan and Marek
Szyprowski with a reference to Jagan's series so people wanting to try
it can apply it to his branch.

adam
