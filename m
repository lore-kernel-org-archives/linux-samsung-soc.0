From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: update to use component match support
Date: Wed, 10 Sep 2014 12:24:38 +0200
Message-ID: <541026E6.3020107@samsung.com>
References: <1409573992-19721-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12671 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040AbaIJKYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 06:24:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBO000GUL1V5C30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Sep 2014 11:27:31 +0100 (BST)
In-reply-to: <1409573992-19721-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk

Hi Inki,

To test it properly I have to fix init/remove bugs [1].
Of course these bugs were not introduced by this patch,
but they prevented some basic tests.

[1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/37266

I have tested successfully your patch with trats and universal_c210 boards.

Few additional comments below.

On 09/01/2014 02:19 PM, Inki Dae wrote:
> Update Exynos's DRM driver to use component match support rater than
> add_components.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   40 ++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index feee991..dae62c2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -503,16 +503,15 @@ static int compare_of(struct device *dev, void *data)
>  	return dev == (struct device *)data;
>  }

Nitpick.

This is not a part of this patch but compare_of suggests it compares OF
nodes but this function compares devices, maybe compare_dev would be better.

>  
> -static int exynos_drm_add_components(struct device *dev, struct master *m)
> +static struct component_match *exynos_drm_match_add(struct device *dev)
>  {
> +	struct component_match *match = NULL;
>  	struct component_dev *cdev;
>  	unsigned int attach_cnt = 0;
>  
>  	mutex_lock(&drm_component_lock);
>  
>  	list_for_each_entry(cdev, &drm_component_list, list) {
> -		int ret;
> -
>  		/*
>  		 * Add components to master only in case that crtc and
>  		 * encoder/connector device objects exist.
> @@ -527,16 +526,10 @@ static int exynos_drm_add_components(struct device *dev, struct master *m)
>  		/*
>  		 * fimd and dpi modules have same device object so add
>  		 * only crtc device object in this case.
> -		 *
> -		 * TODO. if dpi module follows driver-model driver then
> -		 * below codes can be removed.
>  		 */
>  		if (cdev->crtc_dev == cdev->conn_dev) {
> -			ret = component_master_add_child(m, compare_of,
> -					cdev->crtc_dev);
> -			if (ret < 0)
> -				return ret;
> -
> +			component_match_add(dev, &match, compare_of,
> +						cdev->crtc_dev);
>  			goto out_lock;
>  		}
>  
> @@ -546,11 +539,8 @@ static int exynos_drm_add_components(struct device *dev, struct master *m)
>  		 * connector/encoder need pipe number of crtc when they
>  		 * are created.
>  		 */
> -		ret = component_master_add_child(m, compare_of, cdev->crtc_dev);
> -		ret |= component_master_add_child(m, compare_of,
> -							cdev->conn_dev);
> -		if (ret < 0)
> -			return ret;
> +		component_match_add(dev, &match, compare_of, cdev->crtc_dev);
> +		component_match_add(dev, &match, compare_of, cdev->conn_dev);
>  
>  out_lock:
>  		mutex_lock(&drm_component_lock);
> @@ -558,7 +548,7 @@ out_lock:
>  
>  	mutex_unlock(&drm_component_lock);
>  
> -	return attach_cnt ? 0 : -ENODEV;
> +	return attach_cnt ? match : ERR_PTR(-EPROBE_DEFER);
>  }
>  
>  static int exynos_drm_bind(struct device *dev)
> @@ -572,13 +562,13 @@ static void exynos_drm_unbind(struct device *dev)
>  }
>  
>  static const struct component_master_ops exynos_drm_ops = {
> -	.add_components = exynos_drm_add_components,
>  	.bind		= exynos_drm_bind,
>  	.unbind		= exynos_drm_unbind,
>  };
>  
>  static int exynos_drm_platform_probe(struct platform_device *pdev)
>  {
> +	struct component_match *match;
>  	int ret;
>  
>  	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> @@ -645,13 +635,19 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
>  		goto err_unregister_ipp_drv;
>  #endif
>  
> -	ret = component_master_add(&pdev->dev, &exynos_drm_ops);
> -	if (ret < 0)
> -		DRM_DEBUG_KMS("re-tried by last sub driver probed later.\n");
> +	match = exynos_drm_match_add(&pdev->dev);
> +	if (IS_ERR(match)) {
> +		ret = PTR_ERR(match);
> +		goto err_unregister_ipp_dev;
> +	}
>  
> -	return 0;
> +	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
> +						match);

In case component_master_add_with_match fails there will be no cleanup -
platform devices and drivers will not be removed.

> +
> +err_unregister_ipp_dev:
>  
>  #ifdef CONFIG_DRM_EXYNOS_IPP
> +	exynos_platform_device_ipp_unregister();

It should not be a part of this patch.

Regards
Andrzej

>  err_unregister_ipp_drv:
>  	platform_driver_unregister(&ipp_driver);
>  err_unregister_gsc_drv:
> 
