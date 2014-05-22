From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix nested calls to lock mutex in drm resume
Date: Thu, 22 May 2014 19:46:44 +0530
Message-ID: <CAPdUM4M3MdM2Dm2GPYXD-A18YDVGmKKBz+-uGDOmiTO=WUKu8A@mail.gmail.com>
References: <1398865294-6754-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:59163 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182AbaEVOQp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 10:16:45 -0400
Received: by mail-wi0-f175.google.com with SMTP id f8so9337221wiw.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 07:16:44 -0700 (PDT)
In-Reply-To: <1398865294-6754-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Inki,

This is another one which has not got reviewed. Please review.

Regards,
Rahul Sharma

On 30 April 2014 19:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> While testing S2R on exynos board, system is hanging and
> rebooting due to nested mutex_lock calls in exynos drm
> resume callback. Changing the order of the calls is fixing
> the issue.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
> Based on exynos-drm-next branch in Inki Dae's tree.
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index bb7dfee..2bb6233 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -184,8 +184,8 @@ static int exynos_drm_resume(struct drm_device *dev)
>                         connector->funcs->dpms(connector, connector->dpms);
>         }
>
> -       drm_helper_resume_force_mode(dev);
>         drm_modeset_unlock_all(dev);
> +       drm_helper_resume_force_mode(dev);
>
>         return 0;
>  }
> --
> 1.7.9.5
>
