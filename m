From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/exynos: dsi: modify a error type when getting a node
 failed
Date: Thu, 3 Dec 2015 10:18:30 -0300
Message-ID: <56604126.2040009@osg.samsung.com>
References: <1449121541-4693-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56050 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750964AbbLCNSe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Dec 2015 08:18:34 -0500
In-Reply-To: <1449121541-4693-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com

Hello Inki,

On 12/03/2015 02:45 AM, Inki Dae wrote:
> This patch makes it to return -EINVAL instead of -ENXIO
> when getting a port or endpoint node failed.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 7c3606a..a24bf8b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1735,13 +1735,13 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>  
>  	ep = of_graph_get_next_endpoint(node, NULL);
>  	if (!ep) {
> -		ret = -ENXIO;
> +		ret = -EINVAL;
>  		goto end;
>  	}
>  
>  	dsi->bridge_node = of_graph_get_remote_port_parent(ep);
>  	if (!dsi->bridge_node) {
> -		ret = -ENXIO;
> +		ret = -EINVAL;
>  		goto end;
>  	}
>  end:
> 

Yes, I also think that -EINVAL is a better error code in this case.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
