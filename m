Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13073C7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 16:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjCCQli (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 11:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjCCQle (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 11:41:34 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29EC3B64E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 08:41:05 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3D97D85D4B;
        Fri,  3 Mar 2023 17:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677861664;
        bh=E9n5AANJnBD/8EduVr3DBqrLlSpvSrK14qs8o7r/DDQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=c+dgAlVX2NOdyO20/JbnDWQ/HFjGoxn9wnR1Vt65UVe6QgM3R+Nj8QUtwnEDuR29l
         UnLnJ8OgEwqkfMouOgw7NLQE6ToN+tSlFjDDPS1h13qA64pPbizw4hLouSW1ueMfvp
         5X/6WxaJRI49Nx3DEcRt58C2mc+kPloMv0RB/NCHgzALjc6OsBgOGdoh3bFCVEGG6v
         jz/DFEiWY9ZdLIg67P1mrEZKsVieYf4rgZMPH/uZNF2bcxYAM4afe+WieG7++mwkJL
         x2NmQVDkjUgBLJmyrHlFjGyZdUEoX4OjTZi+Ji+ubjXOgF96wOcT+542YbirUP1/0V
         Z3rhLwjfACx+w==
Message-ID: <1686f1fd-a2db-dc82-a2a7-740a68c09938@denx.de>
Date:   Fri, 3 Mar 2023 17:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v15 02/16] drm: exynos: dsi: Lookup OF-graph or Child node
 devices
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
 <20230303145138.29233-3-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230303145138.29233-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 3/3/23 15:51, Jagan Teki wrote:

[...]

> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1470,18 +1470,52 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	struct device *dev = dsi->dev;
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = encoder->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *remote;
>   	struct drm_panel *panel;
>   	int ret;
>   
> -	panel = of_drm_find_panel(device->dev.of_node);
> +	/**

This shouldn't be kerneldoc style comment, drop that extra asterisk (*).

> +	 * Devices can also be child nodes when we also control that device
> +	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).

[...]

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
