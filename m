From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] drm/exynos: remove redundant mutex_unlock
Date: Fri, 23 May 2014 16:34:33 +0530
Message-ID: <CAK9yfHw4T8OwQEUQKyy4x94XoBRfX1ZC=gg0kkq9wujwemADPw@mail.gmail.com>
References: <1400842674-20499-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:58739 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751458AbaEWLEe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 07:04:34 -0400
Received: by mail-oa0-f53.google.com with SMTP id m1so5455286oag.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 04:04:34 -0700 (PDT)
In-Reply-To: <1400842674-20499-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

On 23 May 2014 16:27, Andrzej Hajda <a.hajda@samsung.com> wrote:
> The patch fixes unlocking in exynos_drm_component_del.

This patch actually removes multiple unlocking issue.

>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi Inki,
>
> This patch is based on exynos_drm_next branch.
>
> Regards
> Andrzej
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 4cef88f..c5a401ae 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -417,7 +417,6 @@ void exynos_drm_component_del(struct device *dev,
>                 if (dev == cdev->dev) {
>                         list_del(&cdev->list);
>                         kfree(cdev);
> -                       mutex_unlock(&drm_component_lock);
>                         break;
>                 }
>         }
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
