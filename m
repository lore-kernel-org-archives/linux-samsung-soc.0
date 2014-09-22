From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: s3c64xx: Enable PWM node by default
Date: Mon, 22 Sep 2014 21:03:28 +0900
Message-ID: <019301cfd65d$39bc5460$ad34fd20$@kernel.org>
References: <1411387317-4837-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58401 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086AbaIVMDd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 08:03:33 -0400
In-reply-to: <1411387317-4837-1-git-send-email-tomasz.figa@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Tomasz Figa wrote:
> 
> The PWM block is required for system clock source so it must be always
> enabled. This patch fixes boot issues on SMDK6410 which did not have the
> node enabled explicitly for other purposes.
> 
> Fixes: eeb93d02c5d8 ("clocksource: of: Respect device tree node status")
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/boot/dts/s3c6410-mini6410.dts | 4 ----
>  arch/arm/boot/dts/s3c64xx.dtsi         | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
> index a171cdd26b7f..42c2bcdf2626 100644
> --- a/arch/arm/boot/dts/s3c6410-mini6410.dts
> +++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
> @@ -252,10 +252,6 @@
>  	status = "okay";
>  };
> 
> -&pwm {
> -	status = "okay";
> -};
> -
>  &pinctrl0 {
>  	gpio_leds: gpio-leds {
>  		samsung,pins = "gpk-4", "gpk-5", "gpk-6", "gpk-7";
> diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
> index 05c717ad1edd..196fe6ea205d 100644
> --- a/arch/arm/boot/dts/s3c64xx.dtsi
> +++ b/arch/arm/boot/dts/s3c64xx.dtsi
> @@ -239,7 +239,6 @@
>  			clocks = <&clocks PCLK_PWM>;
>  			samsung,pwm-outputs = <0>, <1>;
>  			#pwm-cells = <3>;
> -			status = "disabled";
>  		};
> 
>  		pinctrl0: pinctrl@7f008000 {
> --
> 2.1.0

Looks good, will apply.

Thanks,
Kukjin
