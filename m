From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Odroid XU3 -- Hook up PWM and use it for LEDs
Date: Tue, 12 May 2015 12:26:57 +0900
Message-ID: <55517301.5080905@samsung.com>
References: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>
 <CAJKOXPcjPOWNqBbyHLjw-1SS2GLtscgVjKFcz3EzYQKEJ5O8uQ@mail.gmail.com>
 <84r3qmk2n6.wl-peter.chubb@nicta.com.au>
 <CAJKOXPcPGHcP26hLK0V0Rrr3ABB+HQAqQg4PpZN7ytsn2O78Qg@mail.gmail.com>
 <84pp66k1aa.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41311 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbbELD1C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 23:27:02 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO7006DDW8YFH50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 May 2015 04:26:59 +0100 (BST)
In-reply-to: <84pp66k1aa.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org

On 12.05.2015 09:29, Peter Chubb wrote:
> 
> PWM output wasn't working because it wasn't hooked up to its pincontrol.
> This patch:
>    -- hooks up PWM to its pincontrol, and documents what
>       the outputs are on the XU3
>    -- switches the LEDs that are on PWM outputs to use PWM
>       rather than GPIO.
> 
> The main effect is that the brightness of the LEDs can be controlled, and
> user-mode fan control is enabled via /sys/class/pwm
> 
> Signed-off-by: Peter Chubb <peter.chubb@nicta.com.au>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 58 +++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index 026f83e..095282b 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -13,6 +13,7 @@
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
>  #include "exynos5800.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

Errr, probably a leftover after rebasing... please fix it up.

> 
>  / {
>         model = "Hardkernel Odroid XU3";
> @@ -287,25 +288,35 @@
>                 status = "okay";
>         };
> 
> -       leds {
> -               compatible = "gpio-leds";
> -               heartbeat {
> -                       label = "blue:heartbeart";
> -                       gpios = <&gpb2 2 0>;
> -                       default-state = "off";
> -                       linux,default-trigger = "heartbeat";
> -               };
> -
> -               eMMC {
> -                       label = "green:eMMC";
> -                       gpios = <&gpb2 1 0>;
> -                       default-state = "off";
> -                       linux,default-trigger = "mmc0";
> -               };
> +       pwmleds {
> +            compatible = "pwm-leds";
> +
> +            greenled {
> +                    label = "green:mmc0";
> +                    pwms = <&pwm 1 2000000 0>;
> +                    pwm-names = "pwm1";
> +                    /*
> +                     * Green LED is much brighter than the others
> +                     * so limit its max brightness
> +                     */
> +                    max_brightness = <127>;
> +                    linux,default-trigger = "mmc0";
> +            };
> +
> +            blueled {
> +                    label = "blue:heartbeat";
> +                    pwms = <&pwm 2 2000000 0>;
> +                    pwm-names = "pwm2";
> +                    max_brightness = <255>;
> +                    linux,default-trigger = "heartbeat";
> +            };
> +       };
> 
> -               microSD {
> +       gpioleds {
> +               compatible = "gpio-leds";
> +               redled {
>                         label = "red:microSD";
> -                       gpios = <&gpx2 3 0>;
> +                       gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
>                         default-state = "off";
>                         linux,default-trigger = "mmc1";
>                 };
> @@ -411,3 +422,16 @@
>                 shunt-resistor = <10000>;
>         };
>  };
> +
> +&pwm {
> +       /*
> +        * PWM 0 -- fan
> +        * PWM 1 -- Green LED
> +        * PWM 2 -- Blue LED
> +        * PWM 3 -- on MIPI connector for backlight
> +        */
> +       pinctrl-0 = <&pwm0_out &pwm1_out &pwm2_out &pwm3_out>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> --
> 2.1.4
> 
> 
> 
> --
> Dr Peter Chubb                                  peter.chubb AT nicta.com.au
> http://www.ssrg.nicta.com.au          Software Systems Research Group/NICTA
> 
> ________________________________
> 
> The information in this e-mail may be confidential and subject to legal professional privilege and/or copyright. National ICT Australia Limited accepts no liability for any damage caused by this email or its attachments.
> 

Please remove this footer from email. If this patch is confidential,
should I apply it? I don't want to apply confidential patches...

Additionally there is something wrong with your mailer because it sets
the date from the patchset, so this email has the same date as v1. So
the email ended not at the top of mail mailbox. Are you using git
send-email?

Best regards,
Krzysztof
