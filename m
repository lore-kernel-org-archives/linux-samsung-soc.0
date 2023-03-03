Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BAEC7EE32
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 16:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjCCQjx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 11:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjCCQjw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 11:39:52 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FE522031
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 08:39:51 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F06E085D4B;
        Fri,  3 Mar 2023 17:39:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677861589;
        bh=TN7NnFQ2txDIeFfMl3uXWT5MmtmyknvQI0VggkpKraw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=axscIPKiSKYU3IIc3IZaW81sdBLbq5gqFeSeGzc63BqpneLMJ3eNkOFynwrc0orje
         9Av/Qq9Wjh7XgSf+aKNAu21WPoKSCR4Yc2Rmq9m5HXpLQxuG85cVSSYhh9p0FPP4Xz
         xOa9kwmhycJdFJO0n35t2xiSHvU6ocDAh7ZIwBFICvG9HcgnzbodRT6nZvD26dsj6M
         I+LDnhafS+/eBRWgqe95P1X7AN+VQOFYguNlzVpO4Vxc5MMlAvLvZ7lXXCwqDq2za1
         NF1bQyD6PNRVZL87PwIL3egq/8NS7Ed/fbBVr/3iUBRUYYPu5+bdEaBs5ipjHnJze/
         4W68PEYpieofA==
Message-ID: <384a9d83-cf4e-34c8-bee6-073edfd4683c@denx.de>
Date:   Fri, 3 Mar 2023 17:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v15 01/16] drm: exynos: dsi: Drop explicit call to bridge
 detach
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-2-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230303145138.29233-2-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 3/3/23 15:51, Jagan Teki wrote:
> Exynos DSI already converted into a bridge driver, so bridge
> detach will suppose happened during bridge chain removal done
> by the bridge core.
> 
> Drop the explicit call chain to detach the bridge.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v15, v13, v12, v11:
> - none
> Changes for v10:
> - new patch
> 
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 06d6513ddaae..df15501b1075 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_device *drm = dsi->encoder.dev;
>   
> -	if (dsi->out_bridge->funcs->detach)
> -		dsi->out_bridge->funcs->detach(dsi->out_bridge);
>   	dsi->out_bridge = NULL;
>   
>   	if (drm->mode_config.poll_enabled)

Considering also the discussion in v15 12/16

Reviewed-by: Marek Vasut <marex@denx.de>
