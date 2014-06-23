From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC 4/4] ARM: dts: exynos5250: Add Spring device tree
Date: Mon, 23 Jun 2014 12:47:56 -0700
Message-ID: <CAD=FV=WHAqASC+bp8mGVnhfr79F5LapJCTLtSfgUG8XuRUSCqw@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
	<1403486483-4063-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:34960 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756731AbaFWTr6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 15:47:58 -0400
Received: by mail-ve0-f180.google.com with SMTP id jw12so6415463veb.25
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 12:47:57 -0700 (PDT)
In-Reply-To: <1403486483-4063-5-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, tbroch@chromium.org, Tomasz Figa <t.figa@samsung.com>

Andreas,

Thanks for posting!  A first pass on this is below...


On Sun, Jun 22, 2014 at 6:21 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Adds initial support for the HP Chromebook 11.
>
> Cc: Vincent Palatin <vpalatin@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Stephan van Schaik <stephan@synkhronix.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/exynos5250-spring.dts | 556 ++++++++++++++++++++++=
++++++++++
>  2 files changed, 557 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5986ff6..dc2c5aa 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos4210-origen.dt=
b \
>         exynos5250-arndale.dtb \
>         exynos5250-smdk5250.dtb \
>         exynos5250-snow.dtb \
> +       exynos5250-spring.dtb \
>         exynos5260-xyref5260.dtb \
>         exynos5410-smdk5410.dtb \
>         exynos5420-arndale-octa.dtb \
> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/=
dts/exynos5250-spring.dts
> new file mode 100644
> index 0000000..e857d44
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -0,0 +1,556 @@
> +/*
> + * Google Spring board device tree source
> + *
> + * Copyright (c) 2013 Google, Inc
> + * Copyright (c) 2014 SUSE LINUX Products GmbH
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/dts-v1/;
> +#include "exynos5250.dtsi"
> +#include "exynos5250-cros-common.dtsi"

It is possible we may want to backpedal on the use of
"exynos5250-cros-common.dtsi".  I know that Olof (now CCed) said he
wasn't a fan of how it turned out.

The original idea was that it should include the arbitrary set of
things that are common between a chunk of Chrome OS boards.  As more
boards were introduced things would need to migrate from the "common"
file to the board files.

At the moment the current conventional wisdom is that some duplication
is better than the confusing movement of everything back and forth.
See exynos5420-peach-pit and exynos5800-peach-pi in ToT linux-next.


> +/ {
> +       model =3D "Google Spring";
> +       compatible =3D "google,spring", "samsung,exynos5250", "samsun=
g,exynos5";
> +
> +       pinctrl@11400000 {

The new best way to do things is to put this down at the bottom.  See
exynos5420-peach-pit as an example:

&pinctrl_0 {
  ...
}

Note that I believe it was decided that top-level references like that
should be sorted alphabetically.

If you wanted to apply that run to exynos5250-snow I don't think it
would be a terrible idea.


> +               s5m8767_dvs: s5m8767-dvs {
> +                       samsung,pins =3D "gpd1-0", "gpd1-1", "gpd1-2"=
;
> +                       samsung,pin-function =3D <0>;
> +                       samsung,pin-pud =3D <1>;
> +                       samsung,pin-drv =3D <0>;
> +               };
> +
> +               s5m8767_ds: s5m8767-ds {
> +                       samsung,pins =3D "gpx2-3", "gpx2-4", "gpx2-5"=
;
> +                       samsung,pin-function =3D <0>;
> +                       samsung,pin-pud =3D <1>;
> +                       samsung,pin-drv =3D <0>;
> +               };
> +
> +               tps65090_irq: tps65090-irq {
> +                       samsung,pins =3D "gpx2-6";
> +                       samsung,pin-function =3D <0>;
> +                       samsung,pin-pud =3D <0>;
> +                       samsung,pin-drv =3D <0>;
> +               };
> +
> +               s5m8767_irq: s5m8767-irq {
> +                       samsung,pins =3D "gpx3-2";
> +                       samsung,pin-function =3D <0>;
> +                       samsung,pin-pud =3D <0>;
> +                       samsung,pin-drv =3D <0>;
> +               };
> +
> +               hdmi_hpd_irq: hdmi-hpd-irq {
> +                       samsung,pins =3D "gpx3-7";
> +                       samsung,pin-function =3D <0>;
> +                       samsung,pin-pud =3D <1>;
> +                       samsung,pin-drv =3D <0>;
> +               };
> +       };
> +
> +       pinctrl@13400000 {
> +               hsic_reset: hsic-reset {
> +                       samsung,pins =3D "gpe1-0";
> +                       samsung,pin-function =3D <1>;
> +                       samsung,pin-pud =3D <0>;
> +                       samsung,pin-drv =3D <0>;
> +               };

I'm pretty sure that the HSIC reset needed some funky code to make it
work and I'm not sure what the status of that is upstream


> +       };
> +
> +       vbat: vbat-fixed-regulator {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vbat-supply";
> +               regulator-boot-on;
> +       };
> +
> +       usb@12000000 {
> +               status =3D "okay";
> +       };
> +
> +       usb3_vbus_reg: regulator-usb3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "P5.0V_USB3CON";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               gpio =3D <&gpe1 0 1>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hsic_reset>;
> +               enable-active-high;
> +       };
> +
> +       phy@12100000 {
> +               vbus-supply =3D <&usb3_vbus_reg>;
> +       };
> +
> +       usb@12110000 {
> +               samsung,vbus-gpio =3D <&gpx1 1 0>;
> +               status =3D "okay";
> +       };
> +
> +       usb@12120000 {
> +               status =3D "okay";
> +       };
> +
> +       mmc@12220000 {
> +               /* MMC2 pins are used as GPIO for eDP bridge control.=
 */
