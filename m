From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3] ARM: dts: Add DT changes for display on peach_pi
Date: Mon, 25 Aug 2014 11:43:35 +0530
Message-ID: <CAEC9eQNSPKdTKbAnNpj1ssc==NHkLUUAb+02wZiO+v41XEvutQ@mail.gmail.com>
References: <1407145638-3803-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:51011 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbaHYGNg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Aug 2014 02:13:36 -0400
In-Reply-To: <1407145638-3803-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On Mon, Aug 4, 2014 at 3:17 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add DT nodes for panel-simple "auo,b133htn01" panel.
> Add backlight enable pin and backlight power supply for pwm-backlight.
> Also, add panel phandle needed by dp to enable display on peach_pi.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> Changes since V1:
> Remove "simple-panel" compatible string and use only ""auo,b133htn01".
>
> Changes since V2:
> As suggested by Andreas,
> Use GPIO_ACTIVE_HIGH for backlight enable-gpios instead of using 0.
> Change panel node naming from "panel-simple" to "panel".
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
> +               enable-gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
> +               power-supply = <&tps65090_fet1>;
>                 pinctrl-0 = <&pwm0_out>;
>                 pinctrl-names = "default";
>         };
> @@ -98,6 +100,12 @@
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> +
> +       panel: panel {
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
