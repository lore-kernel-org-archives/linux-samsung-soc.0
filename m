From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 06/15] drm/exynos/ipp: free partially allocated resources
 on error
Date: Tue, 26 Aug 2014 14:00:16 +0900
Message-ID: <53FC1460.5090000@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
 <1408693946-15456-7-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46423 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933725AbaHZFAR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 01:00:17 -0400
In-reply-to: <1408693946-15456-7-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Andrzej,

On 08/22/2014 04:52 PM, Andrzej Hajda wrote:
> In case of allocation errors some already allocated buffers
> were not freed. The patch fixes it.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 68 ++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> index 060a198..728f3b9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -599,6 +599,37 @@ static int ipp_set_mem_node(struct exynos_drm_ippdrv *ippdrv,
>  	return ret;
>  }
>  
> +static int ipp_put_mem_node(struct drm_device *drm_dev,
> +		struct drm_exynos_ipp_cmd_node *c_node,
> +		struct drm_exynos_ipp_mem_node *m_node)
> +{
> +	int i;
> +
> +	DRM_DEBUG_KMS("node[0x%x]\n", (int)m_node);
> +
> +	if (!m_node) {
> +		DRM_ERROR("invalid dequeue node.\n");
> +		return -EFAULT;
> +	}
> +
> +	DRM_DEBUG_KMS("ops_id[%d]\n", m_node->ops_id);
> +
> +	/* put gem buffer */
> +	for_each_ipp_planar(i) {
> +		unsigned long handle = m_node->buf_info.handles[i];
> +		if (handle)
> +			exynos_drm_gem_put_dma_addr(drm_dev, handle,
> +							c_node->filp);
> +	}
> +
> +	/* conditionally remove from queue */
> +	if (m_node->list.next)

How about do INIT_LIST_HEAD for list in ipp_get_mem_node()?

> +		list_del(&m_node->list);
> +	kfree(m_node);
> +
> +	return 0;
> +}
> +
>  static struct drm_exynos_ipp_mem_node
>  		*ipp_get_mem_node(struct drm_device *drm_dev,
>  		struct drm_file *file,
> @@ -634,7 +665,8 @@ static struct drm_exynos_ipp_mem_node
>  					qbuf->handle[i], file);
>  			if (IS_ERR(addr)) {
>  				DRM_ERROR("failed to get addr.\n");
> -				goto err_clear;
> +				ipp_put_mem_node(drm_dev, c_node, m_node);
> +				return ERR_PTR(-EFAULT);
>  			}
>  
>  			buf_info->handles[i] = qbuf->handle[i];
> @@ -649,40 +681,6 @@ static struct drm_exynos_ipp_mem_node
>  	mutex_unlock(&c_node->mem_lock);
>  
>  	return m_node;
> -
> -err_clear:
> -	kfree(m_node);
> -	return ERR_PTR(-EFAULT);
> -}
> -
> -static int ipp_put_mem_node(struct drm_device *drm_dev,
> -		struct drm_exynos_ipp_cmd_node *c_node,
> -		struct drm_exynos_ipp_mem_node *m_node)
> -{
> -	int i;
> -
> -	DRM_DEBUG_KMS("node[0x%x]\n", (int)m_node);
> -
> -	if (!m_node) {
> -		DRM_ERROR("invalid dequeue node.\n");
> -		return -EFAULT;
> -	}
> -
> -	DRM_DEBUG_KMS("ops_id[%d]\n", m_node->ops_id);
> -
> -	/* put gem buffer */
> -	for_each_ipp_planar(i) {
> -		unsigned long handle = m_node->buf_info.handles[i];
> -		if (handle)
> -			exynos_drm_gem_put_dma_addr(drm_dev, handle,
> -							c_node->filp);
> -	}
> -
> -	/* delete list in queue */
> -	list_del(&m_node->list);
> -	kfree(m_node);
> -
> -	return 0;
>  }
>  
>  static void ipp_free_event(struct drm_pending_event *event)
> 
