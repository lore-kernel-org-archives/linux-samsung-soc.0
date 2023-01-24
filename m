Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE117C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbjAXVAo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjAXVAn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:00:43 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E71D3D097
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:00:42 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 132DE85695;
        Tue, 24 Jan 2023 22:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674594040;
        bh=CFHQq7q8sTru4dXSQdzAXmnaFqMSTjmWlhBAf6OibxQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qAPZJGsbGa2GGX96R14Wjxs7NCLgz29rsYNkCtIpXo6vybS5eBxx+eWRDKVPULY5x
         NnvSRzo1IOuSlDovE+zLPMQuA0La+3POmUYYYsfahneGNs8i/tx8nnbJTHSp8HKOvj
         zIv/z1JOsSJdcLFWgFhlyBAZZrNV3tNTx5/q7WsOj6ciJu57V3KeT6+UUXsgGjk8jX
         OyyfvEPWHrf8bZVj6jUZPhFFNvIQY5pYSHo216TeQ5k/W8pzOBYHl8rO0Ey4HOvSnt
         SIIN1+tLOZeCzBRVyFvByPaww6ilNiFxkaFpwbZIrNIp1JtyF2+FVfZutvXUhYuQlC
         w17uu5w62lT5g==
Message-ID: <351938c4-c66e-36c9-21aa-96b41b9ee8f8@denx.de>
Date:   Tue, 24 Jan 2023 22:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 08/18] drm: exynos: dsi: Handle proper host
 initialization
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-9-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-9-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Host transfer() in the DSI master will invoke only when the DSI commands
> are sent from DSI devices like DSI Panel or DSI bridges and this host
> the transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> 
> Handling DSI host initialization in transfer calls misses the controller
> setup for I2C configured DSI bridges.
> 
> This patch updates the DSI host initialization by calling host to init
> from bridge pre_enable as the bridge pre_enable API is invoked by core
> as it is common across all classes of DSI device drivers.
> 
> The host init during pre_enable is conditional and not invoked for Exynos
> as existing downstream drm panels and bridges in Exynos are expecting
> the host initialization during DSI transfer.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Although this probably needs to be revisited.
