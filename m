From: hoegeun kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos5433-tm2: enable HDMI/TV path
Date: Tue, 10 Jan 2017 11:32:12 +0900
Message-ID: <af05bd00-8db4-c639-dd7d-56e73a8ff5e9@samsung.com>
References: <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
 <CGME20170109104055eucas1p20e90f616b4bb44b4759021885f560c08@eucas1p2.samsung.com>
 <1483958437-6572-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37219 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161988AbdAJCcN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 21:32:13 -0500
In-reply-to: <1483958437-6572-3-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi Andrzej,


Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>


Hoegeun



On 01/09/2017 07:40 PM, Andrzej Hajda wrote:
> TV path consist of following interconnected components:
> - DECON_TV - display controller,
> - HDMI - video signal converter RGB / HDMI,
> - MHL - video signal converter HDMI / MHL,
> - DDC - i2c slave device for EDID reading (on hsi2c_11 bus).
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> v2:
>    - replaced magic numbers with macros,
>    - removed assigned-clock properties from sii8620 -
>      PMU clock is already confgured in PMU node
> ---
>   .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 69 ++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 669bb1f..ca90e6a 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -281,6 +281,22 @@
>   	};
>   };
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
>   &dsi {
>   	status = "okay";
>   	vddcore-supply = <&ldo6_reg>;
> @@ -304,6 +320,33 @@
>   	};
>   };
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
>   &hsi2c_0 {
>   	status = "okay";
>   	clock-frequency = <2500000>;
> @@ -692,6 +735,28 @@
>   	};
>   };
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
>   &hsi2c_8 {
>   	status = "okay";
>   
> @@ -735,6 +800,10 @@
>   	};
>   };
>   
> +&hsi2c_11 {
> +	status = "okay";
> +};
> +
>   &i2s0 {
>   	status = "okay";
>   };
