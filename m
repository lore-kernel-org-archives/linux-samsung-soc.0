From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: exynos5250: Add Spring device tree
Date: Fri, 25 Jul 2014 09:02:05 -0700
Message-ID: <CAD=FV=Xu9b6433pV=bqi3jZZR03G6nyi2iNgbSXwAcRY4Y=4yA@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:45171 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764AbaGYQCH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 12:02:07 -0400
Received: by mail-vc0-f176.google.com with SMTP id id10so7665214vcb.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2014 09:02:05 -0700 (PDT)
In-Reply-To: <1405704009-8430-5-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>

Andreas,

On Fri, Jul 18, 2014 at 10:20 AM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Adds initial support for the HP Chromebook 11.
>
> Cc: Vincent Palatin <vpalatin@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Stephan van Schaik <stephan@synkhronix.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v1 -> v2:
>  * Use label-based overriding/extension of nodes. (Doug Anderson)
>  * Dropped tps65090 for now, until we know where to place it.
>  * Dropped non-Spring nodes from -cros-common.dtsi rather than disabl=
ing them.
>  * Enabled a missing MMC node for access to internal storage.
>  * Dropped display-timings from dp-controller node. (Ajay Kumar)
>
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/exynos5250-spring.dts | 485 ++++++++++++++++++++++=
++++++++++
>  2 files changed, 486 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 80a781f..dec4c29 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos4210-origen.dt=
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
> index 0000000..6695973
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -0,0 +1,485 @@
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
> +
> +/ {
> +       model =3D "Google Spring";
> +       compatible =3D "google,spring", "samsung,exynos5250", "samsun=
g,exynos5";
> +
> +       memory {
> +               reg =3D <0x40000000 0x80000000>;
> +       };
> +
> +       chosen {
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
> +       usb@12110000 {
> +               samsung,vbus-gpio =3D <&gpx1 1 0>;
> +               status =3D "okay";
> +       };
> +
> +       usb@12120000 {
> +               status =3D "okay";
> +       };
> +
> +       fimd@14400000 {
> +               status =3D "okay";
> +               samsung,invert-vclk;
> +       };
> +
> +       hdmi {
> +               hpd-gpio =3D <&gpx3 7 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hdmi_hpd_irq>;
> +               phy =3D <&hdmiphy>;
> +               ddc =3D <&i2c_2>;
> +               hdmi-en-supply =3D <&s5m_ldo8_reg>;
> +               vdd-supply =3D <&s5m_ldo8_reg>;
> +               vdd_osc-supply =3D <&s5m_ldo10_reg>;
> +               vdd_pll-supply =3D <&s5m_ldo8_reg>;
> +       };
> +
> +       dp-controller@145B0000 {
> +               status =3D "okay";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&dp_hpd>;
> +               samsung,color-space =3D <0>;
> +               samsung,dynamic-range =3D <0>;
> +               samsung,ycbcr-coeff =3D <0>;
> +               samsung,color-depth =3D <1>;
> +               samsung,link-rate =3D <0x0a>;
> +               samsung,lane-count =3D <1>;
> +               samsung,hpd-gpio =3D <&gpc3 0 0>;
> +       };
> +
> +       fixed-rate-clocks {
> +               xxti {
> +                       compatible =3D "samsung,clock-xxti";
> +                       clock-frequency =3D <24000000>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +
> +               power {
> +                       label =3D "Power";
> +                       gpios =3D <&gpx1 3 1>;
> +                       linux,code =3D <116>; /* KEY_POWER */
> +                       gpio-key,wakeup;
> +               };

Is the lid switch not working?

Where is your pinctrl?

Can you match this in sort order with snow to make diffs easier?


> +       };
> +};
> +
> +&i2c_0 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <378000>;
> +
> +       s5m8767_pmic@66 {
> +               compatible =3D "samsung,s5m8767-pmic";
> +               reg =3D <0x66>;
> +               interrupt-parent =3D <&gpx3>;
> +               interrupts =3D <2 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>=
;
> +               wakeup-source;
> +
> +               s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 1>, /* DVS1 =
*/
> +                                             <&gpd1 1 1>, /* DVS2 */
> +                                             <&gpd1 2 1>; /* DVS3 */
> +
> +               s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 1>, /* SET1 *=
/
> +                                            <&gpx2 4 1>, /* SET2 */
> +                                            <&gpx2 5 1>; /* SET3 */
> +
> +               /*
> +                * The following arrays of DVS voltages are not used,=
 since we are
> +                * not using GPIOs to control PMIC bucks, but they mu=
st be defined
> +                * to please the driver.
> +                */
> +               s5m8767,pmic-buck2-dvs-voltage =3D <1350000>, <130000=
0>,
> +                                                <1250000>, <1200000>=
,
> +                                                <1150000>, <1100000>=
,
> +                                                <1000000>, <950000>;
> +
> +               s5m8767,pmic-buck3-dvs-voltage =3D <1100000>, <110000=
0>,
> +                                                <1100000>, <1100000>=
,
> +                                                <1000000>, <1000000>=
,
> +                                                <1000000>, <1000000>=
;
> +
> +               s5m8767,pmic-buck4-dvs-voltage =3D <1200000>, <120000=
0>,
> +                                                <1200000>, <1200000>=
,
> +                                                <1200000>, <1200000>=
,
> +                                                <1200000>, <1200000>=
;
> +
> +               clocks {
> +                       compatible =3D "samsung,s5m8767-clk";
> +                       #clock-cells =3D <1>;
> +                       clock-output-names =3D "en32khz_ap",
> +                                            "en32khz_cp",
> +                                            "en32khz_bt";
> +               };
> +
> +               regulators {
> +                       s5m_ldo4_reg: LDO4 {
> +                               regulator-name =3D "P1.0V_LDO_OUT4";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <0>;
> +                       };
> +
> +                       s5m_ldo5_reg: LDO5 {
> +                               regulator-name =3D "P1.0V_LDO_OUT5";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <0>;
> +                       };
> +
> +                       s5m_ldo6_reg: LDO6 {
> +                               regulator-name =3D "vdd_mydp";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo7_reg: LDO7 {
> +                               regulator-name =3D "P1.1V_LDO_OUT7";
> +                               regulator-min-microvolt =3D <1100000>=
;
> +                               regulator-max-microvolt =3D <1100000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo8_reg: LDO8 {
> +                               regulator-name =3D "P1.0V_LDO_OUT8";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo10_reg: LDO10 {
> +                               regulator-name =3D "P1.8V_LDO_OUT10";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo11_reg: LDO11 {
> +                               regulator-name =3D "P1.8V_LDO_OUT11";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <0>;
> +                       };
> +
> +                       s5m_ldo12_reg: LDO12 {
> +                               regulator-name =3D "P3.0V_LDO_OUT12";
> +                               regulator-min-microvolt =3D <3000000>=
;
> +                               regulator-max-microvolt =3D <3000000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo13_reg: LDO13 {
> +                               regulator-name =3D "P1.8V_LDO_OUT13";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <0>;
> +                       };
> +
> +                       s5m_ldo14_reg: LDO14 {
> +                               regulator-name =3D "P1.8V_LDO_OUT14";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo15_reg: LDO15 {
> +                               regulator-name =3D "P1.0V_LDO_OUT15";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo16_reg: LDO16 {
> +                               regulator-name =3D "P1.8V_LDO_OUT16";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       s5m_ldo17_reg: LDO17 {
> +                               regulator-name =3D "P2.8V_LDO_OUT17";
> +                               regulator-min-microvolt =3D <2800000>=
;
> +                               regulator-max-microvolt =3D <2800000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <0>;
> +                       };
> +
> +                       s5m_ldo25_reg: LDO25 {
> +                               regulator-name =3D "vdd_bridge";
> +                               regulator-min-microvolt =3D <1200000>=
;
> +                               regulator-max-microvolt =3D <1200000>=
;
> +                               regulator-always-on;
> +                               op_mode =3D <1>;
> +                       };
> +
> +                       BUCK1 {
> +                               regulator-name =3D "vdd_mif";
> +                               regulator-min-microvolt =3D <950000>;
> +                               regulator-max-microvolt =3D <1300000>=
;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       BUCK2 {
> +                               regulator-name =3D "vdd_arm";
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <1350000>=
;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       BUCK3 {
> +                               regulator-name =3D "vdd_int";
> +                               regulator-min-microvolt =3D <900000>;
> +                               regulator-max-microvolt =3D <1200000>=
;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       BUCK4 {
> +                               regulator-name =3D "vdd_g3d";
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <1300000>=
;
> +                               regulator-boot-on;
> +                               op_mode =3D <3>;
> +                       };
> +
> +                       BUCK5 {
> +                               regulator-name =3D "P1.8V_BUCK_OUT5";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               op_mode =3D <1>;
> +                       };
> +
> +                       BUCK6 {
> +                               regulator-name =3D "P1.2V_BUCK_OUT6";
> +                               regulator-min-microvolt =3D <1200000>=
;
> +                               regulator-max-microvolt =3D <1200000>=
;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               op_mode =3D <0>;
> +                       };
> +
> +                       BUCK9 {
> +                               regulator-name =3D "vdd_ummc";
> +                               regulator-min-microvolt =3D <950000>;
> +                               regulator-max-microvolt =3D <3000000>=
;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               op_mode =3D <3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c_1 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <378000>;
> +};
> +
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
> +
> +       cros_ec: embedded-controller {
> +               compatible =3D "google,cros-ec-i2c";
> +               reg =3D <0x1e>;
> +               interrupts =3D <6 0>;
> +               interrupt-parent =3D <&gpx1>;

I think you want a pinctrl for gpx1-6, like Snow's "ec_irq".


> +               wakeup-source;
> +       };
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
> +&mmc_1 {
> +       status =3D "okay";
> +       num-slots =3D <1>;
> +       supports-highspeed;
> +       broken-cd;
> +       card-detect-delay =3D <200>;
> +       samsung,dw-mshc-ciu-div =3D <3>;
> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sd1_clk &sd1_cmd &sd1_cd &sd1_bus4>;
> +
> +       slot@0 {
> +               reg =3D <0>;
> +               bus-width =3D <4>;
> +       };
> +};

mmc_1 on Spring matches with mmc_3 on Snow.  That means you need to
make sure you've got the reduced drive strengths, too.  I don't think
your device tree has these.  Specifically you need local overrides of
sd1_clk, sd1_cmd, etc to lower drive strengths.


> +
> +&mmc_2 {
> +       /* MMC2 pins are used as GPIO for eDP bridge control. */
> +       status =3D "disabled";
> +};

Remove the mmc_2 reference.  It's disabled in exynos5250.dtsi already.


> +
> +&pinctrl_0 {
> +       /*
> +        * Disabled pullups since external part has its own pullups a=
nd
> +        * double-pulling gets us out of spec in some cases.
> +        */
> +       i2c2_bus: i2c2-bus {
> +               samsung,pin-pud =3D <0>;
> +       };
> +
> +       s5m8767_dvs: s5m8767-dvs {
> +               samsung,pins =3D "gpd1-0", "gpd1-1", "gpd1-2";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <1>;
> +               samsung,pin-drv =3D <0>;
> +       };
> +
> +       s5m8767_ds: s5m8767-ds {
> +               samsung,pins =3D "gpx2-3", "gpx2-4", "gpx2-5";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <1>;
> +               samsung,pin-drv =3D <0>;
> +       };
> +
> +       s5m8767_irq: s5m8767-irq {
> +               samsung,pins =3D "gpx3-2";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <0>;
> +       };
> +
> +       hdmi_hpd_irq: hdmi-hpd-irq {
> +               samsung,pins =3D "gpx3-7";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <1>;
> +               samsung,pin-drv =3D <0>;
> +       };

Ideally you could do one more cleanup patch to snow first to make
diffs easier between the two dts files.  Moving things in the snow
file from "pinctrl@11400000" to the pinctrl_0 section would help.
=2E..and other cleanups you could do to snow to make diffs similar woul=
d
also be really great.


> +};
> +
> +&pinctrl_1 {
> +       hsic_reset: hsic-reset {
> +               samsung,pins =3D "gpe1-0";
> +               samsung,pin-function =3D <1>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <0>;
> +       };
> +};
> +
> +&spi_1 {
> +       status =3D "okay";
> +       samsung,spi-src-clk =3D <0>;
> +       num-cs =3D <1>;
> +};
> +
> +&usbdrd_phy {
> +       vbus-supply =3D <&usb3_vbus_reg>;
> +};
> +
> +#include "cros-ec-keyboard.dtsi"
> --
> 1.9.3
>
