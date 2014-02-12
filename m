From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC PATCH v2 02/21] drm/exynos: delay fbdev initialization until
 an output is connected
Date: Wed, 12 Feb 2014 17:33:56 +0530
Message-ID: <CAK9yfHxyoew3L+k2sN_vHZuy=GWk5arYtQyyvAvUx_4U-y5f5g@mail.gmail.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
	<1392204688-4591-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:46214 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530AbaBLMD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 07:03:57 -0500
Received: by mail-ob0-f178.google.com with SMTP id wn1so10497547obc.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 04:03:56 -0800 (PST)
In-Reply-To: <1392204688-4591-3-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>

+cc Inki Dae

Looks like you missed CCing Exynos DRM maintainers.

On 12 February 2014 17:01, Andrzej Hajda <a.hajda@samsung.com> wrote:
> In case fbdev is initialized before any output is connected,
> fb resolution defaults to 1024x768. After that any output with
> bigger resolution is ignored and fbdev is not displayed.
> The patch postpones fbdev initialization to avoid such situation.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
[snip]

>  static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index e7c2f2d..9a5ec83 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -249,8 +249,10 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
>                 return 0;
>
>         fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
> -       if (!fbdev)
> +       if (!fbdev) {
> +               DRM_ERROR("failed to allocate fbdev.\n");

This message is not needed as kzalloc gives oom message.

>                 return -ENOMEM;
> +       }

-- 
With warm regards,
Sachin
