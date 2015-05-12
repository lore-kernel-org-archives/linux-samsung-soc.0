From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] Odroid XU3 DTS: Hook up PWM and use it for LEDs
Date: Tue, 12 May 2015 10:15:50 +0900
Message-ID: <CAJKOXPcjPOWNqBbyHLjw-1SS2GLtscgVjKFcz3EzYQKEJ5O8uQ@mail.gmail.com>
References: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f53.google.com ([209.85.216.53]:37844 "EHLO
	mail-vn0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbbELBPv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 21:15:51 -0400
Received: by vnbg129 with SMTP id g129so10824230vnb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2015 18:15:50 -0700 (PDT)
In-Reply-To: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org

2015-05-12 9:29 GMT+09:00 Peter Chubb <peter.chubb@nicta.com.au>:
>
> PWM output on the XU3 wasn't working because it wasn't hooked up to
> its pincontrol.

Hi,

Use a common convention of patch title - prefix with "ARM: dts:" and
optionally name of the board. Just look at previous commits in
arch/arm/boot/dts/.

>
> This patch:
>    -- hooks up PWM to its pincontrol, and documents what
>       the outputs are on the XU3
>    -- switches the LEDs that are on PWM outputs to use PWM
>       rather than GPIO.
>
> The main effect is that the brightness of the LEDs can be controlled, and
> user-mode fan control is enabled via /sys/class/pwm
>
> The patch is against the for-next branch of the linux-samsung tree.
>
> Signed-off-by: Peter Chubb <peter.chubb@nicta.com.au>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 55 +++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index 026f83e..84d71a1 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -13,6 +13,7 @@
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
>  #include "exynos5800.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         model = "Hardkernel Odroid XU3";
> @@ -287,25 +288,47 @@
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
> +       pwm: pwm@12dd0000 {

The label for node is already specified in exynos5420.dtsi. Don't
duplicate it. Actually when overriding nodes you should use
label-convention:
&pwm {
    ...
};

Best regards,
Krzysztof
