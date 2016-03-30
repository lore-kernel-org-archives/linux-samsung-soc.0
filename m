From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v14, 01/17] drm: bridge: analogix/dp: split exynos dp driver to
 bridge directory
Date: Wed, 30 Mar 2016 13:32:04 -0700
Message-ID: <20160330203204.GA24156@roeck-us.net>
References: <1455534576-1486-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455534576-1486-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Feb 15, 2016 at 07:09:36PM +0800, Yakir Yang wrote:
> Split the dp core driver from exynos directory to bridge directory,
> and rename the core driver to analogix_dp_*, rename the platform
> code to exynos_dp.
> 
> Beside the new analogix_dp driver would export six hooks.
> "analogix_dp_bind()" and "analogix_dp_unbind()"
> "analogix_dp_suspned()" and "analogix_dp_resume()"
> "analogix_dp_detect()" and "analogix_dp_get_modes()"
> 
> The bind/unbind symbols is used for analogix platform driver to connect
> with analogix_dp core driver. And the detect/get_modes is used for analogix
> platform driver to init the connector.
> 
> They reason why connector need register in helper driver is rockchip drm
> haven't implement the atomic API, but Exynos drm have implement it, so
> there would need two different connector helper functions, that's why we
> leave the connector register in helper driver.
> 
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
[ ... ]

> diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> new file mode 100644
> index 0000000..9107b86
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp_core.o analogix_dp_reg.o

This results in the following build errors if DRM_ANALOGIX_DP
is configured as module.

ERROR: "analogix_dp_start_video" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!
ERROR: "analogix_dp_get_lane0_link_training" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!
ERROR: "analogix_dp_get_lane1_link_training" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!
ERROR: "analogix_dp_get_lane2_link_training" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!
ERROR: "analogix_dp_get_lane3_link_training" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!
ERROR: "analogix_dp_get_lane_count" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!
ERROR: "analogix_dp_get_link_bandwidth" [drivers/gpu/drm/bridge/analogix/analogix_dp_core.ko] undefined!

[ and so on ]

It should probably be something like

analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o
obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
