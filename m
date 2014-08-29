From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 17/17] drm/exynos/ipp: add file checks for ioctls
Date: Fri, 29 Aug 2014 16:11:49 +0900
Message-ID: <540027B5.5070704@samsung.com>
References: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
 <1409216861-12452-18-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13504 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbaH2HLv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Aug 2014 03:11:51 -0400
In-reply-to: <1409216861-12452-18-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Andrzej,

On 08/28/2014 06:07 PM, Andrzej Hajda wrote:
> Process should not have access to ipp nodes created by another
> process. The patch adds necessary checks.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> index fc8bb67..d233cfc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -318,7 +318,8 @@ static void ipp_print_property(struct drm_exynos_ipp_property *property,
>  		sz->hsize, sz->vsize, config->flip, config->degree);
>  }
>  
> -static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property)
> +static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property,
> +		struct drm_file *file)

This is ok, but i think ipp_find_and_set_property function is some
duplicated. If we add function to get c_node from struct
exynos_drm_ippdrv, it's easy to remove ipp_find_and_set_property.

Thanks.

>  {
>  	struct exynos_drm_ippdrv *ippdrv;
>  	struct drm_exynos_ipp_cmd_node *c_node;
> @@ -339,8 +340,12 @@ static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property)
>  	 */
>  	mutex_lock(&ippdrv->cmd_lock);
>  	list_for_each_entry(c_node, &ippdrv->cmd_list, list) {
> -		if ((c_node->property.prop_id == prop_id) &&
> -		    (c_node->state == IPP_STATE_STOP)) {
> +		if (c_node->property.prop_id == prop_id) {
> +			if (c_node->filp != file)
> +				break;
> +			if (c_node->state != IPP_STATE_STOP)
> +				break;
> +
>  			mutex_unlock(&ippdrv->cmd_lock);
>  			DRM_DEBUG_KMS("found cmd[%d]ippdrv[0x%x]\n",
>  				property->cmd, (int)ippdrv);
> @@ -418,7 +423,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
>  	 */
>  	if (property->prop_id) {
>  		DRM_DEBUG_KMS("prop_id[%d]\n", property->prop_id);
> -		return ipp_find_and_set_property(property);
> +		return ipp_find_and_set_property(property, file);
>  	}
>  
>  	/* find ipp driver using ipp id */
> @@ -1032,7 +1037,7 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
>  
>  	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
>  		cmd_ctrl->prop_id);
> -	if (!c_node) {
> +	if (!c_node || c_node->filp != file) {
>  		DRM_ERROR("invalid command node list.\n");
>  		return -ENODEV;
>  	}
> 
