From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos/dsi: Remove error handling for bridge_node
 DT parsing
Date: Tue, 13 Jun 2017 18:25:50 +0900
Message-ID: <593FAF9E.1040406@samsung.com>
References: <CGME20170609092307epcas5p3a7851f80bd799626782941a640824521@epcas5p3.samsung.com>
        <1497000180-30669-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27367 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbdFMJZx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Jun 2017 05:25:53 -0400
In-reply-to: <1497000180-30669-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: javier@osg.samsung.com, a.hajda@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org



2017년 06월 09일 18:23에 Hoegeun Kwon 이(가) 쓴 글:
> The bridge_node is unnecessary between FIMD and DSIM. If don't remove
> error handling, it will not work between FIMD and DSIM. So remove
> error handling.

Please make sure to describe why bridge_node is unnecessary.
For example,
In case of Exynos SoC, a bridge device such as mDNIe and MIC could be placed between Display Controller and MIPI DSI device but the bridge device is required optionally.

Thanks,
Inki Dae

> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index a11b795..6ee0dac 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1651,8 +1651,6 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>  		return ret;
>  
>  	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
> -	if (!dsi->bridge_node)
> -		return -EINVAL;
>  
>  	return 0;
>  }
> 
