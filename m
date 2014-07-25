From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos5250: Fold common ChromeOS parts
 into Snow
Date: Fri, 25 Jul 2014 09:02:56 -0700
Message-ID: <CAD=FV=VK0KJknJ2099S7fEDzBnpPCrpSZ36WPkJB156GpcyEfg@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-4-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:39047 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754092AbaGYQC5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 12:02:57 -0400
Received: by mail-vc0-f182.google.com with SMTP id hy4so7748465vcb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2014 09:02:56 -0700 (PDT)
In-Reply-To: <1405704009-8430-4-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Andreas,

On Fri, Jul 18, 2014 at 10:20 AM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> The remaining pieces are fairly minor.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2: New (Doug Anderson)
>
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi | 164 ----------------=
---------
>  arch/arm/boot/dts/exynos5250-snow.dts         | 169 ++++++++++++++++=
++++++----
>  2 files changed, 148 insertions(+), 185 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/exynos5250-cros-common.dtsi
>
> diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm=
/boot/dts/exynos5250-cros-common.dtsi
> deleted file mode 100644
> index e603e9c..0000000
> --- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> +++ /dev/null
> @@ -1,164 +0,0 @@
> -/*
> - * Common device tree include for all Exynos 5250 boards based off o=
f Daisy.
> - *
> - * Copyright (c) 2012 Google, Inc
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -/ {
> -       aliases {
> -       };
> -
> -       memory {
> -               reg =3D <0x40000000 0x80000000>;
> -       };
> -
> -       chosen {
> -       };
> -
> -       pinctrl@11400000 {
> -               /*
> -                * Disabled pullups since external part has its own p=
ullups and
> -                * double-pulling gets us out of spec in some cases.
> -                */
> -               i2c2_bus: i2c2-bus {
> -                       samsung,pin-pud =3D <0>;
> -               };
> -       };
> -
> -       i2c@12C60000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <378000>;
> -       };
> -
> -       i2c@12C70000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <378000>;
> -       };
> -
> -       i2c@12C80000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <66000>;
> -
> -               hdmiddc@50 {
> -                       compatible =3D "samsung,exynos4210-hdmiddc";
> -                       reg =3D <0x50>;
> -               };
> -       };
> -
> -       i2c@12C90000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <66000>;
> -       };
> -
> -       i2c@12CA0000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <66000>;
> -       };
> -
> -       i2c@12CB0000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <66000>;
> -       };
> -
> -       i2c@12CD0000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <66000>;
> -       };
> -
> -       i2c@12CE0000 {
> -               status =3D "okay";
> -               samsung,i2c-sda-delay =3D <100>;
> -               samsung,i2c-max-bus-freq =3D <378000>;
> -
> -               hdmiphy: hdmiphy@38 {
> -                       compatible =3D "samsung,exynos4212-hdmiphy";
> -                       reg =3D <0x38>;
> -               };
> -       };
> -
> -       mmc@12200000 {
> -               num-slots =3D <1>;
> -               supports-highspeed;
> -               broken-cd;
> -               card-detect-delay =3D <200>;
> -               samsung,dw-mshc-ciu-div =3D <3>;
> -               samsung,dw-mshc-sdr-timing =3D <2 3>;
> -               samsung,dw-mshc-ddr-timing =3D <1 2>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &s=
d0_bus8>;
> -
> -               slot@0 {
> -                       reg =3D <0>;
> -                       bus-width =3D <8>;
> -               };
> -       };
> -
> -       mmc@12220000 {
> -               num-slots =3D <1>;
> -               supports-highspeed;
> -               card-detect-delay =3D <200>;
> -               samsung,dw-mshc-ciu-div =3D <3>;
> -               samsung,dw-mshc-sdr-timing =3D <2 3>;
> -               samsung,dw-mshc-ddr-timing =3D <1 2>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
> -
> -               slot@0 {
> -                       reg =3D <0>;
> -                       bus-width =3D <4>;
> -                       wp-gpios =3D <&gpc2 1 0>;
> -               };
> -       };
> -
> -       mmc@12230000 {
> -               num-slots =3D <1>;
> -               supports-highspeed;
> -               broken-cd;
> -               card-detect-delay =3D <200>;
> -               samsung,dw-mshc-ciu-div =3D <3>;
> -               samsung,dw-mshc-sdr-timing =3D <2 3>;
> -               samsung,dw-mshc-ddr-timing =3D <1 2>;
> -               /* See board-specific dts files for pin setup */
> -
> -               slot@0 {
> -                       reg =3D <0>;
> -                       bus-width =3D <4>;
> -               };
> -       };
> -
> -       spi_1: spi@12d30000 {
> -               status =3D "okay";
> -               samsung,spi-src-clk =3D <0>;
> -               num-cs =3D <1>;
> -       };
> -
> -       hdmi {
> -               hpd-gpio =3D <&gpx3 7 0>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&hdmi_hpd_irq>;
> -               phy =3D <&hdmiphy>;
> -               ddc =3D <&i2c_2>;
> -       };
> -
> -       gpio-keys {
> -               compatible =3D "gpio-keys";
> -
> -               power {
> -                       label =3D "Power";
> -                       gpios =3D <&gpx1 3 1>;
> -                       linux,code =3D <116>; /* KEY_POWER */
> -                       gpio-key,wakeup;
> -               };
> -       };
> -};
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dt=
s/exynos5250-snow.dts
> index f2b8c41..cdf74c5 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -10,7 +10,6 @@
>
>  /dts-v1/;
>  #include "exynos5250.dtsi"
> -#include "exynos5250-cros-common.dtsi"
>
>  / {
>         model =3D "Google Snow";
> @@ -20,6 +19,13 @@
>                 i2c104 =3D &i2c_104;
>         };
>
> +       memory {
> +               reg =3D <0x40000000 0x80000000>;
> +       };
> +
> +       chosen {
> +       };
> +
>         rtc@101E0000 {
>                 status =3D "okay";
>         };
> @@ -93,6 +99,13 @@
>         gpio-keys {
>                 compatible =3D "gpio-keys";
>
> +               power {
> +                       label =3D "Power";
> +                       gpios =3D <&gpx1 3 1>;
> +                       linux,code =3D <116>; /* KEY_POWER */
> +                       gpio-key,wakeup;
> +               };
> +
>                 lid-switch {
>                         label =3D "Lid";
>                         gpios =3D <&gpx3 5 1>;
> @@ -226,26 +239,6 @@
>                 };
>         };
>
> -       mmc@12200000 {
> -               status =3D "okay";
> -       };
> -
> -       mmc@12220000 {
> -               status =3D "okay";
> -       };
> -
> -       /*
> -        * On Snow we've got SIP WiFi and so can keep drive strengths=
 low to
> -        * reduce EMI.
> -        */
> -       mmc@12230000 {
> -               status =3D "okay";
> -               slot@0 {
> -                       pinctrl-names =3D "default";
> -                       pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;
> -               };
> -       };
> -
>         i2c@12CD0000 {
>                 max98095: codec@11 {
>                         compatible =3D "maxim,max98095";
> @@ -314,6 +307,14 @@
>                 samsung,invert-vclk;
>         };
>
> +       hdmi {
> +               hpd-gpio =3D <&gpx3 7 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hdmi_hpd_irq>;
> +               phy =3D <&hdmiphy>;
> +               ddc =3D <&i2c_2>;
> +       };
> +
>         dp-controller@145B0000 {
>                 status =3D "okay";
>                 pinctrl-names =3D "default";
> @@ -345,6 +346,10 @@
>  };
>
>  &i2c_0 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <378000>;
> +
>         max77686@09 {
>                 compatible =3D "maxim,max77686";
>                 interrupt-parent =3D <&gpx3>;
> @@ -491,6 +496,10 @@
>  };
>
>  &i2c_1 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <378000>;
> +
>         trackpad {
>                 reg =3D <0x67>;
>                 compatible =3D "cypress,cyapa";
> @@ -500,7 +509,119 @@
>         };
>  };
>
> +&i2c_2 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <66000>;
> +
> +       hdmiddc@50 {
> +               compatible =3D "samsung,exynos4210-hdmiddc";
> +               reg =3D <0x50>;
> +       };
> +};
> +
> +&i2c_3 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <66000>;
> +};
> +
> +&i2c_4 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <66000>;
> +};
> +
> +&i2c_5 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <66000>;
> +};
> +
> +&i2c_7 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <66000>;
> +};
> +
> +&i2c_8 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <378000>;
> +
> +       hdmiphy: hdmiphy@38 {
> +               compatible =3D "samsung,exynos4212-hdmiphy";
> +               reg =3D <0x38>;
> +       };
> +};
> +
> +&mmc_0 {
> +       status =3D "okay";
> +       num-slots =3D <1>;
> +       supports-highspeed;
> +       broken-cd;
> +       card-detect-delay =3D <200>;
> +       samsung,dw-mshc-ciu-div =3D <3>;
> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8>=
;
> +
> +       slot@0 {
> +               reg =3D <0>;
> +               bus-width =3D <8>;
> +       };
> +};
> +
> +&mmc_2 {
> +       status =3D "okay";
> +       num-slots =3D <1>;
> +       supports-highspeed;
> +       card-detect-delay =3D <200>;
> +       samsung,dw-mshc-ciu-div =3D <3>;
> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
> +
> +       slot@0 {
> +               reg =3D <0>;
> +               bus-width =3D <4>;
> +               wp-gpios =3D <&gpc2 1 0>;
> +       };
> +};
> +
> +/*
> + * On Snow we've got SIP WiFi and so can keep drive strengths low to
> + * reduce EMI.
> + */
> +&mmc_3 {
> +       status =3D "okay";
> +       num-slots =3D <1>;
> +       supports-highspeed;
> +       broken-cd;
> +       card-detect-delay =3D <200>;
> +       samsung,dw-mshc-ciu-div =3D <3>;
> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
> +
> +       slot@0 {
> +               reg =3D <0>;
> +               bus-width =3D <4>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;

This actually looks like a bug on snow.  I don't think these pinctrl
statements are taking effect and I think they belong at the mmc level,
not the slot level.  That's not a new bug introduced by you, though.
Mind fixing it?  You've already got it right for Spring mmc_1.


> +       };
> +};
> +
>  &pinctrl_0 {
> +       /*
> +        * Disabled pullups since external part has its own pullups a=
nd
> +        * double-pulling gets us out of spec in some cases.
> +        */
> +       i2c2_bus: i2c2-bus {
> +               samsung,pin-pud =3D <0>;
> +       };
> +
>         max77686_irq: max77686-irq {
>                 samsung,pins =3D "gpx3-2";
>                 samsung,pin-function =3D <0>;
> @@ -509,4 +630,10 @@
>         };
>  };
>
> +&spi_1 {
> +       status =3D "okay";
> +       samsung,spi-src-clk =3D <0>;
> +       num-cs =3D <1>;
> +};
> +
>  #include "cros-ec-keyboard.dtsi"
> --
> 1.9.3
>
