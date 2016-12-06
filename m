From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] arm64: dts: exynos5433: Add PPMU dt node
Date: Tue, 6 Dec 2016 21:07:56 +0200
Message-ID: <20161206190756.GA12683@kozik-lap>
References: <1480663087-4590-1-git-send-email-cw00.choi@samsung.com>
 <1480663087-4590-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480663087-4590-4-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 02, 2016 at 04:18:05PM +0900, Chanwoo Choi wrote:
> This patch adds PPMU (Platform Performance Monitoring Unit) Device-tree node
> to measure the utilization of each IP in Exynos SoC.
> 
> - PPMU_D{0|1}_CPU are used to measure the utilization of MIF (Memory Interface)
>   block with VDD_MIF power source.
> - PPMU_D{0|1}_GENERAL are used to measure the utilization of INT(Internal)
>   block with VDD_INT power source.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 64226d5ae471..8c4ee84d5232 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -599,6 +599,30 @@
>  			clock-names = "fin_pll", "mct";
>  		};
>  
> +		ppmu_d0_cpu: ppmu@10480000 {
> +			compatible = "samsung,exynos-ppmu-v2";
> +			reg = <0x10480000 0x2000>;
> +			status = "disabled";

Why these are disabled? They have some external dependencies?

Best regards,
Krzysztof

> +		};
> +
> +		ppmu_d0_general: ppmu@10490000 {
> +			compatible = "samsung,exynos-ppmu-v2";
> +			reg = <0x10490000 0x2000>;
> +			status = "disabled";
> +		};
> +
> +		ppmu_d1_cpu: ppmu@104b0000 {
> +			compatible = "samsung,exynos-ppmu-v2";
> +			reg = <0x104b0000 0x2000>;
> +			status = "disabled";
> +		};
> +
> +		ppmu_d1_general: ppmu@104c0000 {
> +			compatible = "samsung,exynos-ppmu-v2";
> +			reg = <0x104c0000 0x2000>;
> +			status = "disabled";
> +		};
> +
>  		pinctrl_alive: pinctrl@10580000 {
>  			compatible = "samsung,exynos5433-pinctrl";
>  			reg = <0x10580000 0x1a20>, <0x11090000 0x100>;
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
