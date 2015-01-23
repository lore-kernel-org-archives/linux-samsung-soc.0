From: Inha Song <ideal.song@samsung.com>
Subject: Re: [alsa-devel] [PATCH v4 3/3] ARM: dts: Add sound nodes for
 exynos4412-trats2
Date: Fri, 23 Jan 2015 15:56:49 +0900
Message-ID: <20150123155649.14fe36a7@songinha-Samsung-DeskTop-System>
References: <1421989410-12490-1-git-send-email-ideal.song@samsung.com>
 <1421989410-12490-4-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39337 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752017AbbAWG4x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 01:56:53 -0500
In-reply-to: <1421989410-12490-4-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: Inha Song <ideal.song@samsung.com>, alsa-devel@alsa-project.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.de, robh+dt@kernel.org, kgene@kernel.org, s.nawrocki@samsung.com, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>

Hi Kukjin,

Sorry, I missed to adding in Cc.

Best Regards,
Inha Song.

On Fri, 23 Jan 2015 14:03:30 +0900
Inha Song <ideal.song@samsung.com> wrote:

> This patch add WM1811 audio codec, I2S interface and the sound
> machine nodes to enable audio on exynos4412-trats2 board.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 42 +++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 29231b4..6205b98 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -203,6 +203,25 @@
>  		};
>  	};
>  
> +	i2c@138A0000 {
> +		samsung,i2c-sda-delay = <100>;
> +		samsung,i2c-slave-addr = <0x10>;
> +		samsung,i2c-max-bus-freq = <100000>;
> +		pinctrl-0 = <&i2c4_bus>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +
> +		wm1811: wm1811@1a {
> +			compatible = "wlf,wm1811";
> +			reg = <0x1a>;
> +			clocks = <&pmu_system_controller 0>;
> +			clock-names = "MCLK1";
> +			DCVDD-supply = <&ldo3_reg>;
> +			DBVDD1-supply = <&ldo3_reg>;
> +			wlf,ldo1ena = <&gpj0 4 0>;
> +		};
> +	};
> +
>  	i2c@138D0000 {
>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-slave-addr = <0x10>;
> @@ -838,6 +857,24 @@
>  		};
>  	};
>  
> +	i2s0: i2s@03830000 {
> +		pinctrl-0 = <&i2s0_bus>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +
> +	sound {
> +		compatible = "samsung,trats2-audio";
> +		samsung,i2s-controller = <&i2s0>;
> +		samsung,model = "Trats2";
> +		samsung,audio-codec = <&wm1811>;
> +		samsung,audio-routing =
> +			"SPK", "SPKOUTLN",
> +			"SPK", "SPKOUTLP",
> +			"SPK", "SPKOUTRN",
> +			"SPK", "SPKOUTRP";
> +	};
> +
>  	exynos-usbphy@125B0000 {
>  		status = "okay";
>  	};
> @@ -865,6 +902,11 @@
>  	};
>  };
>  
> +&pmu_system_controller {
> +	assigned-clocks = <&pmu_system_controller 0>;
> +	assigned-clock-parents =  <&clock CLK_XUSBXTI>;
> +};
> +
>  &pinctrl_0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sleep0>;
> -- 
> 2.0.0.390.gcb682f8
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
