From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: resolve infinite loop issue on non
 multi-platform
Date: Fri, 07 Nov 2014 09:29:54 +0100
Message-ID: <545C8302.30701@samsung.com>
References: <1415283007-10096-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:53560 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751020AbaKGIaA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 03:30:00 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEN0049UUEQJ670@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Nov 2014 08:32:50 +0000 (GMT)
In-reply-to: <1415283007-10096-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

On 11/06/2014 03:10 PM, Inki Dae wrote:
> This patch resovles the infinite loop issue incurred
> when Exyno drm driver is enabled but all kms drivers
> are disabled on Exynos board by returning -EPROBE_DEFER
> only in case that there is kms device registered.

There are many different cases it can still fail:
- there are no matching device nodes in DT,
- some devices are present in DT, some drivers are enabled,
but they do not match,
- even if there exists some pairs device_node-driver it can fail -
exynos_drm_match_add requires higher level matches - every crtc should
have matching encoder.

I think even super-node will not solve all these issues.

The real problem here is that during probe of exynos_drm ipp driver is
successfully probed and after that exynos_drm probe fails, which causes
also removing ipp, anyway successful ipp probe triggers whole re-probe
mechanism again. It creates infinite loop.

I think moving exynos_platform_device_ipp_register after
component_master_add_with_match should solve some of the issue,
but I guess it could create new ones, or maybe not, needs checking.

On the other side I wonder if we really need to have ipp device at all,
replacing it with helpers of exynos_drm should be possible, I guess.

Regards
Andrzej

> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index ecc86aa..14c6af7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -488,6 +488,12 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
>  
>  	mutex_lock(&drm_component_lock);
>  
> +	/* Do not retry to probe if there is no any kms driver regitered. */
> +	if (list_empty(&drm_component_list)) {
> +		mutex_unlock(&drm_component_lock);
> +		return ERR_PTR(-ENODEV);
> +	}
> +
>  	list_for_each_entry(cdev, &drm_component_list, list) {
>  		/*
>  		 * Add components to master only in case that crtc and
> 
