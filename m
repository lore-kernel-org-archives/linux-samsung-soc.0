From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v4] ARM: dts: exynos5422-odroidxu3: Hook up PWM and use it
 for LEDs
Date: Fri, 31 Jul 2015 01:39:20 +0530
Message-ID: <CANAwSgSJd34EF9dc9RwH4Lx=c6mNf4uvxKDrdE+Kepx=JV6Ypw@mail.gmail.com>
References: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>
	<CAJKOXPcjPOWNqBbyHLjw-1SS2GLtscgVjKFcz3EzYQKEJ5O8uQ@mail.gmail.com>
	<84r3qmk2n6.wl-peter.chubb@nicta.com.au>
	<CAJKOXPcPGHcP26hLK0V0Rrr3ABB+HQAqQg4PpZN7ytsn2O78Qg@mail.gmail.com>
	<84pp66k1aa.wl-peter.chubb@nicta.com.au>
	<843831qg6h.wl-peter.chubb@nicta.com.au>
	<55534EF2.1090307@samsung.com>
	<84sib0gjdo.wl-peter.chubb@nicta.com.au>
	<84iobwuj23.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37959 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbbG3UJW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jul 2015 16:09:22 -0400
Received: by wibxm9 with SMTP id xm9so6095550wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jul 2015 13:09:21 -0700 (PDT)
In-Reply-To: <84iobwuj23.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

Hi Peter,

On 14/05/2015, Peter Chubb <peter.chubb@nicta.com.au> wrote:
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
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 50
> +++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index f0ce60b..0c62156 100644
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
> +	pwmleds {
> +		compatible = "pwm-leds";
> +
> +		greenled {
> +			label = "green:mmc0";
> +			pwms = <&pwm 1 2000000 0>;
> +			pwm-names = "pwm1";
> +			/*
> +			 * Green LED is much brighter than the others
> +			 * so limit its max brightness
> +			 */
> +			max_brightness = <127>;
> +			linux,default-trigger = "mmc0";
>  		};
>
> -		eMMC {
> -			label = "green:eMMC";
> -			gpios = <&gpb2 1 0>;
> -			default-state = "off";
> -			linux,default-trigger = "mmc0";
> +		blueled {
> +			label = "blue:heartbeat";
> +			pwms = <&pwm 2 2000000 0>;
> +			pwm-names = "pwm2";
> +			max_brightness = <255>;
> +			linux,default-trigger = "heartbeat";
>  		};
> +	};
>
> -		microSD {
> +	gpioleds {
> +		compatible = "gpio-leds";
> +		redled {
>  			label = "red:microSD";
> -			gpios = <&gpx2 3 0>;
> +			gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  			linux,default-trigger = "mmc1";
>  		};
> @@ -415,3 +425,15 @@
>  		shunt-resistor = <10000>;
>  	};
>  };
> +
> +&pwm {
> +	/*
> +	 * PWM 0 -- fan
> +	 * PWM 1 -- Green LED
> +	 * PWM 2 -- Blue LED
> +	 * PWM 3 -- on MIPI connector for backlight
> +	 */
> +	pinctrl-0 = <&pwm0_out &pwm1_out &pwm2_out &pwm3_out>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> --
> 2.1.4
>
> --
> Dr Peter Chubb				        peter.chubb AT nicta.com.au
> http://www.ssrg.nicta.com.au          Software Systems Research Group/NICTA

I wonder how PWM can be enabled on the odroidxu3 board.

I could not find the node getting populated in the /sys/class/leds/

root@odroidxu3:l# la -la   /sys/class/leds/
total 0
drwxr-xr-x  2 root root 0 Jul 31 04:56 .
drwxr-xr-x 47 root root 0 Jul 31 04:56 ..
lrwxrwxrwx  1 root root 0 Jul 31 04:56 red:microSD ->
../../devices/platform/gpioleds/leds/red:microSD

Well I have enable. following  config options in .config.

CONFIG_LEDS_CLASS=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_PWM=m
CONFIG_LEDS_SYSCON=y
# CONFIG_LEDS_PM8941_WLED is not set
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set

Please let me know if I am missing some thing.

-Anand Moon
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
