Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9529C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 16:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiKJQ7j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 11:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbiKJQ73 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 11:59:29 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3056F27935
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 08:59:26 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D533584D17;
        Thu, 10 Nov 2022 17:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668099563;
        bh=wqRbI3/U80qgngzNAH74ntF8Owlq1j4hStCDINhdFHw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wJlds3nkqISrPYMnZX9iGaGqmv22qbVzZ3fVp7t2cTPjpcJOufA19dQRMb5F6Iae5
         WbB2UuGEwj/3CIZIoTAA52WITsUFYas+RhpPDn1BctYJnOaXKWhUtte8+LDPGVN24Q
         /9+efMNFsf4td2x7GvHPJNFRZ7hi9uVRzIyhnWm8m9/2JTPl1DBonBH6to5ux7VBLn
         1Cwkl6ZLhBDV5C9JEmgyLYZ1DylBtiDuWfo41Cm2Bs9GpayuaKH5AQGLOLQyBpMNkw
         Gvor6JCwh70GPfQkbDH5z1qNh1MMwudET/FuP/sDMTVeCaqVQEb3e37R6rDt7T4tbk
         1dX5Tjf5JhHDw==
Message-ID: <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
Date:   Thu, 10 Nov 2022 17:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Fabio Estevam <festevam@gmail.com>
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
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
 <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
 <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/10/22 17:03, Jagan Teki wrote:
> On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi,
>>
>> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
>> <frieder.schrempf@kontron.de> wrote:
>>
>>> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
>>> and a Jenson 7" LVDS Display.
>>>
>>> Thanks for your work, Jagan!
>>>
>>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
>>> i.MX8MM
>>
>> As this series has been successfully tested on multiple devices, is it possible
>> to apply it so people can make further adjustments?
> 
> I think the next version patchset on this would be clean and properly
> address a few comments from Marek Vasut. However, I'm still waiting
> for Marek's response to my comment on the input bus formats - if it is
> Okay I will send the v8.
> https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/

Just send a V8 and let's see how that looks, no need to wait for me.
