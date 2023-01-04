Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564E1C4708D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Jan 2023 15:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbjADPzh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Jan 2023 10:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbjADPzf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 10:55:35 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1E1B9FA
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jan 2023 07:55:34 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C8FA885587;
        Wed,  4 Jan 2023 16:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1672847732;
        bh=qpe86/VOKogpP9vEQFF1UhGX1wkgmWwoH3JshZjs8yk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZTIOhdillnagoU2CBpVFHzkYmaRftUgjTH++x1y6ft3tvE3UPuPEHZy1oNK1lROcx
         H5R4b4iTLj5OHA0ucrN03KpoC5nWRJMNHCBgpFriZk86XbKLt3jo4elfUhJddG6ofq
         RQGcVLyZxcdV6xyjYW66bDxvM8z3oP0YpL4+vdFYYkNjmgX6ktrDt4L0KJDh28iuzf
         DA8hjpDBUgnGOo7ptF5ogrodpWcRyrHyGrIbXkDVtVwV1HikVvIsVQyO7lQPcRIqzA
         rMhacMFaGrNQJDYlROQ41aPM0Lygw4O2iC/Tx9dY5Rxqusz/qFJjZREG6unNbRLHEg
         DqhiC71Gzv60A==
Message-ID: <af0bd46b-8bbe-1602-1f34-67589bb7f71e@denx.de>
Date:   Wed, 4 Jan 2023 16:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
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
 <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de> <1983452.PIDvDuAF1L@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <1983452.PIDvDuAF1L@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/3/23 10:51, Alexander Stein wrote:
> Hi Marek,
> 
> Am Sonntag, 18. Dezember 2022, 00:55:57 CET schrieb Marek Vasut:
>> On 12/16/22 14:25, Alexander Stein wrote:
>> Hi,
>>
>> [...]
>>
>>> Oh, nice, thanks for the pointer. When setting
>>>
>>>> samsung,burst-clock-frequency = <668250000>;
>>>
>>> in imx8mm.dtsi
>>> I get a non-flickering display using 4 lanes. Although admittedly this is
>>> just random guessing. I'm not sure which clock exactly has to be in the
>>> range CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is
>>> configured for>
>>> 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
>>>> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
>>>> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250,
>>>> esc_clk
>>>
>>> = 16706250
>>
>> If I recall it right, minimum PLL frequency is:
>>
>> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
>>
>> the link frequency is then
>>
>> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
> 
> Mh, there is something bogus about this. Right now the PLL freq is set
> depending on 'samsung,burst-clock-frequency' property. But this actually is
> somehow depending on the number of lanes I configure. From the debug output
> hs_clk and PLL freq are identical. AFAICS there is also no divider from PLL to
> hs_clk in the register map.

Could it be that samsung,burst-clock-frequency is fPMS / 2 ?

>> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
>> this right. Can you check what is the value of mode->clock, the
>> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
>> sm65dsi83_get_dsi_range() ?
> 
> A working setup on a tianma,tm070jvhg33 display (1280x800) is:
>> samsung-dsim 32e10000.dsi: PLL freq 891000000, (p 3, m 99, s 0)
>> samsung-dsim 32e10000.dsi: hs_clk = 891000000, byte_clk = 111375000, esc_clk
> = 18562500
>> sn65dsi83 2-002d: mode->clock: 68200
>> sn65dsi83 2-002d: mode bpp: 24
>> sn65dsi83 2-002d: ctx->dsi->lanes: 3
>> sn65dsi83 2-002d: samsung_dsim_set_pll: 0x37
> 
> Calculating backwards, sn64dsi83 is expecting a clock in the range of 275-280
> MHz. But I fail to see a corresponding clock in the DSIM PLL configuration.

294.9 MHz, no ? 1280x800x24x60x1.2 / 3 / 2 = 294.9 .
