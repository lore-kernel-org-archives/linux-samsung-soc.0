From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: g2d: make ioctls more robust
Date: Sun, 3 Aug 2014 16:54:46 +0900
Message-ID: <CAAQKjZOC34azEuBzwdAXtWhWjqnVY40PMUmWN3PA6NKMf1T-uQ@mail.gmail.com>
References: <1406127433-3914-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1406127433-3914-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:38560 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbaHCHys (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Aug 2014 03:54:48 -0400
Received: by mail-we0-f177.google.com with SMTP id w62so6173538wes.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Aug 2014 00:54:46 -0700 (PDT)
In-Reply-To: <1406127433-3914-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, t.figa@samsung.com

2014-07-23 23:57 GMT+09:00 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
> Both exynos_g2d_set_cmdlist_ioctl and exynos_g2d_exec_ioctl don't check
> if the G2D was succesfully probe. If that is not the case, then g2d_priv
> is just NULL and extracting 'dev' from it in the next step  is going to
> produce a kernel oops.
>
> Add proper checks and return ENODEV if the G2D is not available.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 5fa1bb6..8c62423 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1056,7 +1056,7 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
>  {
>         struct drm_exynos_file_private *file_priv = file->driver_priv;
>         struct exynos_drm_g2d_private *g2d_priv = file_priv->g2d_priv;
> -       struct device *dev = g2d_priv->dev;
> +       struct device *dev;
>         struct g2d_data *g2d;
>         struct drm_exynos_g2d_set_cmdlist *req = data;
>         struct drm_exynos_g2d_cmd *cmd;
> @@ -1067,6 +1067,10 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
>         int size;
>         int ret;
>
> +       if (!g2d_priv)
> +               return -ENODEV;
> +
> +       dev = g2d_priv->dev;
>         if (!dev)
>                 return -ENODEV;
>
> @@ -1223,13 +1227,17 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
>  {
>         struct drm_exynos_file_private *file_priv = file->driver_priv;
>         struct exynos_drm_g2d_private *g2d_priv = file_priv->g2d_priv;
> -       struct device *dev = g2d_priv->dev;
> +       struct device *dev;
>         struct g2d_data *g2d;
>         struct drm_exynos_g2d_exec *req = data;
>         struct g2d_runqueue_node *runqueue_node;
>         struct list_head *run_cmdlist;
>         struct list_head *event_list;
>
> +       if (!g2d_priv)
> +               return -ENODEV;
> +
> +       dev = g2d_priv->dev

It seems that you have no build test because above line incurs build
error. Anyway I fixed it up.

Thanks,
Inki Dae

>         if (!dev)
>                 return -ENODEV;
>
> --
> 1.8.5.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
