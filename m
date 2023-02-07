Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7046EC636CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 09:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjBGJYb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 04:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjBGJXy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 04:23:54 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869D72D7F
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 01:23:22 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1F02C85883;
        Tue,  7 Feb 2023 10:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1675761800;
        bh=5HBYFCs4vI1aDS7UhRkhM+9AOnEsulPKysY/3RB7eUE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=n3Y/p828aH+xgLeDVd+4UQ8KlOvqCvJ8UXumhwzut06Eh7bNjWdEKPUibXx6iWwaA
         TwECPxPBzHFNOWUoJmEFIV2lr9bffcQzJdTCED8BbEfgC/MH8XTTkEsx/EemnKUaHa
         sd+hFwXErxaF6vXQMaYP815t+ieodJZFjM8QJ5hqOo8aXIs5WZD2RPl1JODAvAgbmD
         WjCqEUX2LaZ8HNwVup3TG8jBPTY+UD146PZmfX5SlY+s+FGy7DRgMqvHdtkyyoxsFK
         3nlvOlGRZSwfQtoXzJZ4niZ4KHXalCpW9SnxWtbcgaLnsX4KrQiVH209Bro/nxZehs
         P5CULrPZ+iZ8A==
Message-ID: <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
Date:   Tue, 7 Feb 2023 10:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     Laurent.pinchart@ideasonboard.com, aford173@gmail.com,
        andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
        inki.dae@samsung.com, kyungmin.park@samsung.com,
        linux-amarula@amarulasolutions.com,
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
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2/7/23 10:09, Rasmus Villemoes wrote:

[...]

> Now hotplug-detect doesn't work with the current sn65dsi86 driver, but
> that's a separate issue; when I boot with a monitor attached, its edid
> is correctly read out. But I still don't get any output, and the monitor
> says "no signal" - my naive attempt (which has worked fine in other
> cases) was to just dd /dev/urandom to /dev/fb0, so I'm clearly missing
> some important step.

You could try and tweak the DSI mode flags in 
drivers/gpu/drm/bridge/ti-sn65dsi86.c to operate in DSI burst mode 
MIPI_DSI_MODE_VIDEO_BURST instead of MIPI_DSI_MODE_VIDEO . Then you 
could configure the DSIM PLL to 891 MHz , but you also have to make sure 
the DSI86 would expect the 891 MHz (please check the datasheet).

Try and look up patches below for related approach:
drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
drm: bridge: samsung-dsim: Select DSI HS clock rate from downstream 
bridge limits
