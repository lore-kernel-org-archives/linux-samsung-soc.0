From: hoegeun kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: exynos5433: add HDMI node
Date: Tue, 10 Jan 2017 11:31:53 +0900
Message-ID: <526f83ea-9f16-c2e2-b835-0630a7ec8f4d@samsung.com>
References: <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
 <CGME20170109104054eucas1p1e67bb21985880fec1aaeec1969dbe5e0@eucas1p1.samsung.com>
 <1483958437-6572-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1483958437-6572-2-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,


Tested-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>


Hoegeun



On 01/09/2017 07:40 PM, Andrzej Hajda wrote:
> HDMI converts RGB/I80 signal from DECON_TV to HDMI/TMDS video stream.
>
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> v2:
>    - replaced magic numbers with macros,
>    - removed power domains
> ---
>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 5552f77..f82d26e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -837,6 +837,35 @@
>   			iommu-names = "m0", "m1";
>   		};
>   
> +		hdmi: hdmi@13970000 {
> +			compatible = "samsung,exynos5433-hdmi";
> +			reg = <0x13970000 0x70000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cmu_disp CLK_PCLK_HDMI>,
> +				<&cmu_disp CLK_PCLK_HDMIPHY>,
> +				<&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>,
> +				<&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
> +				<&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY>,
> +				<&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_CLKO_USER>,
> +				<&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY>,
> +				<&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL_CLKO_USER>,
> +				<&xxti>, <&cmu_disp CLK_SCLK_HDMI_SPDIF>;
> +			clock-names = "hdmi_pclk", "hdmi_i_pclk",
> +				"i_tmds_clk", "i_pixel_clk",
> +				"tmds_clko", "tmds_clko_user",
> +				"pixel_clko", "pixel_clko_user",
> +				"oscclk", "i_spdif_clk";
> +			phy = <&hdmiphy>;
> +			ddc = <&hsi2c_11>;
> +			samsung,syscon-phandle = <&pmu_system_controller>;
> +			samsung,sysreg-phandle = <&syscon_disp>;
> +			status = "disabled";
> +		};
> +
> +		hdmiphy: hdmiphy@13af0000 {
> +			reg = <0x13af0000 0x80>;
> +		};
> +
>   		syscon_disp: syscon@13b80000 {
>   			compatible = "syscon";
>   			reg = <0x13b80000 0x1010>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
