From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: Add DT changes for display on peach_pi
Date: Fri, 1 Aug 2014 22:00:25 +0530
Message-ID: <CAEC9eQNGGG1CH3UN2_1A0iW28gA9kVtJsK7-UNt-AOJKV=J-Gw@mail.gmail.com>
References: <1406910258-28036-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:37633 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754982AbaHAQa0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 12:30:26 -0400
In-Reply-To: <1406910258-28036-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@gmail.com
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

+Kukjin

On Fri, Aug 1, 2014 at 9:54 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add DT nodes for panel-simple "auo,b133htn01" panel.
> Add backlight enable pin and backlight power supply for pwm-backlight.
> Also add panel phandle needed by dp to enable display on peach_pi.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> Remove "simple-panel" compatible string and use only ""auo,b133htn01".
>
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index f3ee48b..f8c2e61 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -28,11 +28,13 @@
>                 i2c20 = "/spi@12d40000/cros-ec@0/i2c-tunnel";
>         };
>
> -       backlight {
> +       backlight: backlight {
>                 compatible = "pwm-backlight";
>                 pwms = <&pwm 0 1000000 0>;
>                 brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
>                 default-brightness-level = <7>;
> +               enable-gpios = <&gpx2 2 0>;
> +               power-supply = <&tps65090_fet1>;
>                 pinctrl-0 = <&pwm0_out>;
>                 pinctrl-names = "default";
>         };
> @@ -98,6 +100,12 @@
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> +
> +       panel: panel-simple {
> +               compatible = "auo,b133htn01";
> +               power-supply = <&tps65090_fet6>;
> +               backlight = <&backlight>;
> +       };
>  };
>
>  &dp {
> @@ -111,22 +119,7 @@
>         samsung,link-rate = <0x0a>;
>         samsung,lane-count = <2>;
>         samsung,hpd-gpio = <&gpx2 6 0>;
> -
> -       display-timings {
> -               native-mode = <&timing1>;
> -
> -               timing1: timing@1 {
> -                       clock-frequency = <150660000>;
> -                       hactive = <1920>;
> -                       vactive = <1080>;
> -                       hfront-porch = <60>;
> -                       hback-porch = <172>;
> -                       hsync-len = <80>;
> -                       vback-porch = <25>;
> -                       vfront-porch = <10>;
> -                       vsync-len = <10>;
> -               };
> -       };
> +       panel = <&panel>;
>  };
>
>  &fimd {
> --
> 1.7.9.5
>
