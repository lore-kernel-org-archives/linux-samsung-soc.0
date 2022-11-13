Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817A5C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 13 Nov 2022 00:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbiKMA3b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Nov 2022 19:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiKMA3b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Nov 2022 19:29:31 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A91655B
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Nov 2022 16:29:30 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 85E5B83EFC;
        Sun, 13 Nov 2022 01:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668299368;
        bh=ch93rjyUV22fFd4U/j24+ZiDlu26BVwkpYrr8XdI+yg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LkkoOOjWvN56bTFclhwYjPMRem5Zoblby6ddwvg/FFoZfgmXASfVaON9kniZehg13
         sTx3nBGwY1zALpdQPb/VCdBVlySRPRYbVykXblgjUiDI14jQ7hJmWtw5LmtiG020qJ
         JPBw7VJWAb77xbcdMv59f/4PHx62+UJu95xrml8czWpGsWn6RD7dG2jrpy/zI6+dkW
         Y+nCqFScuCrzvpjfalr2eT2OLkCvKf5erroEYc6z0vfCrVCaIV77DHbXFTwOCwBoAe
         9hywxAWmWSLo3QnAhtmp7nuSrPjxrt1x0MCyABzdo1e8/gOgN5a1yEJ7+CmhGTC8fH
         5s5+YvqA0Taew==
Message-ID: <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
Date:   Sun, 13 Nov 2022 01:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Content-Language: en-US
To:     Nicolas Boichat <drinkcat@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
 <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/11/22 13:12, Nicolas Boichat wrote:

[...]

>>> BTW, are you sure DSIM_HSE_MODE is correct now?
>>
>> Yes, we have tested in imx8m platforms as well. Sébastien Szymanski
>> initially observed this issue on the imx8m platform.
> 
> I'll repeat, are you sure about HSE specifically? You invert the
> polarity for HBP, HFP, and HSA, which makes sense given your patch
> 02/14.
> 
> I'm concerned about HSE. Is the bit really a disable bit?
> MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
> should not do `reg |= DSIM_HSE_DISABLE;`, probably.

I suspect the HSE bit is a misnomer, but its handling in the driver is 
correct.

i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
Page 5436

23 HseDisableMode

In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync 
start packet to MIPI DSI slave at MIPI DSI spec 1.1r02. This bit 
transfers Hsync end packet in Vsync pulse and Vporch area (optional).

0 = Disables transfer
1 = Enables transfer

In command mode, this bit is ignored.
