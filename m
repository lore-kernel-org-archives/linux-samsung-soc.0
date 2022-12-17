Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B7AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 17 Dec 2022 23:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiLQX4H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 17 Dec 2022 18:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLQX4G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 17 Dec 2022 18:56:06 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7D16254
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Dec 2022 15:56:01 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8EF3084E00;
        Sun, 18 Dec 2022 00:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671321359;
        bh=YpZS1ns9pVAU5zdqUP1BDnFCeodWolhHYN3UlqXEoLg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=J58XtUIvvzoIrDrHnEoSOnuxru2UtHXpJv2uJGipyPOavKIfDSJVrHU6yQSkK8MFc
         SnE/2Ti0mPr2pqS0WMwEqc+8fC4woFMSHAN6lKrD0WVwa9WWNr1tpp2lggfM7eWiJc
         IuLxmZhmlrGPQgamroh7HVX4OHejjsBTPmRjRTPMvciCoc9azgm7rdSRQn48k4Lfns
         ipQpC1198dXbMCSGyYy6rFNODXuT0JRc1Z9LQRl/1IjDXJq7F+V3A2YYxmgYgQyb70
         ElwFUG1JLFOwx4BSSe610EJWGyzTtVqHynJEWM/msfusZK3J0NGZPsZO5dnDSxiMBM
         4ZPsWyZ4gQxKg==
Message-ID: <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
Date:   Sun, 18 Dec 2022 00:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Alexander Stein <Alexander.Stein@ew.tq-group.com>,
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
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jagan Teki <jagan@amarulasolutions.com>
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/16/22 14:25, Alexander Stein wrote:
Hi,

[...]

> Oh, nice, thanks for the pointer. When setting
>> samsung,burst-clock-frequency = <668250000>;
> in imx8mm.dtsi
> I get a non-flickering display using 4 lanes. Although admittedly this is just
> random guessing. I'm not sure which clock exactly has to be in the range
> CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for
> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250, esc_clk
> = 16706250

If I recall it right, minimum PLL frequency is:

fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz

the link frequency is then

fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)

So DSI83 should be in the range of 80..85 MHz input clock if I calculate 
this right. Can you check what is the value of mode->clock, the 
mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83 
sm65dsi83_get_dsi_range() ?

> AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT
> properties, while SN65DSI84 is using display mode and number of lanes.
> 
> Is it expected that the DSIM PLL frequencies are set in DT for a specific
> bridge/display setup?

No, there should be negotiation between the host and bridge/panel, I 
tried to propose two variants, but they were all rejected.
