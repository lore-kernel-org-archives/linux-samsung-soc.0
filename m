From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ARM: dts: exynos: Remove the display-timing and
 delay from rinato dts
Date: Tue, 29 Aug 2017 11:52:16 +0900
Message-ID: <2be78f06-8c3a-0076-a19b-07d501c3d460@samsung.com>
References: <1499912443-3671-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170713022057epcas1p464b817a426638cc1566e665aa7903ed7@epcas1p4.samsung.com>
        <1499912443-3671-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1499912443-3671-4-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

The driver has been merged into exynos-drm-misc.
Could you please check this patch(3/3).

Best regards,
Hoegeun

On 07/13/2017 11:20 AM, Hoegeun Kwon wrote:
> The display-timing and delay are included in the panel driver. So it
> should be removed in dts.
>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/exynos3250-rinato.dts | 22 ----------------------
>   1 file changed, 22 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 443e0c9..6b70c8d 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -242,28 +242,6 @@
>   		vci-supply = <&ldo20_reg>;
>   		reset-gpios = <&gpe0 1 GPIO_ACTIVE_LOW>;
>   		te-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
> -		power-on-delay= <30>;
> -		power-off-delay= <120>;
> -		reset-delay = <5>;
> -		init-delay = <100>;
> -		flip-horizontal;
> -		flip-vertical;
> -		panel-width-mm = <29>;
> -		panel-height-mm = <29>;
> -
> -		display-timings {
> -			timing-0 {
> -				clock-frequency = <4600000>;
> -				hactive = <320>;
> -				vactive = <320>;
> -				hfront-porch = <1>;
> -				hback-porch = <1>;
> -				hsync-len = <1>;
> -				vfront-porch = <150>;
> -				vback-porch = <1>;
> -				vsync-len = <2>;
> -			};
> -		};
>   
>   		port {
>   			dsi_in: endpoint {

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
