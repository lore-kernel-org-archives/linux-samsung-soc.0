From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 1/6] drm/exynos: remove leftover code using event_list
Date: Fri, 30 Jan 2015 11:21:54 +0900
Message-ID: <54CAEAC2.50709@samsung.com>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8557 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752880AbbA3CVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 21:21:53 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIY00547X8G5NB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Jan 2015 11:21:52 +0900 (KST)
In-reply-to: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, =?UTF-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVw==?= =?UTF-8?B?IFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekA==?= =?UTF-8?B?JyI=?= <inki.dae@samsung.com>

+Cc Inki,

Hi,

On 01/23/2015 09:42 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> The drm_file event_list hasn't been used anymore by exynos, so we don't
> need any code to clean it.
> 

No, it is used from drm core e.g. drm_irq.c file.

Thanks.

> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 25ba362..b60fd9b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -256,11 +256,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
>  		}
>  	}
>  
> -	/* Release all events handled by page flip handler but not freed. */
> -	list_for_each_entry_safe(e, et, &file->event_list, link) {
> -		list_del(&e->link);
> -		e->destroy(e);
> -	}
>  	spin_unlock_irqrestore(&dev->event_lock, flags);
>  
>  	kfree(file->driver_priv);
> 
