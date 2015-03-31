From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH V3 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock
 to rtc node
Date: Tue, 31 Mar 2015 13:05:11 +0900
Message-ID: <551A1CF7.9090400@samsung.com>
References: <55196DE2.4030109@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57770 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725AbbCaEFR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 00:05:17 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NM2004ET60O4C90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Mar 2015 13:05:12 +0900 (KST)
In-reply-to: <55196DE2.4030109@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

Hi,

On 03/31/2015 12:38 AM, Markus Reichl wrote:
> The Exynos5422 SoC has a s3c6410 RTC where the source clock
> is now a mandatory property.
> 
> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
> It is based in v4.0-rc2.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Changes since v2:
> 1. Dropped unused phandle.
> Changes since v1:
> 1. Dropped Documentation.
> 2. Split into 2 parts.
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index 0408ec0..4a7ca15 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -274,10 +274,6 @@
>  			reg = <0x50>;
>  		};
>  	};
> -
> -	rtc@101E0000 {
> -		status = "okay";
> -	};
>  };
>  
>  &hdmi {
> @@ -374,3 +370,9 @@
>  		shunt-resistor = <10000>;
>  	};
>  };
> +
> +&rtc {
> +	status = "okay";
> +	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
> +	clock-names = "rtc", "rtc_src";
> +};
> 

Exynos's RTC must need the XrtcXTI source clock (32.768kHz). Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
