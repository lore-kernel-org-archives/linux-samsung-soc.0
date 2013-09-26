From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH V2] ARM: dts: Remove DP PHY node from exynos5250.dtsi
Date: Thu, 26 Sep 2013 13:54:33 +0900
Message-ID: <02c501ceba74$7e748060$7b5d8120$@org>
References: <003601cea228$ef97fd30$cec7f790$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <003601cea228$ef97fd30$cec7f790$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Vikas Sajjan' <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'devicetree' <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'InKi Dae' <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ajay kumar' <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> Since DP PHY driver is not yet merged, DP PHY node should be
> removed from exynos5250.dtsi.
> 
> Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v1:
> - Removed duplicated properties such as #address-cells, #size-cells.
> 
>  arch/arm/boot/dts/exynos5250.dtsi |   13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 864ae90..c3d6e3b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -625,17 +625,14 @@
>  		interrupts = <0 94 0>;
>  	};
> 
> -	dp_phy: video-phy@10040720 {
> -		compatible = "samsung,exynos5250-dp-video-phy";
> -		reg = <0x10040720 4>;
> -		#phy-cells = <0>;
> -	};
> -
>  	dp-controller@145B0000 {
>  		clocks = <&clock 342>;
>  		clock-names = "dp";
> -		phys = <&dp_phy>;
> -		phy-names = "dp";
> +
> +		dptx-phy {
> +			reg = <0x10040720>;
> +			samsung,enable-mask = <1>;
> +		};
>  	};
> 
>  	fimd@14400000 {
> --
> 1.7.10.4

OK, this is required only for 3.12 so please re-post patch for enabling DP
PHY node for 3.13.

Applied into fixes for 3.12.

Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
