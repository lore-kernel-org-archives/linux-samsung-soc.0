From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: enable display controller for exynos5800
 based peach-pi board
Date: Tue, 13 May 2014 10:13:49 +0900
Message-ID: <004601cf6e48$98c8a260$ca59e720$%han@samsung.com>
References: <1399877120-4634-1-git-send-email-rahul.sharma@samsung.com>
 <1399877120-4634-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53685 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbaEMBNw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 21:13:52 -0400
In-reply-to: <1399877120-4634-2-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, May 12, 2014 3:45 PM, Rahul Sharma wrote:
> 
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable display controller with timing information for 1080p
> panel in Exynos5800 peach-pi board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 742655b..426705a 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -72,6 +72,13 @@
>  		samsung,pin-pud = <0>;
>  		samsung,pin-drv = <0>;
>  	};
> +
> +	dp_hpd_gpio: dp_hpd_gpio {
> +		samsung,pins = "gpx2-6";
> +		samsung,pin-function = <0>;
> +		samsung,pin-pud = <3>;
> +		samsung,pin-drv = <0>;
> +	};
>  };
> 
>  &rtc {
> @@ -121,6 +128,35 @@
>  	};
>  };
> 
> +&dp {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dp_hpd_gpio>;
> +	samsung,color-space = <0>;
> +	samsung,dynamic-range = <0>;
> +	samsung,ycbcr-coeff = <0>;
> +	samsung,color-depth = <1>;
> +	samsung,link-rate = <0x0a>;
> +	samsung,lane-count = <2>;
> +	samsung,hpd-gpio = <&gpx2 6 0>;
> +
> +	display-timings {
> +		native-mode = <&timing1>;
> +
> +		timing1: timing@1 {
> +			clock-frequency = <150660000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hfront-porch = <60>;
> +			hback-porch = <172>;
> +			hsync-len = <80>;
> +			vback-porch = <25>;
> +			vfront-porch = <10>;
> +			vsync-len = <10>;
> +		};
> +	};
> +};
> +
>  &hsi2c_9 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> --
> 1.7.9.5
