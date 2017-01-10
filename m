From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: exynos5433: add DECON_TV node
Date: Tue, 10 Jan 2017 11:18:33 +0900
Message-ID: <58744479.90002@samsung.com>
References: <CGME20170109104054eucas1p258d1df5ecff1d8b8c9aa882d8c86d5df@eucas1p2.samsung.com>
 <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1483958437-6572-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2017년 01월 09일 19:40, Andrzej Hajda wrote:
> DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
> or 2nd DSI path.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
> Hi Krzysztof,
> 
> These patches are based on latest patches separating tm2 and tm2e and
> touchscreen patches. I hope this is good base.
> Thanks all for quick response/review.
> 
> Regards
> Andrzej
> 
> v2:
>   - replaced magic numbers with macros,
>   - removed power domains,
>   - removed 0x prefixes from node names
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 68f764e..5552f77 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -814,6 +814,29 @@
>  			};
>  		};
>  
> +		decon_tv: decon@13880000 {

The 'decon_tv' node better to be located under the 'decon' node
because of base address ordering. (decon@13800000, decon_tv@13880000)

> +			compatible = "samsung,exynos5433-decon-tv";
> +			reg = <0x13880000 0x20b8>;
> +			clocks = <&cmu_disp CLK_PCLK_DECON_TV>,
> +				 <&cmu_disp CLK_ACLK_DECON_TV>,
> +				 <&cmu_disp CLK_ACLK_SMMU_TV0X>,
> +				 <&cmu_disp CLK_ACLK_XIU_TV0X>,
> +				 <&cmu_disp CLK_PCLK_SMMU_TV0X>,
> +				 <&cmu_disp CLK_SCLK_DECON_TV_VCLK>,
> +				 <&cmu_disp CLK_SCLK_DECON_TV_ECLK>;
> +			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
> +				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
> +				      "sclk_decon_vclk", "sclk_decon_eclk";
> +			samsung,disp-sysreg = <&syscon_disp>;
> +			interrupt-names = "fifo", "vsync", "lcd_sys";
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
> +			iommu-names = "m0", "m1";
> +		};
> +

[snip]

Except for ordering of 'decon_tv' node, looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Also, I tested these patches on TM2 board
with Hoegeun Kwon (hoeguen.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org). It is well working.

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
