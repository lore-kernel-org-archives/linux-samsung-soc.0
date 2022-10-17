Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A334AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 07:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJQHTh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Oct 2022 03:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiJQHTf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 03:19:35 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4C1BF6F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Oct 2022 00:19:34 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DE10984EED;
        Mon, 17 Oct 2022 09:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665991172;
        bh=SjAj6seYBPhk6U+OWYULFQrtnRvmj6Vg6YaIM8puxw0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZEtb3zofCkXTg2IUYgB48reM59wdMdsEKNw819GTiAzdhl7W1PNopJfSTtOtP4NT4
         6980/EblEVdwSN5xWQSgM7eBSZ10TmVMy9qqI3ElQHfOZeEtDGUoLUcesXWsQvVGuf
         UnnO0TE/bDasJ7zddxbM/sMpBcuZyt/jkmpyIJgoTWF3Nlb0wfb3lq5Stv3qR8tAV8
         vF18S9dYwdjLYsmCznd/HKCCIP2SCY/qbbtKc7qJbIE0k4sYa8x1SXPl/VRUUi+4XM
         ExXQ0LyB8X4vzkvzZtwsvLGy9ovwClhtaXyF5SMh9R5mw0HvO8yJ2N3V/3wHyivHYo
         vm6KUX/+eUr9A==
Message-ID: <bad48f67-5fe6-d69c-51b0-bac3fa9d2719@denx.de>
Date:   Mon, 17 Oct 2022 09:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
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
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
 <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
 <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZAw-iXKcYgWuPCT_RwksKHVSipxL6tXb6WNLEeB7YvYmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/17/22 04:49, Jagan Teki wrote:
> On Sun, Oct 16, 2022 at 3:16 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 10/5/22 17:13, Jagan Teki wrote:
>>> Samsung MIPI DSIM controller is common DSI IP that can be used in various
>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>
>>> In order to access this DSI controller between various platform SoCs,
>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>> driver.
>>>
>>> This patch is trying to differentiate platform-specific and bridge driver
>>> code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
>>> and common bridge driver code in samsung-dsim.c providing that the new
>>> platform-specific glue should be supported in the bridge driver, unlike
>>> exynos platform drm drivers.
>>>
>>> - Add samsung_dsim_plat_data for keeping platform-specific attributes like
>>>     host_ops, irq_ops, and hw_type.
>>>
>>> - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
>>>
>>> - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
>>>     samsung-dsim.c.
>>>
>>> - plat_data hooks like host_ops and irq_ops are invoked during the
>>>     respective bridge call chains.
>>
>> Maybe the Subject should say "Split ... driver" or "Move ... driver" ,
>> since it is not adding a new driver here ?
> 
> Though it is not added a completely new driver, it is adding more
> infrastructure platform code to be compatible with both Exynos and
> i.MX8M. This is the prime reason for adding that commit head and
> explaining the same in the commit body.

Diffstat looks like this:

  drivers/gpu/drm/bridge/samsung-dsim.c   | 1703 ++++++++++++++++++++++
  drivers/gpu/drm/exynos/Kconfig          |    1 +
  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1766 ++---------------------
  include/drm/bridge/samsung-dsim.h       |  113 ++
  7 files changed, 1952 insertions(+), 1653 deletions(-)

Looks to me like most of the code is just moved from existing driver in 
this patch.
