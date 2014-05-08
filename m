From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: enable dp-controller for exynos5250 based
 snow board
Date: Thu, 08 May 2014 16:42:46 +0900
Message-ID: <002801cf6a91$1a891f70$4f9b5e50$%han@samsung.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
 <1399529995-8656-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62347 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991AbaEHHms (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 03:42:48 -0400
In-reply-to: <1399529995-8656-4-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, May 08, 2014 3:20 PM, Rahul Sharma wrote:
> 
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable dp-controller for snow board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 796954c..28a755f 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -207,6 +207,33 @@
>  		};
>  	};
> 
> +	dp-controller@145B0000 {
> +		status = "okay";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dp_hpd>;
> +		samsung,color-space = <0>;
> +		samsung,dynamic-range = <0>;
> +		samsung,ycbcr-coeff = <0>;
> +		samsung,color-depth = <1>;
> +		samsung,link-rate = <0x0a>;
> +		samsung,lane-count = <2>;
> +		samsung,hpd-gpio = <&gpx0 7 0>;
> +		display-timings {

For readability, please insert one line as below.

+		samsung,hpd-gpio = <&gpx0 7 0>;
+
+		display-timings {

The same comment applies to the 5th patch.
([PATCH v2 5/5] ARM: dts: enable dp-controller for exynos5420
based peach-pit board)

Best regards,
Jingoo Han

> +			native-mode = <&timing1>;
> +			timing1: timing@1 {
> +				clock-frequency = <70589280>;
> +				hactive = <1366>;
> +				vactive = <768>;
> +				hfront-porch = <40>;
> +				hback-porch = <40>;
> +				hsync-len = <32>;
> +				vback-porch = <10>;
> +				vfront-porch = <12>;
> +				vsync-len = <6>;
> +			};
> +		};
> +	};
> +
>  	fimd@14400000 {
>  		status = "okay";
>  		samsung,invert-vclk;
> --
> 1.7.9.5
