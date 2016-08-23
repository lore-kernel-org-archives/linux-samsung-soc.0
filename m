From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: exynos: Use 'hpd-gpios' instead of
 'hpd-gpio'
Date: Tue, 23 Aug 2016 15:10:44 -0500
Message-ID: <20160823201044.GA1734@rob-hp-laptop>
References: <1471943619-6102-1-git-send-email-woogyom.kim@gmail.com>
 <1471943619-6102-3-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471943619-6102-3-git-send-email-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 23, 2016 at 06:13:37PM +0900, Milo Kim wrote:
> This patch enables getting a HPD GPIO descriptor quickly.
> The exynos-hdmi driver uses "hpd" for HDMI hot plug detection.
> 
> 	static int hdmi_resources_init(struct hdmi_context *hdata)
> 	{
> 		...
> 		hdata->hpd_gpio = devm_gpiod_get(dev, "hpd", GPIOD_IN);
> 		...
> 	}
> 
> This calls 'of_find_gpio()' and it generates the GPIO consumer ID by referring
> GPIO suffix. So 'hpd-gpios' is preferred on getting a GPIO descriptor.
> 
> However, if the device tree uses 'hpd-gpio', then the exynos-hdmi driver
> always retries to get a GPIO descriptor because the first GPIO suffix is not
> 'gpio' but 'gpios'. So you always see the debug message below.
> 
> 	of_get_named_gpiod_flags: can't parse 'hpd-gpios' property of node '/soc/hdmi@14530000[0]'
> 
> Use the preferred property, 'hpd-gpios' instead of 'hpd-gpio'.
> 
> Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt | 4 ++--
>  arch/arm/boot/dts/exynos4210-universal_c210.dts                  | 2 +-
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi                  | 2 +-
>  arch/arm/boot/dts/exynos5250-arndale.dts                         | 2 +-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts                        | 2 +-
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi                    | 2 +-
>  arch/arm/boot/dts/exynos5250-spring.dts                          | 2 +-
>  arch/arm/boot/dts/exynos5420-peach-pit.dts                       | 2 +-
>  arch/arm/boot/dts/exynos5420-smdk5420.dts                        | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi               | 2 +-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts                        | 2 +-
>  11 files changed, 12 insertions(+), 12 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
