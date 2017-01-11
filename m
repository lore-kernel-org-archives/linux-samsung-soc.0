From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 1/4] drm/exynos: mic: Add mode_set callback function
Date: Wed, 11 Jan 2017 14:33:12 +0900
Message-ID: <5875C398.6000906@samsung.com>
References: <1483611609-23522-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170105102012epcas5p3666c67cfc82d2439c993f917f8e2d0ce@epcas5p3.samsung.com>
 <1483611609-23522-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1483611609-23522-2-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Applied.

Thanks.

2017년 01월 05일 19:20에 Hoegeun Kwon 이(가) 쓴 글:
> Before applying the patch, used the of_get_videomode function to
> parse the display-timings in the panel which is the child driver
> of dsi in the devicetree. this is wrong. So removed the
> of_get_videomode and fixed to get videomode struct through
> mode_set callback function.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index a0def0b..fed1a94 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -286,13 +286,6 @@ static int parse_dt(struct exynos_mic *mic)
>  			}
>  			nodes[j++] = remote_node;
>  
> -			ret = of_get_videomode(remote_node,
> -							&mic->vm, 0);
> -			if (ret) {
> -				DRM_ERROR("mic: failed to get videomode");
> -				goto exit;
> -			}
> -
>  			break;
>  		default:
>  			DRM_ERROR("mic: Unknown endpoint from MIC");
> @@ -329,6 +322,17 @@ static void mic_post_disable(struct drm_bridge *bridge)
>  	mutex_unlock(&mic_mutex);
>  }
>  
> +static void mic_mode_set(struct drm_bridge *bridge,
> +			struct drm_display_mode *mode,
> +			struct drm_display_mode *adjusted_mode)
> +{
> +	struct exynos_mic *mic = bridge->driver_private;
> +
> +	mutex_lock(&mic_mutex);
> +	drm_display_mode_to_videomode(mode, &mic->vm);
> +	mutex_unlock(&mic_mutex);
> +}
> +
>  static void mic_pre_enable(struct drm_bridge *bridge)
>  {
>  	struct exynos_mic *mic = bridge->driver_private;
> @@ -377,6 +381,7 @@ static void mic_enable(struct drm_bridge *bridge) { }
>  static const struct drm_bridge_funcs mic_bridge_funcs = {
>  	.disable = mic_disable,
>  	.post_disable = mic_post_disable,
> +	.mode_set = mic_mode_set,
>  	.pre_enable = mic_pre_enable,
>  	.enable = mic_enable,
>  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
