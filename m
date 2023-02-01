Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B79C636D4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Feb 2023 22:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjBAWBQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Feb 2023 17:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjBAWBP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 17:01:15 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5A1721D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Feb 2023 14:01:12 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2FFEA85E33;
        Wed,  1 Feb 2023 23:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1675288863;
        bh=6GRRYt5aNMZNRsKyHoSmp4/NA2MSLR8z21thUyNxF1o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=icLiCMCaFPfnCGXlot0hfgoXpeWQFDjCihSFyAxIBm7/YABoRyyMJc5GyjfyHyX6U
         CkHVLhAQrBSSbEl1lhQMVjm7eFmrQxh9ofDHD7WOyD2qWD0s9eAS0uagJNQt8I2AGH
         NvZC53e+0VJkdQlpDJc9Ht6E9hrWN39wtm4mnUyAd8+9/gGEsvn6eo57Ts2hp0UyOj
         S7JrrpQX+bQbXQfCAc3CRIvY9vGyePNVwlQ9W2RVvz80rOlqtIHzlh59Ml0gesyBBG
         q1nDTSIdSPFmjacwDU7HSRCROLLxFVbHOihDdv7lrFVxpj2H8MjN70vcFT6FdvbxeK
         W32yJYqhuMlEg==
Message-ID: <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
Date:   Wed, 1 Feb 2023 23:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     Laurent.pinchart@ideasonboard.com, aford173@gmail.com,
        andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
        frieder.schrempf@kontron.de, inki.dae@samsung.com,
        kyungmin.park@samsung.com, linux-amarula@amarulasolutions.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        matteo.lisi@engicam.com, sw0312.kim@samsung.com,
        tharvey@gateworks.com
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/30/23 13:45, Rasmus Villemoes wrote:
> On 27/01/2023 12.30, Marek Vasut wrote:
>> On 1/27/23 12:04, Jagan Teki wrote:
> 
>>>> Thanks, but that's exactly what I'm doing, and I don't see any
>>>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>>>> help to do the equivalent of
>>>>
>>>>     88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>>>     f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>>>
>>>> for imx8mp in order to test those patches on our boards (we have two
>>>> variants).
>>>
>>> Marek, any help here, thanks.
>>
>> Try attached patch.
> 
> Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
> patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
> of errors during boot:
> 
>    clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
> media_apb to sys_pll1_266m: -22
> 
> and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
> is because
> 
>    clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
> media_apb
> 
> Further, the mipi_dsi fails to probe due to
> 
>    /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
> 'samsung,burst-clock-frequency' property
> 
> All other .dtsi files seem to have those samsung,burst-clock-frequency
> and samsung,esc-clock-frequency properties, so I suppose those should
> also go into the imx8mp.dtsi and are not something that the board .dts
> file should supply(?).

No, that samsung,esc-clock-frequency (should be some 10-20 MHz, based on 
your panel/bridge) and samsung,burst-clock-frequency (that's the HS 
clock) should go into board DT, as those are property of the attached 
panel/bridge.

> [There's also some differences between your patch and Alexander's
> regarding the lcdif2 and ldb nodes, so while my lvds display still sorta
> works, I get
> 
>    fsl-ldb 32ec0000.blk-ctrl:lvds-ldb: Configured LDB clock (297000000
> Hz) does not match requested LVDS clock: 346500000 Hz
> 
> and the image is oddly distorted/shifted. But I suppose that's
> orthogonal to getting the lcdif1 -> mipi-dsi -> ... pipeline working.]

Alexander is right in the reply below, you have to configure the LVDS 
serializer clock in DT and they must match LCDIF2 pixel clock which are 
also configured in DT then, else you won't get the correct LVDS clock.
