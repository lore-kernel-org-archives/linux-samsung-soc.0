From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos5433-tm2: enable HDMI/TV path
Date: Tue, 10 Jan 2017 11:20:14 +0900
Message-ID: <587444DE.1070301@samsung.com>
References: <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
 <CGME20170109104055eucas1p20e90f616b4bb44b4759021885f560c08@eucas1p2.samsung.com>
 <1483958437-6572-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1483958437-6572-3-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Looks good to me. I tested this patch on TM2 board
with Hoegeun Kwon (hoeguen.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org). It is well working.

Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

On 2017년 01월 09일 19:40, Andrzej Hajda wrote:
> TV path consist of following interconnected components:
> - DECON_TV - display controller,
> - HDMI - video signal converter RGB / HDMI,
> - MHL - video signal converter HDMI / MHL,
> - DDC - i2c slave device for EDID reading (on hsi2c_11 bus).
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> v2:
>   - replaced magic numbers with macros,
>   - removed assigned-clock properties from sii8620 -
>     PMU clock is already confgured in PMU node
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 669bb1f..ca90e6a 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -281,6 +281,22 @@
>  	};
>  };
>  
> +&decon_tv {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			tv_to_hdmi: endpoint {
> +				remote-endpoint = <&hdmi_to_tv>;
> +			};
> +		};
> +	};
> +};
> +
>  &dsi {
>  	status = "okay";
>  	vddcore-supply = <&ldo6_reg>;
> @@ -304,6 +320,33 @@
>  	};
>  };
>  
> +&hdmi {
> +	hpd-gpios = <&gpa3 0 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +	vdd-supply = <&ldo6_reg>;
> +	vdd_osc-supply = <&ldo7_reg>;
> +	vdd_pll-supply = <&ldo6_reg>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			hdmi_to_tv: endpoint {
> +				remote-endpoint = <&tv_to_hdmi>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			hdmi_to_mhl: endpoint {
> +				remote-endpoint = <&mhl_to_hdmi>;
> +			};
> +		};
> +	};
> +};
> +
>  &hsi2c_0 {
>  	status = "okay";
>  	clock-frequency = <2500000>;
> @@ -692,6 +735,28 @@
>  	};
>  };
>  
> +&hsi2c_7 {
> +	status = "okay";
> +
> +	sii8620@39 {
> +		reg = <0x39>;
> +		compatible = "sil,sii8620";
> +		cvcc10-supply = <&ldo36_reg>;
> +		iovcc18-supply = <&ldo34_reg>;
> +		interrupt-parent = <&gpf0>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios = <&gpv7 0 GPIO_ACTIVE_LOW>;
> +		clocks = <&pmu_system_controller 0>;
> +		clock-names = "xtal";
> +
> +		port {
> +			mhl_to_hdmi: endpoint {
> +				remote-endpoint = <&hdmi_to_mhl>;
> +			};
> +		};
> +	};
> +};
> +
>  &hsi2c_8 {
>  	status = "okay";
>  
> @@ -735,6 +800,10 @@
>  	};
>  };
>  
> +&hsi2c_11 {
> +	status = "okay";
> +};
> +
>  &i2s0 {
>  	status = "okay";
>  };
> 


-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
