From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos/mixer: Remove unused local variable priv
Date: Wed, 18 Jul 2018 22:13:03 +0200
Message-ID: <6b613193-a3f6-d824-194d-004f87afacd4@math.uni-bielefeld.de>
References: <20180718195520.5226-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718195520.5226-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

looks good to me!

Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

- Tobias


Krzysztof Kozlowski wrote:
> Remove local variable 'priv' to fix GCC warning:
> 
>     drivers/gpu/drm/exynos/exynos_mixer.c: In function 'mixer_initialize':
>     drivers/gpu/drm/exynos/exynos_mixer.c:840:29: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 272c79f5f5bf..b86ae2ab9590 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -837,8 +837,6 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
>  			struct drm_device *drm_dev)
>  {
>  	int ret;
> -	struct exynos_drm_private *priv;
> -	priv = drm_dev->dev_private;
>  
>  	mixer_ctx->drm_dev = drm_dev;
>  
> 
