From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFT] arm64 dts: exynos: Fix invalid GIC interrupt flags in
 exynos7
Date: Fri, 16 Sep 2016 22:22:03 +0200
Message-ID: <20160916202203.GA25900@kozik-lap>
References: <1474054971-16831-1-git-send-email-krzk@kernel.org>
 <1474056073-8071-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474056073-8071-1-git-send-email-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 16, 2016 at 10:01:13PM +0200, Krzysztof Kozlowski wrote:
> Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts and
> generates an error:
> 	genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)
> 
> The GIC requires shared interrupts to be edge rising or level high.
> Platform declares support for both.  Choose level high everywhere.
> 
> Reported-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Reported-by: Alban Browaeys <alban.browaeys-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 20 +++++--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi         | 69 +++++++++++++------------
>  2 files changed, 51 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> index f77ddaf21d04..983c63ba38c8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
> @@ -20,8 +20,14 @@
>  		interrupt-controller;
>  		interrupt-parent = <&gic>;
>  		#interrupt-cells = <2>;
> -		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> -			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>;
> +		interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 3 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 4 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 5 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 7 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
>  	gpa1: gpa1 {
> @@ -31,8 +37,14 @@
>  		interrupt-controller;
>  		interrupt-parent = <&gic>;
>  		#interrupt-cells = <2>;
> -		interrupts = <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> -			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
> +		interrupts = <0 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 9 IRQ_TYPE_LEVEL_HIGH>

There is an obvious typo here... but beside that it compiles. It is
trivial so I won't resend now.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
