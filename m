From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3] ARM: dts: exynos5422-odroidxu3: Hook up PWM and use
 it for LEDs
Date: Wed, 13 May 2015 22:17:38 +0900
Message-ID: <55534EF2.1090307@samsung.com>
References: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>	<CAJKOXPcjPOWNqBbyHLjw-1SS2GLtscgVjKFcz3EzYQKEJ5O8uQ@mail.gmail.com>	<84r3qmk2n6.wl-peter.chubb@nicta.com.au>	<CAJKOXPcPGHcP26hLK0V0Rrr3ABB+HQAqQg4PpZN7ytsn2O78Qg@mail.gmail.com>	<84pp66k1aa.wl-peter.chubb@nicta.com.au> <843831qg6h.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34138 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965201AbbEMNRm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 09:17:42 -0400
Received: by pacyx8 with SMTP id yx8so50598584pac.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2015 06:17:42 -0700 (PDT)
In-Reply-To: <843831qg6h.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

W dniu 13.05.2015 o 13:01, Peter Chubb pisze:
> 
> PWM output wasn't working because it wasn't hooked up to its pincontrol.
> This patch:
>    - hooks up PWM to its pincontrol, and documents what
>      the outputs are on the XU3
>    - switches the LEDs that are on PWM outputs to use PWM
>      rather than GPIO.
> 
> The main effect is that the brightness of the LEDs can be controlled, and
> user-mode fan control is enabled via /sys/class/pwm
> 
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Peter Chubb <peter.chubb@nicta.com.au>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 56 +++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index f0ce60b..6f96b3d 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -287,25 +287,35 @@
>  		status = "okay";
>  	};
>  
> -	leds {
> -		compatible = "gpio-leds";
> -		heartbeat {
> -			label = "blue:heartbeart";
> -			gpios = <&gpb2 2 0>;
> -			default-state = "off";
> -			linux,default-trigger = "heartbeat";
> -		};
> -
> -		eMMC {
> -			label = "green:eMMC";
> -			gpios = <&gpb2 1 0>;
> -			default-state = "off";
> -			linux,default-trigger = "mmc0";
> -		};
> +	pwmleds {
> +	     compatible = "pwm-leds";
> +
> +	     greenled {
> +		     label = "green:mmc0";
> +		     pwms = <&pwm 1 2000000 0>;
> +		     pwm-names = "pwm1";
> +		     /*
> +		      * Green LED is much brighter than the others
> +		      * so limit its max brightness
> +		      */
> +		     max_brightness = <127>; 

Please run checkpatch before sending a patch. Here you have trailing
whitespace error.

Additionally the indentation is broken in most of the lines - mixed tabs
with spaces. Just stick to the kernel coding convention - tabs (8
characters wide).

Best regards,
Krzysztof
