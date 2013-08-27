From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V4] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Tue, 27 Aug 2013 12:01:45 +0100
Message-ID: <20130827110145.GG19893@e106331-lin.cambridge.arm.com>
References: <1377595351-30233-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:39080 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752194Ab3H0LBs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 07:01:48 -0400
Content-Disposition: inline
In-Reply-To: <1377595351-30233-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "t.figa@samsung.com" <t.figa@samsung.com>, "dianders@chromium.org" <dianders@chromium.org>, "cjb@laptop.org" <cjb@laptop.org>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Tue, Aug 27, 2013 at 10:22:31AM +0100, Yuvaraj Kumar C D wrote:
> This patch adds the device tree node entries for exynos5420 SOC.
> Exynos5420 has a different version of DWMMC controller,so a new
> compatible string is used to distinguish it from the prior SOC's.
> 
> This patch depends on
> 	mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
> 
> changes since V3:
> 	1.change fifo-depth size from 0x80 to 0x40
> 	2.Move the below properties
> 		a.card-detect-delay
> 		b.samsung,dw-mshc-ciu-div
> 		c.samsung,dw-mshc-sdr-timing
> 		d.samsung,dw-mshc-ddr-timing
> 	from SOC dts to board dts file as suggested by Doug Anderson
> 
> changes since V2:
> 	1.dropped num-slots property from node as its not required
> 	  if number of card slots available is 1.
> 
> 	2.Move the below properties
> 		a.fifo-depth
> 		b.card-detect-delay
> 		c.samsung,dw-mshc-ciu-div
> 		d.samsung,dw-mshc-sdr-timing
> 		e.samsung,dw-mshc-ddr-timing
> 	from board dts to SOC dts,as these are not board specific properties.
> 
> 	3.Updated the binding document exynos-dw-mshc.txt.
> 
> changes since V1:
> 	1.disable node by status = disabled in SOC file
> 	2.enable node by status = okay in board specific file
> 
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---
>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    4 ++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   34 +++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   39 ++++++++++++++++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> index 6d1c098..25368e8 100644
> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> @@ -16,6 +16,8 @@ Required Properties:
>  	  specific extensions.
>  	- "samsung,exynos5250-dw-mshc": for controllers with Samsung Exynos5250
>  	  specific extensions.
> +	- "samsung,exynos5420-dw-mshc": for controllers with Samsung Exynos5420
> +	  specific extensions.
>  
>  * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
>    unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
> @@ -31,6 +33,8 @@ Required Properties:
>    data rate mode operation. Refer notes below for the order of the cells and the
>    valid values.
>  
> +* bypass-smu: Bypass Security Management Unit of eMMC channel 0 and channel 1.
> +

Could you elaborate on why this is needed?

Is the SMU broken or not present in some hardware revisions?

>    Notes for the sdr-timing and ddr-timing values:
>  
>      The order of the cells should be

On an unrelated note, I see the binding in mainline defines a gpios
property that doesn't seem to be used anywhere. Am I missing something,
or do we just not have support for that part of the binding?

Thanks,
Mark.

> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index bafba25..576066c 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -31,6 +31,40 @@
>  		};
>  	};
>  
> +	dwmmc0@12200000 {
> +		status = "okay";
> +		broken-cd;
> +		bypass-smu;
> +		supports-highspeed;
> +		card-detect-delay = <200>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <0 4>;
> +		samsung,dw-mshc-ddr-timing = <0 2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <8>;
> +		};
> +	};
> +
> +	dwmmc2@12220000 {
> +		status = "okay";
> +		supports-highspeed;
> +		card-detect-delay = <200>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <2 3>;
> +		samsung,dw-mshc-ddr-timing = <1 2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <4>;
> +		};
> +	};
> +
>  	dp-controller@145B0000 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&dp_hpd>;
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index d537cd7..3893f45 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -22,6 +22,9 @@
>  	compatible = "samsung,exynos5420";
>  
>  	aliases {
> +		mshc0 = &dwmmc_0;
> +		mshc1 = &dwmmc_1;
> +		mshc2 = &dwmmc_2;
>  		pinctrl0 = &pinctrl_0;
>  		pinctrl1 = &pinctrl_1;
>  		pinctrl2 = &pinctrl_2;
> @@ -84,6 +87,42 @@
>  		clock-names = "mfc";
>  	};
>  
> +	dwmmc_0: dwmmc0@12200000 {
> +		compatible = "samsung,exynos5420-dw-mshc";
> +		interrupts = <0 75 0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x12200000 0x2000>;
> +		clocks = <&clock 351>, <&clock 132>;
> +		clock-names = "biu", "ciu";
> +		fifo-depth = <0x40>;
> +		status = "disabled";
> +	};
> +
> +	dwmmc_1: dwmmc1@12210000 {
> +		compatible = "samsung,exynos5420-dw-mshc";
> +		interrupts = <0 76 0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x12210000 0x2000>;
> +		clocks = <&clock 352>, <&clock 133>;
> +		clock-names = "biu", "ciu";
> +		fifo-depth = <0x40>;
> +		status = "disabled";
> +	};
> +
> +	dwmmc_2: dwmmc2@12220000 {
> +		compatible = "samsung,exynos5420-dw-mshc";
> +		interrupts = <0 77 0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x12220000 0x2000>;
> +		clocks = <&clock 353>, <&clock 134>;
> +		clock-names = "biu", "ciu";
> +		fifo-depth = <0x40>;
> +		status = "disabled";
> +	};
> +
>  	mct@101C0000 {
>  		compatible = "samsung,exynos4210-mct";
>  		reg = <0x101C0000 0x800>;
> -- 
> 1.7.9.5
> 
> 
