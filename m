From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Tue, 12 Nov 2013 19:23:56 +0900
Message-ID: <085901cedf91$4b24d4c0$e16e7e40$@org>
References: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16212 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753286Ab3KLKX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 05:23:57 -0500
In-reply-to: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: tushar.behera@linaro.org, devicetree@vger.kernel.org

Sachin Kamat wrote:
> 

Following is more clear?

"ARM: dts: Add missing GPIO entries for sd_bus_width4 in exynos5420-pinctrl"

> Adds missing GPIO entries for sd_bus nodes in exynos5420-pinctrl.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> index e695aba..fcb8206 100644
> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> @@ -181,7 +181,7 @@
>  		};
> 
>  		sd0_bus4: sd0-bus-width4 {
> -			samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
> +			samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5",
"gpc0-6";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <3>;
>  			samsung,pin-drv = <3>;
> @@ -230,7 +230,7 @@
>  		};
> 
>  		sd1_bus4: sd1-bus-width4 {
> -			samsung,pins = "gpc1-4", "gpc1-5", "gpc1-6";
> +			samsung,pins = "gpc1-3", "gpc1-4", "gpc1-5",
"gpc1-6";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <3>;
>  			samsung,pin-drv = <3>;
> @@ -272,7 +272,7 @@
>  		};
> 
>  		sd2_bus4: sd2-bus-width4 {
> -			samsung,pins = "gpc2-4", "gpc2-5", "gpc2-6";
> +			samsung,pins = "gpc2-3", "gpc2-4", "gpc2-5",
"gpc2-6";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <3>;
>  			samsung,pin-drv = <3>;
> --
> 1.7.9.5

Looks ok to me, applied with updating title.

Thanks,
Kukjin
