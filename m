From: Hoegeun Kwon <hoegeun.kwon@gmail.com>
Subject: Re: [PATCH] drm/exynos/dsi: fix bridge_node DT parsing
Date: Wed, 12 Apr 2017 22:58:56 +0900
Message-ID: <b503ffe5-b2e5-2dce-0d1e-73c4a2207977@gmail.com>
References: <CGME20170412072216eucas1p136149c39438639424d3b8ab4f8d548e8@eucas1p1.samsung.com>
 <1491981729-6396-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33585 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752458AbdDLN7A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Apr 2017 09:59:00 -0400
Received: by mail-pf0-f193.google.com with SMTP id c198so5267842pfc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Apr 2017 06:59:00 -0700 (PDT)
In-Reply-To: <1491981729-6396-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, hoegeun.kwon@samsung.com

On 04/12/2017 04:22 PM, Andrzej Hajda wrote:
> DSIM uses MIC bridge which is between DECON and DSIM, so the driver
> should expect bridge node on input side.
>
> Fixes: 86418f9 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index dcb50d4d..3ae459f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1659,7 +1659,7 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>   
>   	of_node_put(ep);
>   
> -	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
> +	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
>   	if (!dsi->bridge_node)
>   		return -EINVAL;

Hi Andrzej,

The of_graph_get_remote_node() does not exist in the kernel.
Also this patch  does not apply('git am') on drm-next tree.
Is this what you mean?
         dsi->bridge_node = of_graph_get_endpoint_by_regs(node, 
DSI_PORT_IN, 0);
         if (!dsi->bridge_node)
                 return -EINVAL;

Best regards,
Hoegeun

>   
