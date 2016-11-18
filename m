From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: exynos: add the mshc_2 node for supporting
 T-Flash
Date: Fri, 18 Nov 2016 11:38:09 +0100
Message-ID: <26cc8cc3-0a91-e253-5a10-8e080c3e486f@samsung.com>
References: <CGME20161118071238epcas4p222702d2c716bf2d7cd9c9354ab99a189@epcas4p2.samsung.com>
 <20161118071224.12876-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161118071224.12876-1-jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Dear Jaehoon,


On 2016-11-18 08:12, Jaehoon Chung wrote:
> Add the mshc_2 node for supporting T-flash.
>
> And it needs to add the "mshc*" aliases. Because dwmmc driver should be
> assigned to "ctrl_id" after parsing to "mshc".
> If there is no aliases for mshc, then it might be set to the wrong
> capabilities.
>
> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 9ea3f32..75dab01 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -42,6 +42,8 @@
>   		spi2 = &spi_2;
>   		spi3 = &spi_3;
>   		spi4 = &spi_4;
> +		mshc0 = &mshc_0;
> +		mshc2 = &mshc_2;
>   	};
>   
>   	chosen {
> @@ -661,6 +663,23 @@
>   	assigned-clock-rates = <800000000>;
>   };
>   
> +&mshc_2 {
> +	status = "okay";
> +	num-slots = <1>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	cd-gpios = <&gpa2 4 0>;

cd-gpios = <&gpa2 4 GPIO_ACTIVE_HIGH>;

> +	cd-inverted;
> +	card-detect-delay = <200>;
> +	samsung,dw-mshc-ciu-div = <3>;
> +	samsung,dw-mshc-sdr-timing = <0 4>;
> +	samsung,dw-mshc-ddr-timing = <0 2>;
> +	fifo-depth = <0x80>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
> +	bus-width = <4>;
> +};
> +
>   &pinctrl_alive {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&initial_alive>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
