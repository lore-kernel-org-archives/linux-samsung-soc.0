Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BFFC54E94
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 20:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjAXUzj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjAXUzi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 15:55:38 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10644469B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 12:55:38 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 69C6881F59;
        Tue, 24 Jan 2023 21:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674593736;
        bh=ZKvIihffu5hupclvuWHyRpBzGzMS0GpDq/5QrXtnpvc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MLV8zMnI5lX4GaWgZULVwEPNLbmIV7ZhIaWC4IZ6HOmNlGGVxcmkQRgqlFO2XqDSD
         84narKuRQnMZHVjvVoajJt05jFuiCbkFvTpMoedeUZFtkHjszM7hzXxcv4aMbbshYm
         8dTVko5RR7Msmwaf5YoAZFnJTQL2rukxccTP0FMzmshiLg3SZch6pe4B8F9Opm8kEK
         y47HwE/dzYAbCW143k66I4w0moYS+vT7CuVUg7W+EkKPj/NykB9XvwW1XoayaziiAo
         w8NqwRf4wTf3Lz/GbYNYwQXXMWW+k04p7Zwkgtc/ylCdj28rMpcXPR6riB8dnQrYIp
         zjzp52onRnI3Q==
Message-ID: <5a6cb418-2e80-5b47-778c-668e724a0186@denx.de>
Date:   Tue, 24 Jan 2023 21:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 10/18] drm: exynos: dsi: Add input_bus_flags
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
 <20230123151212.269082-11-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-11-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
> LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
> the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
> active low (DE_LOW). This makes the valid data transfer on each
> horizontal line.
> 
> So, add additional bus flags DE_LOW setting via input_bus_flags
> for i.MX8M Mini/Nano platforms.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Suggested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
