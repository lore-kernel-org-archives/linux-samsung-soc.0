From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 7/7] ARM: dts: samsung: Switch to dedicated Odroid
 sound card binding
Date: Fri, 21 Apr 2017 20:43:57 +0200
Message-ID: <20170421184357.5pminqxkrt4v4rxo@kozik-lap>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172053epcas1p26cbba167969b1bffb48e3b7e6f5c3604@epcas1p2.samsung.com>
 <1492795191-31298-8-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492795191-31298-8-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, javier@osg.samsung.com, jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 21, 2017 at 07:19:51PM +0200, Sylwester Nawrocki wrote:
> The new sound card DT binding is used for Odroid XU3 in order
> to properly support the HDMI audio path.
> Clocks configuration is changed so the I2S controller is now the bit
> and the frame clock master with EPLL as the root clock source.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi                    |  1 +
>  arch/arm/boot/dts/exynos5420.dtsi                 |  1 +
>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 59 ++++++++++++++++++-----
>  3 files changed, 48 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 18def1c..f3dcb7f 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -761,6 +761,7 @@
>  		phy = <&hdmi_i2c_phy>;
>  		power-domains = <&pd_tv>;
>  		samsung,syscon-phandle = <&pmu_system_controller>;
> +		#sound-dai-cells = <0>;
>  		status = "disabled";
>  	};
>  
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 7dc9dc8..c7d29b6 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -618,6 +618,7 @@
>  			samsung,syscon-phandle = <&pmu_system_controller>;
>  			status = "disabled";
>  			power-domains = <&disp_pd>;
> +			#sound-dai-cells = <0>;
>  		};
>  
>  		hdmiphy: hdmiphy@145D0000 {
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> index 9493923..84703f7 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> @@ -11,15 +11,17 @@
>   * published by the Free Software Foundation.
>  */
>  
> +#include <dt-bindings/sound/samsung-i2s.h>
> +
>  / {
>  	sound: sound {
> -		compatible = "simple-audio-card";
> +		compatible = "samsung,odroid-xu3-audio";
> +		model = "Odroid-XU3";
>  
> -		simple-audio-card,name = "Odroid-XU3";
> -		simple-audio-card,widgets =
> +		samsung,audio-widgets =
>  			"Headphone", "Headphone Jack",
>  			"Speakers", "Speakers";
> -		simple-audio-card,routing =
> +		samsung,audio-routing =
>  			"Headphone Jack", "HPL",
>  			"Headphone Jack", "HPR",
>  			"Headphone Jack", "MICBIAS",
> @@ -27,22 +29,51 @@
>  			"Speakers", "SPKL",
>  			"Speakers", "SPKR";
>  
> -		simple-audio-card,format = "i2s";
> -		simple-audio-card,bitclock-master = <&link0_codec>;
> -		simple-audio-card,frame-master = <&link0_codec>;
> +		clocks = <&clock CLK_FOUT_EPLL>, <&i2s0 CLK_I2S_RCLK_SRC>;
> +		clock-names = "epll", "i2s_rclk";
>  
> -		simple-audio-card,cpu {
> +		cpu {
>  			sound-dai = <&i2s0 0>;
> -			system-clock-frequency = <19200000>;
>  		};
> -
> -		link0_codec: simple-audio-card,codec {
> -			sound-dai = <&max98090>;
> -			clocks = <&i2s0 CLK_I2S_CDCLK>;
> +		codec {
> +			sound-dai = <&hdmi>, <&max98090>;
>  		};
>  	};
>  };
>  
> +&clock_audss {
> +	assigned-clocks = <&clock_audss EXYNOS_DOUT_SRP>,
> +			  <&clock CLK_FOUT_EPLL>;
> +	assigned-clock-rates = <(196608000 / 256)>,
> +			       <196608000>;
> +};
> +
> +&sound {
> +	assigned-clocks = <&clock CLK_MOUT_EPLL>,
> +			<&clock CLK_MOUT_MAU_EPLL>,
> +			<&clock CLK_MOUT_USER_MAU_EPLL>,
> +			<&clock_audss EXYNOS_MOUT_AUDSS>,
> +			<&clock_audss EXYNOS_MOUT_I2S>,
> +			<&clock_audss EXYNOS_DOUT_SRP>,
> +			<&clock_audss EXYNOS_DOUT_AUD_BUS>,
> +			<&clock_audss EXYNOS_DOUT_I2S>;
> +
> +	assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
> +			<&clock CLK_MOUT_EPLL>,
> +			<&clock CLK_MOUT_MAU_EPLL>,
> +			<&clock CLK_MAU_EPLL>,
> +			<&clock_audss EXYNOS_MOUT_AUDSS>;
> +
> +	assigned-clock-rates = <0>,
> +			<0>,
> +			<0>,
> +			<0>,
> +			<0>,
> +			<196608000>,
> +			<(196608000 / 2)>,
> +			<196608000>;
> +};

Unless there is clear reson not to, I would prefer to put nodes sorted
alphabetically. It helps avoiding conflicts and bring some logic.

Beside that, looks good for me.

You mentioned that DTS will be going in with next iteration. Sounds fine
with me.

Best regards,
Krzysztof

