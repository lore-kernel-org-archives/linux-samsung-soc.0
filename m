Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ACDC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 18 Dec 2022 04:33:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiLREdy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 17 Dec 2022 23:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLREdw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 17 Dec 2022 23:33:52 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0DE6438
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Dec 2022 20:33:47 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 445C584FF0;
        Sun, 18 Dec 2022 05:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671338024;
        bh=xl5fwpWRgAQn71M4HvR9Nz3egzzwDH+/7CfV7rmmBGI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VwfT79qfAunozDzZ+HWZ88MFgwG+f/TcO0TLzKRH1hDz9VBfaISSFkqn54UqCqxph
         Dh18LcID5gBIeZiFBeOKS6uv22SkhRetA4g/xkuHg+ritIG6hW9jnt3S8YLw0xCAGb
         o81AmK2qzI8naxwevOUxCLljOuBqxRPBU3tpOqFoak0x2B7w5wTW+/c19tWFPKwI7K
         w2DHMii4RCxLAPAkNAoGqU1h6JgLSeEv9RsK9ryMUApiPkKTo5mW+z+710D52jw90v
         +mkEFXOXqgFOmhuzovXVcWddIJJSdRz800nu6Wxmhhxj2xTF/Aw6Mq//rVBWabWFwi
         FhSrUXK1HP7vQ==
Message-ID: <8e5755da-db8c-7169-b140-d5f964f34a86@denx.de>
Date:   Sun, 18 Dec 2022 05:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>
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
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
 <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/18/22 05:23, Adam Ford wrote:
> On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/16/22 14:25, Alexander Stein wrote:
>> Hi,
>>
>> [...]
>>
>>> Oh, nice, thanks for the pointer. When setting
>>>> samsung,burst-clock-frequency = <668250000>;
>>> in imx8mm.dtsi
>>> I get a non-flickering display using 4 lanes. Although admittedly this is just
>>> random guessing. I'm not sure which clock exactly has to be in the range
>>> CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for
>>> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
>>>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
>>>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250, esc_clk
>>> = 16706250
>>
>> If I recall it right, minimum PLL frequency is:
>>
>> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
>>
>> the link frequency is then
>>
>> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
>>
>> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
>> this right. Can you check what is the value of mode->clock, the
>> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
>> sm65dsi83_get_dsi_range() ?
>>
>>> AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT
>>> properties, while SN65DSI84 is using display mode and number of lanes.
>>>
>>> Is it expected that the DSIM PLL frequencies are set in DT for a specific
>>> bridge/display setup?
>>
>> No, there should be negotiation between the host and bridge/panel, I
>> tried to propose two variants, but they were all rejected.
> 
> For one of Jagan's previous revisions, I added some code to let the
> PHY auto adjust the frequencies instead of being fixed.  NXP had this
> in their downstream kernel, but with this patch and another, I was
> able to set a variety of pixel clocks from my HDMI monitor and my
> DSI83. I haven't had time to re-base my work on Jagan's latest work,
> but you can link to the patch I did for the older stuff here:
> 
> https://github.com/aford173/linux/commit/e845274b0f22ba3b24813ffd6bb3cb88ab4b67e4
> and
> https://github.com/aford173/linux/commit/3f90057eb608f96d106029ef639813475241936f
> 
> I've been traveling a lot lately, so I haven't had time to evaluate
> his series, but I hope to get something like those re-based once the
> DSI stuff has been accepted.

I have these two attempts, both rejected:

https://patchwork.freedesktop.org/patch/475207/
https://patchwork.freedesktop.org/patch/496049/
