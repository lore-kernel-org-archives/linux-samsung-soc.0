From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos/dsi: fix bridge_node DT parsing
Date: Thu, 13 Apr 2017 16:22:15 +0900
Message-ID: <58EF2727.3030307@samsung.com>
References: <CGME20170412072216eucas1p136149c39438639424d3b8ab4f8d548e8@eucas1p1.samsung.com>
 <1491981729-6396-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49313 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753286AbdDMHWS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Apr 2017 03:22:18 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOC0217W754CG20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Apr 2017 16:22:16 +0900 (KST)
In-reply-to: <1491981729-6396-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


2017년 04월 12일 16:22에 Andrzej Hajda 이(가) 쓴 글:
> DSIM uses MIC bridge which is between DECON and DSIM, so the driver
> should expect bridge node on input side.

Confirmed and merged.

Thanks,
Inki Dae

> 
> Fixes: 86418f9 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index dcb50d4d..3ae459f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1659,7 +1659,7 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>  
>  	of_node_put(ep);
>  
> -	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
> +	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
>  	if (!dsi->bridge_node)
>  		return -EINVAL;
>  
> 
