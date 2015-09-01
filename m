From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 03/16] drm: bridge: analogix/dp: split exynos dp driver
 to bridge dir
Date: Tue, 01 Sep 2015 22:46:21 +0200
Message-ID: <2618155.E00Pak1qvi@phil>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441086598-24995-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1441086598-24995-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin
List-Id: linux-samsung-soc@vger.kernel.org

Am Dienstag, 1. September 2015, 13:49:58 schrieb Yakir Yang:
> Split the dp core driver from exynos directory to bridge
> directory, and rename the core driver to analogix_dp_*,
> leave the platform code to analogix_dp-exynos.
> 
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

[...]

> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c similarity index 50%
> rename from drivers/gpu/drm/exynos/exynos_dp_core.c
> rename to drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index bed0252..7d62f22 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

[...]

>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
> 
>  	ret = drm_connector_init(dp->drm_dev, connector,
> -				 &exynos_dp_connector_funcs,
> +				 &analogix_dp_connector_funcs,
>  				 DRM_MODE_CONNECTOR_eDP);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize connector with drm\n");
>  		return ret;
>  	}
> 
> -	drm_connector_helper_add(connector, &exynos_dp_connector_helper_funcs);
> +	drm_connector_helper_add(connector,
> +				 &analogix_dp_connector_helper_funcs);
>  	drm_connector_register(connector);

this should only run on exynos, as we're doing all our connector registration 
in the core driver after all components are bound, so I guess something like 
the following is needed:

       if (dp->plat_data && dp->plat_data->dev_type == EXYNOS_DP)
               drm_connector_register(connector);



>  	drm_mode_connector_attach_encoder(connector, encoder);
> 

[...]

> @@ -1301,7 +1239,10 @@ static int exynos_dp_bind(struct device *dev, struct
> device *master, void *data) if (IS_ERR(dp->reg_base))
>  		return PTR_ERR(dp->reg_base);
> 
> -	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "samsung,hpd-gpio", 0);
> +	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "hpd-gpios", 0);
> +	if (gpio_is_valid(dp->hpd_gpio))

this should be !gpio_is_valid ... i.e. only check the old property if the new 
one is _not_ valid


> +		dp->hpd_gpio = of_get_named_gpio(dev->of_node,
> +						 "samsung,hpd-gpio", 0);
> 
>  	if (gpio_is_valid(dp->hpd_gpio)) {
>  		/*
