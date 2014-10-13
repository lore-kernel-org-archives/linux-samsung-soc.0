From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 02/15] drm/dsi: Constify mipi_dsi_msg
Date: Mon, 13 Oct 2014 15:41:31 +0200
Message-ID: <543BD68B.2030106@samsung.com>
References: <1413195395-3355-1-git-send-email-thierry.reding@gmail.com>
 <1413195395-3355-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19402 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752693AbaJMNlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Oct 2014 09:41:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NDD00G7UY61G150@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Oct 2014 14:44:25 +0100 (BST)
In-reply-to: <1413195395-3355-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

On 10/13/2014 12:16 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> struct mipi_dsi_msg is a read-only structure, drivers should never need
> to modify it. Make this explicit by making all references to the struct
> const.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Andrzej Hajda <a.hajda@samsung.com>

--
Regards
Andrzej

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  include/drm/drm_mipi_dsi.h              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 24741d8758e8..c5f3c76bfac3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1236,7 +1236,7 @@ static bool exynos_dsi_is_short_dsi_type(u8 type)
>  }
>  
>  static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
> -				       struct mipi_dsi_msg *msg)
> +				        const struct mipi_dsi_msg *msg)
>  {
>  	struct exynos_dsi *dsi = host_to_dsi(host);
>  	struct exynos_dsi_transfer xfer;
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index ccc3869e137b..836cc2b677d0 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -56,7 +56,7 @@ struct mipi_dsi_host_ops {
>  	int (*detach)(struct mipi_dsi_host *host,
>  		      struct mipi_dsi_device *dsi);
>  	ssize_t (*transfer)(struct mipi_dsi_host *host,
> -			    struct mipi_dsi_msg *msg);
> +			    const struct mipi_dsi_msg *msg);
>  };
>  
>  /**
> 
