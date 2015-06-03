From: Alexey Klimov <klimov.linux@gmail.com>
Subject: Re: [PATCH 1/9] drm/exynos: add error messages if clks failed to get enabled
Date: Wed, 3 Jun 2015 19:59:53 +0300
Message-ID: <CALW4P+KQ+y1GprbFQ=SfiFdYanD=JNs+7Q06wTqvmKCxyV8B_w@mail.gmail.com>
References: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:38239 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932715AbbFCQ7z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 12:59:55 -0400
Received: by wibdt2 with SMTP id dt2so20632884wib.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 09:59:53 -0700 (PDT)
In-Reply-To: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Joonyoung Shim <jy0922.shim@samsung.com>, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Gustavo,

On Wed, Jun 3, 2015 at 5:30 PM, Gustavo Padovan <gustavo@padovan.org> wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>
> Check error and call DRM_ERROR if clk_prepare_enable() fails.
>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 29 ++++++++++++++++++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 14 ++++++++++++--
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 31 +++++++++++++++++++++++++-----
>  3 files changed, 63 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index d659ba2..ffd7c3b 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -606,6 +606,7 @@ static void decon_init(struct decon_context *ctx)
>  static void decon_enable(struct exynos_drm_crtc *crtc)
>  {
>         struct decon_context *ctx = crtc->ctx;
> +       int ret;
>
>         if (!ctx->suspended)
>                 return;
> @@ -614,10 +615,30 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
>
>         pm_runtime_get_sync(ctx->dev);
>
> -       clk_prepare_enable(ctx->pclk);
> -       clk_prepare_enable(ctx->aclk);
> -       clk_prepare_enable(ctx->eclk);
> -       clk_prepare_enable(ctx->vclk);
> +       ret = clk_prepare_enable(ctx->pclk);
> +       if (ret < 0) {
> +               DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
> +               return;
> +               goto pclk_err;

This goto after return probably got here by mistake. Debug/rebase leftover?


<..snip..>


By the way, are you using some branch to prepare this patch?
Could you please check if you're able to apple it?
In current master branch that i see similar DRM_ERROR() messages are
already in place in similar functions. For example, in master branch i
see decon_poweron() instead of decon_enable() and fimd_poweron()
instead of fimd_enable() in your patch. Is there any chance that it's
slightly outdated?

Best regards,
Alexey Klimov
