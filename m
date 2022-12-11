Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50B1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 18:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiLKSHP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 11 Dec 2022 13:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLKSHP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 11 Dec 2022 13:07:15 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7C7BC26
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Dec 2022 10:07:14 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BDF1F853A9;
        Sun, 11 Dec 2022 19:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670782033;
        bh=2AtcgXnsxhHlHGiQYvXRaF8zbcbDFUcFUSSeX6nTRq8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SZaj1WGXGNe4T7vvtOpJsVVmUTi/aegSDIb5pEhwRdBn/OrBKvDSGeXxHzYC63AzU
         s60mUruAR81KJoq8wYbHxTYEKEiACfuKp3X4deAkByHcSTzkcQuhQbOfQxxMHx1D78
         GffZA7/Tfgtd2pJuc1oHIA0pNUd8CIbflOEvnhU5HrLQRMFuoF2bzfuNkLATUuOEhe
         L/vE/DHCV6kLkhK3+F30pAZqtJJPeO3N/u6FoYPTLTRDQj/PeSdsJAB9//m5vXNBKw
         C6May2T4IclH5/U+q1P7xtn99IvM6ZOSqZ0UEkKI48yosL1eLTTW6XmEsG1Q4idruk
         9MKOsT03grfHQ==
Message-ID: <0276d7f4-5768-09c8-56fc-e738b4fadf9b@denx.de>
Date:   Sun, 11 Dec 2022 19:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 00/18] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
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
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <90c2e63d-138b-502d-5188-da49196e0ff1@denx.de>
 <CAMty3ZB7imKgS4ovyPfi5OMSHeBN=-hesTk6K+kuM-a+SvxbAQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZB7imKgS4ovyPfi5OMSHeBN=-hesTk6K+kuM-a+SvxbAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/11/22 06:48, Jagan Teki wrote:
> On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/9/22 16:23, Jagan Teki wrote:
>>> This series supports common bridge support for Samsung MIPI DSIM
>>> which is used in Exynos and i.MX8MM SoC's.
>>>
>>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>>
>> I wonder if it would rather make sense to split the series up and submit
>> all the various partial fixes and additions separately, instead of
>> piling them up in this series and ever growing the series.
>>
>> It seems to me 3..5 and 7..14 can just go in before the rest.
> 
> Only 4 and 5 come under fixes and the rest of them seem dependent on
> the series. However, 4, and 5 are reproduced in i.MX8M platform hence
> I have added it as part of this series.

You could try and reorder the series such that 7..14 can go in before 6 
. And send it in smaller chunks too.