> +               status =3D "disabled";
> +       };
> +
> +       mmc@12230000 {
> +               status =3D "disabled";
> +       };
> +
> +       i2c@12C60000 {
> +               max77686@09 {

There is no max77686 on spring.  It uses s5m8767 in the place of max776=
86.

=2E..you've got "status =3D disabled", just remove it.


> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +
> +                       rtc {
> +                               reg =3D <0x6>;
> +                       };
> +               };
> +
> +               s5m8767_pmic@66 {
> +                       compatible =3D "samsung,s5m8767-pmic";
> +                       reg =3D <0x66>;
> +                       interrupt-parent =3D <&gpx3>;
> +                       interrupts =3D <2 0>;
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&s5m8767_irq &s5m8767_dvs &s5m=
8767_ds>;
> +                       wakeup-source;
> +
> +                       s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 1>, =
/* DVS1 */
> +                                                     <&gpd1 1 1>, /*=
 DVS2 */
> +                                                     <&gpd1 2 1>; /*=
 DVS3 */
> +
> +                       s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 1>, /=
* SET1 */
> +                                                    <&gpx2 4 1>, /* =
SET2 */
> +                                                    <&gpx2 5 1>; /* =
SET3 */

The final "1" in each of the GPIO specifiers above should be GPIO_ACTIV=
E_LOW.


> +
> +                       /*
> +                        * The following arrays of DVS voltages are n=
ot used, since we are
> +                        * not using GPIOs to control PMIC bucks, but=
 they must be defined
> +                        * to please the driver.
> +                        */
> +                       s5m8767,pmic-buck2-dvs-voltage =3D <1350000>,=
 <1300000>,
> +                                                        <1250000>, <=
1200000>,
> +                                                        <1150000>, <=
1100000>,
> +                                                        <1000000>, <=
950000>;
> +
> +                       s5m8767,pmic-buck3-dvs-voltage =3D <1100000>,=
 <1100000>,
> +                                                        <1100000>, <=
1100000>,
> +                                                        <1000000>, <=
1000000>,
> +                                                        <1000000>, <=
1000000>;
> +
> +                       s5m8767,pmic-buck4-dvs-voltage =3D <1200000>,=
 <1200000>,
> +                                                        <1200000>, <=
1200000>,
> +                                                        <1200000>, <=
1200000>,
> +                                                        <1200000>, <=
1200000>;
> +
> +                       clocks {
> +                               compatible =3D "samsung,s5m8767-clk";
> +                               #clock-cells =3D <1>;
> +                               clock-output-names =3D "en32khz_ap",
> +                                                    "en32khz_cp",
> +                                                    "en32khz_bt";
> +                       };
> +
> +                       regulators {
> +                               s5m_ldo4_reg: LDO4 {
> +                                       regulator-name =3D "P1.0V_LDO=
_OUT4";
> +                                       regulator-min-microvolt =3D <=
1000000>;
> +                                       regulator-max-microvolt =3D <=
1000000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <0>;

I think that "op_mode" here is questionable.  Adding Javier to the
thread who was looking at this for max77802 and possibly max77686.


> +                               };
> +
> +                               s5m_ldo5_reg: LDO5 {
> +                                       regulator-name =3D "P1.0V_LDO=
_OUT5";
> +                                       regulator-min-microvolt =3D <=
1000000>;
> +                                       regulator-max-microvolt =3D <=
1000000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <0>;
> +                               };
> +
> +                               s5m_ldo6_reg: LDO6 {
> +                                       regulator-name =3D "vdd_mydp"=
;
> +                                       regulator-min-microvolt =3D <=
1000000>;
> +                                       regulator-max-microvolt =3D <=
1000000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo7_reg: LDO7 {
> +                                       regulator-name =3D "P1.1V_LDO=
_OUT7";
> +                                       regulator-min-microvolt =3D <=
1100000>;
> +                                       regulator-max-microvolt =3D <=
1100000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo8_reg: LDO8 {
> +                                       regulator-name =3D "P1.0V_LDO=
_OUT8";
> +                                       regulator-min-microvolt =3D <=
1000000>;
> +                                       regulator-max-microvolt =3D <=
1000000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo10_reg: LDO10 {
> +                                       regulator-name =3D "P1.8V_LDO=
_OUT10";
> +                                       regulator-min-microvolt =3D <=
1800000>;
> +                                       regulator-max-microvolt =3D <=
1800000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo11_reg: LDO11 {
> +                                       regulator-name =3D "P1.8V_LDO=
_OUT11";
> +                                       regulator-min-microvolt =3D <=
1800000>;
> +                                       regulator-max-microvolt =3D <=
1800000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <0>;
> +                               };
> +
> +                               s5m_ldo12_reg: LDO12 {
> +                                       regulator-name =3D "P3.0V_LDO=
_OUT12";
> +                                       regulator-min-microvolt =3D <=
3000000>;
> +                                       regulator-max-microvolt =3D <=
3000000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo13_reg: LDO13 {
> +                                       regulator-name =3D "P1.8V_LDO=
_OUT13";
> +                                       regulator-min-microvolt =3D <=
1800000>;
> +                                       regulator-max-microvolt =3D <=
1800000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <0>;
> +                               };
> +
> +                               s5m_ldo14_reg: LDO14 {
> +                                       regulator-name =3D "P1.8V_LDO=
_OUT14";
> +                                       regulator-min-microvolt =3D <=
1800000>;
> +                                       regulator-max-microvolt =3D <=
1800000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo15_reg: LDO15 {
> +                                       regulator-name =3D "P1.0V_LDO=
_OUT15";
> +                                       regulator-min-microvolt =3D <=
1000000>;
> +                                       regulator-max-microvolt =3D <=
1000000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo16_reg: LDO16 {
> +                                       regulator-name =3D "P1.8V_LDO=
_OUT16";
> +                                       regulator-min-microvolt =3D <=
1800000>;
> +                                       regulator-max-microvolt =3D <=
1800000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               s5m_ldo17_reg: LDO17 {
> +                                       regulator-name =3D "P2.8V_LDO=
_OUT17";
> +                                       regulator-min-microvolt =3D <=
2800000>;
> +                                       regulator-max-microvolt =3D <=
2800000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <0>;
> +                               };
> +
> +                               s5m_ldo25_reg: LDO25 {
> +                                       regulator-name =3D "vdd_bridg=
e";
> +                                       regulator-min-microvolt =3D <=
1200000>;
> +                                       regulator-max-microvolt =3D <=
1200000>;
> +                                       regulator-always-on;
> +                                       op_mode =3D <1>;
> +                               };
> +
> +                               BUCK1 {
> +                                       regulator-name =3D "vdd_mif";
> +                                       regulator-min-microvolt =3D <=
950000>;
> +                                       regulator-max-microvolt =3D <=
1300000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               BUCK2 {
> +                                       regulator-name =3D "vdd_arm";
> +                                       regulator-min-microvolt =3D <=
850000>;
> +                                       regulator-max-microvolt =3D <=
1350000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               BUCK3 {
> +                                       regulator-name =3D "vdd_int";
> +                                       regulator-min-microvolt =3D <=
900000>;
> +                                       regulator-max-microvolt =3D <=
1200000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               BUCK4 {
> +                                       regulator-name =3D "vdd_g3d";
> +                                       regulator-min-microvolt =3D <=
850000>;
> +                                       regulator-max-microvolt =3D <=
1300000>;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <3>;
> +                               };
> +
> +                               BUCK5 {
> +                                       regulator-name =3D "P1.8V_BUC=
K_OUT5";
> +                                       regulator-min-microvolt =3D <=
1800000>;
> +                                       regulator-max-microvolt =3D <=
1800000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <1>;
> +                               };
> +
> +                               BUCK6 {
> +                                       regulator-name =3D "P1.2V_BUC=
K_OUT6";
> +                                       regulator-min-microvolt =3D <=
1200000>;
> +                                       regulator-max-microvolt =3D <=
1200000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <0>;
> +                               };
> +
> +                               BUCK9 {
> +                                       regulator-name =3D "vdd_ummc"=
;
> +                                       regulator-min-microvolt =3D <=
950000>;
> +                                       regulator-max-microvolt =3D <=
3000000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                                       op_mode =3D <3>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       i2c@12C70000 {
> +               trackpad {
> +                       status =3D "disabled";

Having this bogus entry here doesn't add anything.  Remove it until
the trackpad should be added.  See http://crbug.com/371114 for a
slightly stale bug about trackpad.


> +               };
> +       };
> +
> +       i2c@12CA0000 {
> +               embedded-controller {

Add "cros_ec" alias like snow.


> +                       compatible =3D "google,cros-ec-i2c";
> +                       reg =3D <0x1e>;
> +                       interrupts =3D <6 0>;
> +                       interrupt-parent =3D <&gpx1>;
> +                       wakeup-source;
> +
> +                       keyboard-controller {

Don't include keyboard-controller here.  Add:

#include "cros-ec-keyboard.dtsi"

=2E..at the bottom.  Note that I think that the spring EC has a special
"charger" key that it uses to indicate when a charger was plugged in
and unplugged.  I'm not sure how that will end up getting supported
upstream but you could just leave it out for now.

> +                               compatible =3D "google,cros-ec-keyb";
> +                               keypad,num-rows =3D <8>;
> +                               keypad,num-columns =3D <13>;

Don't you need pinctrl here?


> +                               google,needs-ghost-filter;
> +                               linux,keymap =3D <
> +                                       0x0001007d      /* L_META */
> +                                       0x0002003b      /* F1 */
> +                                       0x00030030      /* B */
> +                                       0x00040044      /* F10 */
> +                                       0x00060031      /* N */
> +                                       0x0008000d      /* =3D */
> +                                       0x000a0064      /* R_ALT */
> +
> +                                       0x01010001      /* ESC */
> +                                       0x0102003e      /* F4 */
> +                                       0x01030022      /* G */
> +                                       0x01040041      /* F7 */
> +                                       0x01060023      /* H */
> +                                       0x01080028      /* ' */
> +                                       0x01090043      /* F9 */
> +                                       0x010b000e      /* BKSPACE */
> +
> +                                       0x0200001d      /* L_CTRL */
> +                                       0x0201000f      /* TAB */
> +                                       0x0202003d      /* F3 */
> +                                       0x02030014      /* T */
> +                                       0x02040040      /* F6 */
> +                                       0x0205001b      /* ] */
> +                                       0x02060015      /* Y */
> +                                       0x02070056      /* 102ND */
> +                                       0x0208001a      /* [ */
> +                                       0x02090042      /* F8 */
> +
> +                                       0x03010029      /* GRAVE */
> +                                       0x0302003c      /* F2 */
> +                                       0x03030006      /* 5 */
> +                                       0x0304003f      /* F5 */
> +                                       0x03060007      /* 6 */
> +                                       0x0308000c      /* - */
> +                                       0x030b002b      /* \ */
> +
> +                                       0x04000061      /* R_CTRL */
> +                                       0x0401001e      /* A */
> +                                       0x04020020      /* D */
> +                                       0x04030021      /* F */
> +                                       0x0404001f      /* S */
> +                                       0x04050025      /* K */
> +                                       0x04060024      /* J */
> +                                       0x04080027      /* ; */
> +                                       0x04090026      /* L */
> +                                       0x040a002b      /* \ */
> +                                       0x040b001c      /* ENTER */
> +
> +                                       0x0501002c      /* Z */
> +                                       0x0502002e      /* C */
> +                                       0x0503002f      /* V */
> +                                       0x0504002d      /* X */
> +                                       0x05050033      /* , */
> +                                       0x05060032      /* M */
> +                                       0x0507002a      /* L_SHIFT */
> +                                       0x05080035      /* / */
> +                                       0x05090034      /* . */
> +                                       0x050B0039      /* SPACE */
> +
> +                                       0x06010002      /* 1 */
> +                                       0x06020004      /* 3 */
> +                                       0x06030005      /* 4 */
> +                                       0x06040003      /* 2 */
> +                                       0x06050009      /* 8 */
> +                                       0x06060008      /* 7 */
> +                                       0x0608000b      /* 0 */
> +                                       0x0609000a      /* 9 */
> +                                       0x060a0038      /* L_ALT */
> +                                       0x060b006c      /* DOWN */
> +                                       0x060c006a      /* RIGHT */
> +
> +                                       0x07010010      /* Q */
> +                                       0x07020012      /* E */
> +                                       0x07030013      /* R */
> +                                       0x07040011      /* W */
> +                                       0x07050017      /* I */
> +                                       0x07060016      /* U */
> +                                       0x07070036      /* R_SHIFT */
> +                                       0x07080019      /* P */
> +                                       0x07090018      /* O */
> +                                       0x070b0067      /* UP */
> +                                       0x070c0069      /* LEFT */
> +                               >;
> +                       };
> +               };
> +
> +               power-regulator {
> +                       compatible =3D "ti,tps65090";

I doubt tps65090 will "just work".  Does it?

On spring the tps65090 is not directly on the same i2c bus as the EC.
It's actually hidden behind the EC.

Locally in the ChromeOS tree there appears to be a forked copy of the
65090 regulator driver that's in use just for spring.  See this from
the ChromeOS 3.8 tree:

=2E/drivers/regulator/tps65090-regulator.c
=2E/drivers/regulator/cros_ec-tps65090.c

The Spring version of the driver sends EC commands directly to access
the tps65090.

It is possible (untested) that you could also talk to tps65090 over an
i2c tunnel.  On exynos5420-peach-pit we have a full fledged i2c
tunnel, but you may be able to extend the tunnel to export an i2c
tunnel for spring using something like
<https://chromium-review.googlesource.com/66116>


> +                       reg =3D <0x48>;
> +
> +                       /*
> +                        * Config irq to disable internal pulls
> +                        * even though we run in polling mode.
> +                        */
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&tps65090_irq>;
> +
> +                       vsys1-supply =3D <&vbat>;
> +                       vsys2-supply =3D <&vbat>;
> +                       vsys3-supply =3D <&vbat>;
> +                       infet1-supply =3D <&vbat>;
> +                       infet2-supply =3D <&vbat>;
> +                       infet3-supply =3D <&vbat>;
> +                       infet4-supply =3D <&vbat>;
> +                       infet5-supply =3D <&vbat>;
> +                       infet6-supply =3D <&vbat>;
> +                       infet7-supply =3D <&vbat>;
> +                       vsys-l1-supply =3D <&vbat>;
> +                       vsys-l2-supply =3D <&vbat>;
> +
> +                       regulators {
> +                               fet1 {
> +                                       regulator-name =3D "vcd_led";
> +                                       regulator-min-microvolt =3D <=
12000000>;
> +                                       regulator-max-microvolt =3D <=
12000000>;
> +                               };
> +                               fet3 {
> +                                       regulator-name =3D "wwan_r";
> +                                       regulator-min-microvolt =3D <=
3300000>;
> +                                       regulator-max-microvolt =3D <=
3300000>;
> +                                       regulator-always-on;
> +                               };
> +                               fet5 {
> +                                       regulator-name =3D "cam";
> +                                       regulator-min-microvolt =3D <=
3300000>;
> +                                       regulator-max-microvolt =3D <=
3300000>;
> +                                       regulator-always-on;
> +                               };
> +                               fet6 {
> +                                       regulator-name =3D "lcd_vdd";
> +                                       regulator-min-microvolt =3D <=
3300000>;
> +                                       regulator-max-microvolt =3D <=
3300000>;
> +                               };
> +                               fet7 {
> +                                       regulator-name =3D "ts";
> +                                       regulator-min-microvolt =3D <=
5000000>;
> +                                       regulator-max-microvolt =3D <=
5000000>;
> +                               };
> +                       };
> +
> +                       charger {
> +                               compatible =3D "ti,tps65090-charger";
> +                       };
> +               };
> +       };
> +
> +       hdmi {
> +               hdmi-en-supply =3D <&s5m_ldo8_reg>;
> +               vdd-supply =3D <&s5m_ldo8_reg>;
> +               vdd_osc-supply =3D <&s5m_ldo10_reg>;
> +               vdd_pll-supply =3D <&s5m_ldo8_reg>;
> +       };
> +
> +       fimd@14400000 {
> +               status =3D "okay";
> +               samsung,invert-vclk;
> +       };
> +
> +       dp-controller@145B0000 {
> +               status =3D "okay";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&dp_hpd>;

This is probably not right.  It looks as if spring uses gpc3-0 for
display port HPD (as a GPIO).  The upstream has this in the
exynos5250-pinctrl.dtsi as a different pin.

I think you'll need to define your own pinctrl here.


> +               samsung,color-space =3D <0>;
> +               samsung,dynamic-range =3D <0>;
> +               samsung,ycbcr-coeff =3D <0>;
> +               samsung,color-depth =3D <1>;
> +               samsung,link-rate =3D <0x0a>;
> +               samsung,lane-count =3D <1>;
> +               samsung,hpd-gpio =3D <&gpc3 0 0>;
> +
> +               display-timings {
> +                       native-mode =3D <&timing1>;
> +
> +                       timing1: timing@1 {
> +                               clock-frequency =3D <70589280>;
> +                               hactive =3D <1366>;
> +                               vactive =3D <768>;
> +                               hfront-porch =3D <40>;
> +                               hback-porch =3D <40>;
> +                               hsync-len =3D <32>;
> +                               vback-porch =3D <10>;
> +                               vfront-porch =3D <12>;
> +                               vsync-len =3D <6>;
> +                       };
> +               };
> +       };
> +
> +       fixed-rate-clocks {
> +               xxti {
> +                       compatible =3D "samsung,clock-xxti";
> +                       clock-frequency =3D <24000000>;
> +               };
> +       };
> +};

-Doug
