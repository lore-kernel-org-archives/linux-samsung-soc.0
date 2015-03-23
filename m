From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH RESEND] ARM: dts: Support audio on
 Exynos5422-odroidxu3 using simple-audio-card
Date: Mon, 23 Mar 2015 11:54:55 +0100
Message-ID: <550FF0FF.4000604@samsung.com>
References: <1427079093-28483-1-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10772 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751935AbbCWKzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 06:55:04 -0400
In-reply-to: <1427079093-28483-1-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inha Song <ideal.song@samsung.com>
Cc: broonie@kernel.org, kgene@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com

On 23/03/15 03:51, Inha Song wrote:
> Add MAX98090 audio codec, I2S interface and the sound nodes to support
> audio on Exynos5422 SoC Based Odroid-XU3 board. Now we can support audio
> in Odroid-XU3 board using simple-audio-card DT binding.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi          |  9 +++++
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 57 ++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 4eaeabe..e459c1d 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -415,6 +415,9 @@
>  			<&clock_audss EXYNOS_I2S_BUS>,
>  			<&clock_audss EXYNOS_SCLK_I2S>;
>  		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> +		#clock-cells = <1>;
> +		clock-output-names = "i2s_cdclk0";
> +		#sound-dai-cells = <1>;
>  		samsung,idma-addr = <0x03000000>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&i2s0_bus>;
> @@ -429,6 +432,9 @@
>  		dma-names = "tx", "rx";
>  		clocks = <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
>  		clock-names = "iis", "i2s_opclk0";
> +		#clock-cells = <1>;
> +		clock-output-names = "i2s_cdclk1";
> +		#sound-dai-cells = <1>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&i2s1_bus>;
>  		status = "disabled";
> @@ -442,6 +448,9 @@
>  		dma-names = "tx", "rx";
>  		clocks = <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
>  		clock-names = "iis", "i2s_opclk0";
> +		#clock-cells = <1>;
> +		clock-output-names = "i2s_cdclk2";
> +		#sound-dai-cells = <1>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&i2s2_bus>;
>  		status = "disabled";
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index edc25cf..9275ad6 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -11,6 +11,7 @@
>  */
>  
>  /dts-v1/;
> +#include <dt-bindings/sound/samsung-i2s.h>
>  #include "exynos5800.dtsi"
>  
>  / {
> @@ -285,6 +286,62 @@
>  	rtc@101E0000 {
>  		status = "okay";
>  	};
> +
> +	sound: sound {
> +		compatible = "simple-audio-card";
> +		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
> +				<&clock_audss EXYNOS_MOUT_I2S>,
> +				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
> +		assigned-clock-parents = <&clock CLK_FIN_PLL>,
> +				<&clock_audss EXYNOS_MOUT_AUDSS>;
> +		assigned-clock-rates = <0>,
> +				<0>,
> +				<19200000>;

The patch looks good, except it would be more appropriate to move the
above properties to &clock_audss { }; node in this file.
With that change feel free to add:
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

As a side note, this is a dts patch and of course Kukjin maintains that.
You would likely get it applied sooner if you would have addressed it
directly to Kukjin, rather than Mark or me.

-- 
Thanks,
Sylwester
