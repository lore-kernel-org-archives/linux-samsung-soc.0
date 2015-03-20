From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clock to rtc
 node
Date: Fri, 20 Mar 2015 10:38:52 +0900
Message-ID: <550B7A2C.4070403@samsung.com>
References: <1426814952-13458-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52912 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbbCTBja (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Mar 2015 21:39:30 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NLH00F71LXSNY00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Mar 2015 10:39:28 +0900 (KST)
In-reply-to: <1426814952-13458-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, m.reichl@fivetechno.de, javier.martinez@collabora.co.uk

On 03/20/2015 10:29 AM, Tobias Jakobi wrote:
> From: Markus Reichl <m.reichl@fivetechno.de>
> 
> The Exynos4412 SoC has a s3c6410 RTC where the source clock
> is now a mandatory property.
> 
> This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3 boards.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 1ff4c88..0a8e6aa4 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -9,6 +9,7 @@
>  
>  #include <dt-bindings/sound/samsung-i2s.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/clock/maxim,max77686.h>
>  #include "exynos4412.dtsi"
>  
>  / {
> @@ -143,6 +144,8 @@
>  
>  	rtc@10070000 {
>  		status = "okay";
> +		clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
> +		clock-names = "rtc", "rtc_src";
>  	};
>  
>  	g2d@10800000 {
> 

Exynos's RTC need the XrtcXTI source clock (32.768kHz). Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
