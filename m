From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: rotator: Clock control is unused if !PM
Date: Fri, 25 Sep 2015 10:41:52 +0200
Message-ID: <560508D0.7030606@samsung.com>
References: <1443089655-15352-1-git-send-email-thierry.reding@gmail.com>
 <1443089655-15352-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22008 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754894AbbIYImT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 04:42:19 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV8004J75IHKQ70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 09:42:17 +0100 (BST)
In-reply-to: <1443089655-15352-3-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 09/24/2015 12:14 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Protect the rotator_clk_crtl() function with an #ifdef CONFIG_PM guard
> to avoid "defined but not used" warnings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>


> ---
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index 425e70625388..2f5c118f4c8e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -786,6 +786,7 @@ static int rotator_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM
>  static int rotator_clk_crtl(struct rot_context *rot, bool enable)
>  {
>  	if (enable) {
> @@ -822,7 +823,6 @@ static int rotator_resume(struct device *dev)
>  }
>  #endif
>  
> -#ifdef CONFIG_PM
>  static int rotator_runtime_suspend(struct device *dev)
>  {
>  	struct rot_context *rot = dev_get_drvdata(dev);
> 
