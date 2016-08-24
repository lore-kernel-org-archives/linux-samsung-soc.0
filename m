From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: exynos: Use 'hpd-gpios' instead of
 'hpd-gpio'
Date: Wed, 24 Aug 2016 21:13:00 +0200
Message-ID: <20160824191300.GA31869@kozik-book>
References: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
 <1472044039-16536-3-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472044039-16536-3-git-send-email-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 24, 2016 at 10:07:16PM +0900, Milo Kim wrote:
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

Thanks for fixing this, applied!

BR,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
