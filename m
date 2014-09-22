From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add rtc_src clk for s3c-rtc on
 exynos5250-snow
Date: Mon, 22 Sep 2014 15:44:52 +0900
Message-ID: <541FC564.8000002@samsung.com>
References: <1410954633-27025-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410954633-27025-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50529 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763AbaIVGoy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 02:44:54 -0400
In-reply-to: <1410954633-27025-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Daniel Drake <drake@endlessm.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Dear Javier,

On 09/17/2014 08:50 PM, Javier Martinez Canillas wrote:
> commit 546b117fdf17 ("rtc: s3c: add support for RTC of Exynos3250 SoC")
> added an "rtc_src" DT property for the Samsung's S3C Real Time Clock
> controller that specifies the 32.768 kHz clock that uses the RTC as its
> source clock. In the case of the Exynos5250 based Snow board, the Maxim
> 77686 32kHz AP clock is used as the source clock.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index e51fcef..56eec56 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -10,6 +10,7 @@
>  
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/maxim,max77686.h>
>  #include "exynos5250.dtsi"
>  
>  / {
> @@ -29,6 +30,8 @@
>  
>  	rtc@101E0000 {
>  		status = "okay";
> +		clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
> +		clock-names = "rtc", "rtc_src";
>  	};
>  
>  	pinctrl@11400000 {
> @@ -350,7 +353,7 @@
>  	samsung,i2c-sda-delay = <100>;
>  	samsung,i2c-max-bus-freq = <378000>;
>  
> -	max77686@09 {
> +	max77686: max77686@09 {
>  		compatible = "maxim,max77686";
>  		interrupt-parent = <&gpx3>;
>  		interrupts = <2 0>;
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
