From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: update to use component match support
Date: Thu, 11 Sep 2014 17:05:16 +0200
Message-ID: <5411BA2C.6010301@samsung.com>
References: <1409573992-19721-1-git-send-email-inki.dae@samsung.com>
 <1410440250-5209-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:26055 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbaIKPFV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 11:05:21 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBQ002Q0SPPCF40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Sep 2014 16:08:13 +0100 (BST)
In-reply-to: <1410440250-5209-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

On 09/11/2014 02:57 PM, Inki Dae wrote:
> Update Exynos's DRM driver to use component match support rater than
> add_components.
> 
> Changelog v2:
> - release devices and drivers if failed.
> - change compare_of to compare_dev.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>

Modulo fixes I have posted earlier.

Tested-by: Andrzej Hajda <a.hajda@samsung.com>

--
Regards
Andrzej

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   44 +++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 5aae95c..3f6ec96 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -486,21 +486,20 @@ void exynos_drm_component_del(struct device *dev,
>  	mutex_unlock(&drm_component_lock);
>  }
>  
> -static int compare_of(struct device *dev, void *data)
> +static int compare_dev(struct device *dev, void *data)
>  {
>  	return dev == (struct device *)data;
>  }
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
> @@ -515,16 +514,10 @@ static int exynos_drm_add_components(struct device *dev, struct master *m)
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
> +			component_match_add(dev, &match, compare_dev,
> +						cdev->crtc_dev);
>  			goto out_lock;
>  		}
>  
> @@ -534,11 +527,8 @@ static int exynos_drm_add_components(struct device *dev, struct master *m)
>  		 * connector/encoder need pipe number of crtc when they
>  		 * are created.
>  		 */
> -		ret = component_master_add_child(m, compare_of, cdev->crtc_dev);
> -		ret |= component_master_add_child(m, compare_of,
> -							cdev->conn_dev);
> -		if (ret < 0)
> -			return ret;
> +		component_match_add(dev, &match, compare_dev, cdev->crtc_dev);
> +		component_match_add(dev, &match, compare_dev, cdev->conn_dev);
>  
>  out_lock:
>  		mutex_lock(&drm_component_lock);
> @@ -546,7 +536,7 @@ out_lock:
>  
>  	mutex_unlock(&drm_component_lock);
>  
> -	return attach_cnt ? 0 : -ENODEV;
> +	return attach_cnt ? match : ERR_PTR(-EPROBE_DEFER);
>  }
>  
>  static int exynos_drm_bind(struct device *dev)
> @@ -560,13 +550,13 @@ static void exynos_drm_unbind(struct device *dev)
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
> @@ -633,13 +623,23 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
>  		goto err_unregister_ipp_drv;
>  #endif
>  
> -	ret = component_master_add(&pdev->dev, &exynos_drm_ops);
> +	match = exynos_drm_match_add(&pdev->dev);
> +	if (IS_ERR(match)) {
> +		ret = PTR_ERR(match);
> +		goto err_unregister_resources;
> +	}
> +
> +	ret = component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
> +						match);
>  	if (ret < 0)
> -		DRM_DEBUG_KMS("re-tried by last sub driver probed later.\n");
> +		goto err_unregister_resources;
>  
> -	return 0;
> +	return ret;
> +
> +err_unregister_resources:
>  
>  #ifdef CONFIG_DRM_EXYNOS_IPP
> +	exynos_platform_device_ipp_unregister();
>  err_unregister_ipp_drv:
>  	platform_driver_unregister(&ipp_driver);
>  err_unregister_gsc_drv:
> 
