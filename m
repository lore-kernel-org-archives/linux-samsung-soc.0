Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E67C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 02:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiLKC2w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Dec 2022 21:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiLKC2r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2022 21:28:47 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25C813E04
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 18:28:43 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E9446852F9;
        Sun, 11 Dec 2022 03:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670725721;
        bh=a7OGGyzB3bRRvcuqRMgBWQlfKRLtcP1rUZLMlxeOuVA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tsa00Od7MtlmifiMsvkREhfSJQ33NtHD4yyyDVEg7Q0m+08XHjhdhfGLa8Llk3aGq
         MIVYyglSvm0JOUIsIXdaP7Atpq+lqa0hWtiiauSFI09ImyoDQ0pWXtLGMle8/d7cH4
         gQZBzedJeIqAEJd5LvlQxQ3f0TcYInbOKVq/0QELam/Xj6+aGEsp0bdMbByTegTeeu
         QQ7ivvLD4WkJhgqoYphPeCqSFhjwFc7jbQKF3yGmJdDt0rV6xceb2u9YlXIPoHAJ8C
         NkS36GRHCfbWOz4kE2UFUZadIBE3brDJA9wbKjnuOoWSgZ3gu3FRXKesyGV2tRb6OH
         utTekM9uQ7lGg==
Message-ID: <d93b1fac-df4d-0de8-80f8-f9fcef811862@denx.de>
Date:   Sun, 11 Dec 2022 03:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 04/18] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
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
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-5-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221209152343.180139-5-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/9/22 16:23, Jagan Teki wrote:
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 = Enable and 1 = Disable.
> 
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
> 
> Fix the MIPI_DSI*_NO_* mode flags handling.
> 
> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
