From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4 v2] ARM: DTS: use new compatible string for thermistors
 in trats2
Date: Wed, 25 Jun 2014 15:35:52 +0900
Message-ID: <53AA6DC8.8030201@samsung.com>
References: <1403677773-21141-1-git-send-email-ch.naveen@samsung.com>
 <1403677773-21141-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1403677773-21141-4-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/25/2014 03:29 PM, Naveen Krishna Chatradhi wrote:
> As Murata Manufactures the NTC based thermistors. The vendor
> name in the compatibility is preposed to change to "murata"
> 
> This patch uses the new compatibility string in exynos4412 based
> Trats2 board.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v1:
> None
> 
>  arch/arm/boot/dts/exynos4412-trats2.dts |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 11967f4..d35755a 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -771,7 +771,7 @@
>  	};
>  
>  	thermistor-ap@0 {
> -		compatible = "ntc,ncp15wb473";
> +		compatible = "murata,ncp15wb473";
>  		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
>  		pullup-ohm = <100000>;	 /* 100K */
>  		pulldown-ohm = <100000>; /* 100K */
> @@ -779,7 +779,7 @@
>  	};
>  
>  	thermistor-battery@1 {
> -		compatible = "ntc,ncp15wb473";
> +		compatible = "murata,ncp15wb473";
>  		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
>  		pullup-ohm = <100000>;	 /* 100K */
>  		pulldown-ohm = <100000>; /* 100K */
> 

Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks,
Chanwoo Choi
