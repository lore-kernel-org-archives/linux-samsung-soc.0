From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: dp: fix wrong return type
Date: Thu, 26 Nov 2015 10:35:45 -0300
Message-ID: <56570AB1.3070408@osg.samsung.com>
References: <1448542040-22057-1-git-send-email-inki.dae@samsung.com>
 <1448542040-22057-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:59234 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbbKZNfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 08:35:53 -0500
In-Reply-To: <1448542040-22057-3-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Ajay Kumar <ajaykumar.rs@samsung.com>

[adding Ajay Kumar who added the bridge support]

Hello Inki,

On 11/26/2015 09:47 AM, Inki Dae wrote:
> This patch fixes wrong return type when dt binding of bridge device
> failed.
> 
> If a board has a bridge device then of_graph_get_remote_port_parent
> function shouldn't be NULL. So this patch will return a proper error
> type so that the deferred probe isn't triggered.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 0b53045..c77fb83 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1436,8 +1436,10 @@ static int exynos_dp_probe(struct platform_device *pdev)
>  			of_node_put(bridge_node);
>  			if (!dp->ptn_bridge)
>  				return -EPROBE_DEFER;
> -		} else
> -			return -EPROBE_DEFER;
> +		} else {
> +			DRM_ERROR("no port node for bridge device.\n");
> +			return -ENXIO;
> +		}
>  	}
>  

As I mentioned in the other thread, I wonder if -ENXIO is the best errno
code in this case. Shouldn't -EINVAL be more appropriate since is about
an invalid DTB?

>  	pm_runtime_enable(dev);
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
