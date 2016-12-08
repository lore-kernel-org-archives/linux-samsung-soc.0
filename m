From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Correct clocks for Exynos4 I2S
 module
Date: Thu, 8 Dec 2016 18:42:17 +0200
Message-ID: <20161208164217.GB5238@kozik-lap>
References: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34068 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753207AbcLHQm1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 11:42:27 -0500
Received: by mail-wm0-f66.google.com with SMTP id g23so4660205wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Dec 2016 08:42:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Dec 08, 2016 at 12:01:53PM +0100, Marek Szyprowski wrote:
> "iis", "i2s_opclk0" and "i2s_opclk1" are standard clocks for Exynos4 I2S
> hardware module, so they should be defined in .dtsi file not in the random
> board .dts file.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi                  | 6 ++++--
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----

Please update also exynos4412-itop-elite.dts

Beside that looks good.
Krzysztof

>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index c64737b..23d85601 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -64,8 +64,10 @@
>  	i2s0: i2s@03830000 {
>  		compatible = "samsung,s5pv210-i2s";
>  		reg = <0x03830000 0x100>;
> -		clocks = <&clock_audss EXYNOS_I2S_BUS>;
> -		clock-names = "iis";
> +		clocks = <&clock_audss EXYNOS_I2S_BUS>,
> +			 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
> +			 <&clock_audss EXYNOS_SCLK_I2S>;
> +		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
>  		#clock-cells = <1>;
>  		clock-output-names = "i2s_cdclk0";
>  		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 8aa19ba..7815efd 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -503,10 +503,6 @@
>  	pinctrl-0 = <&i2s0_bus>;
>  	pinctrl-names = "default";
>  	status = "okay";
> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
> -		 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
> -		 <&clock_audss EXYNOS_SCLK_I2S>;
> -	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
>  };
>  
>  &mixer {
> -- 
> 1.9.1
> 
