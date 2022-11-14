Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69725C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Nov 2022 03:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiKNDQc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 13 Nov 2022 22:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbiKNDQb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 13 Nov 2022 22:16:31 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0D4BE22
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Nov 2022 19:16:30 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 21F90839E1;
        Mon, 14 Nov 2022 04:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668395788;
        bh=E0IhM/uCwD4sS9QR1hj1RvZ0InbjI+h1E2fJC/qgA3E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EArG/AK3iWzy90EETcWzpuGjQA2H1lWhudTcSAIbA5nRWE/9ZogYfxKWnMDeZuRSf
         TohCPFNbiiZt1MalupM0R3dLfB6uGZPtTuElPQd0yo/kkwebhE5hsyqhBoFWllV1yF
         LCwYnQaFCu97EH4Y5y1sLQ2fl+WNvWwfEzGA/vX7yZWAetcOlII1z61oNEDBXG4YnR
         C0aqg4RTQFEk/UevXPfJWolrAglErwY67W3Vv2C93MH+D288P4U7NWS3+CwjABD/nN
         JMVIPHWUx7YEcWSpdOqq/8PvOX6QLBVc6Arw9PTKzHmHPQxIHck7kMLG0XtWrkInhA
         cy1Ktg2i7JYtQ==
Message-ID: <ef265fa0-dea9-f7c6-3800-ad0353a838b8@denx.de>
Date:   Mon, 14 Nov 2022 04:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
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
 <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
 <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/14/22 02:11, Nicolas Boichat wrote:
> On Sun, Nov 13, 2022 at 8:29 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/11/22 13:12, Nicolas Boichat wrote:
>>
>> [...]
>>
>>>>> BTW, are you sure DSIM_HSE_MODE is correct now?
>>>>
>>>> Yes, we have tested in imx8m platforms as well. Sébastien Szymanski
>>>> initially observed this issue on the imx8m platform.
>>>
>>> I'll repeat, are you sure about HSE specifically? You invert the
>>> polarity for HBP, HFP, and HSA, which makes sense given your patch
>>> 02/14.
>>>
>>> I'm concerned about HSE. Is the bit really a disable bit?
>>> MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
>>> should not do `reg |= DSIM_HSE_DISABLE;`, probably.
>>
>> I suspect the HSE bit is a misnomer, but its handling in the driver is
>> correct.
>>
>> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
>> Page 5436
>>
>> 23 HseDisableMode
>>
>> In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
>> start packet to MIPI DSI slave at MIPI DSI spec 1.1r02. This bit
>> transfers Hsync end packet in Vsync pulse and Vporch area (optional).
>>
>> 0 = Disables transfer
>> 1 = Enables transfer
>>
>> In command mode, this bit is ignored.
> 
> Okay. I'd suggest adding a comment in the code, it'd be so tempting to
> attempt to "fix" this as the if/or pattern looks different from the
> others.
> 
> But it's up to you all.

I agree. Clearly the discrepancy is confusing and leads to mistakes.
