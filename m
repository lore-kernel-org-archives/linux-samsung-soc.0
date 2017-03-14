From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 5/8] ARM: dts: exynos: Enable watchdog on all Exynos4
 boards
Date: Tue, 14 Mar 2017 14:00:20 +0100
Message-ID: <4885890.jl6tPtmvlV@amdc3058>
References: <20170311172527.16368-1-krzk@kernel.org>
 <20170311172527.16368-6-krzk@kernel.org>
 <CGME20170314130022epcas5p4e771120ec9ea3f488e1dee644c0b1d07@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170311172527.16368-6-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Saturday, March 11, 2017 07:25:24 PM Krzysztof Kozlowski wrote:
> Watchdog module does not have external dependencies so it can be safely
> enabled in exynos4.dtsi thus making it available for all Exynos4-based
> boards.

Please fix the patch description (patch #3 moved watchdog node out from
exynos4.dtsi).

> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts         | 4 ----
>  arch/arm/boot/dts/exynos4210.dtsi               | 1 -
>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 4 ----
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
>  arch/arm/boot/dts/exynos4412-origen.dts         | 4 ----
>  arch/arm/boot/dts/exynos4412.dtsi               | 1 -
>  6 files changed, 18 deletions(-)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
