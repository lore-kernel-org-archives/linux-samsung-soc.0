From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 07/10] drm/bridge: analogix_dp: passing the connector
 as an argument in .get_modes()
Date: Tue, 14 Jun 2016 18:26:25 +0200
Message-ID: <20160614162625.GZ1338@phenom.ffwll.local>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904789-1021-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34059 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029AbcFNQ0f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:26:35 -0400
Received: by mail-wm0-f68.google.com with SMTP id n184so23650455wmn.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:26:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1465904789-1021-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>, Tomasz Figa <tomasz.figa@chromium.com>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

On Tue, Jun 14, 2016 at 07:46:29PM +0800, Yakir Yang wrote:
> It's better to pass the connector to platform driver in .get_modes()
> callback, just like what the .get_modes() helper function designed.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v3:
> - Avoid to change any internal driver state in .mode_valid interface. (Tomasz, reviewed at Google Gerrit)
>     [https://chromium-review.googlesource.com/#/c/346318/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@113]
> 
> Changes in v2: None

Needs cc: Archit Tajena as drm_bridge maintainer (or at least inofficial
one), plus ack imo.
-Daniel

> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 4 ++--
>  include/drm/bridge/analogix_dp.h                   | 3 ++-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 4a1b3b8..1a890fa 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -938,7 +938,7 @@ int analogix_dp_get_modes(struct drm_connector *connector)
>  		num_modes += drm_panel_get_modes(dp->plat_data->panel);
>  
>  	if (dp->plat_data->get_modes)
> -		num_modes += dp->plat_data->get_modes(dp->plat_data);
> +		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
>  
>  	return num_modes;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index 468498e..8a555ed 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -67,10 +67,10 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
>  	return exynos_dp_crtc_clock_enable(plat_data, false);
>  }
>  
> -static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data)
> +static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
> +			       struct drm_connector *connector)
>  {
>  	struct exynos_dp_device *dp = to_dp(plat_data);
> -	struct drm_connector *connector = &dp->connector;
>  	struct drm_display_mode *mode;
>  	int num_modes = 0;
>  
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 82b8135..181db09 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -34,7 +34,8 @@ struct analogix_dp_plat_data {
>  	int (*power_off)(struct analogix_dp_plat_data *);
>  	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
>  		      struct drm_connector *);
> -	int (*get_modes)(struct analogix_dp_plat_data *);
> +	int (*get_modes)(struct analogix_dp_plat_data *,
> +			 struct drm_connector *);
>  };
>  
>  int analogix_dp_resume(struct device *dev);
> -- 
> 1.9.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
