From: Vincent Palatin <vpalatin@chromium.org>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Thu, 31 Jul 2014 10:00:11 -0700
Message-ID: <CAP_ceTz+KRJzF9XV=_aLE+6sV6d5GqCtQ_daKtpFJfCZQ1erpA@mail.gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406822910-6255-5-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, ARM PORT <linux-arm-kernel@lists.infradead.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Always a bit late to the game.
One small comment inline.

Reviewed-by: Vincent Palatin <vpalatin@chromium.org>

On Thu, Jul 31, 2014 at 9:08 AM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Adds initial support for the HP Chromebook 11.
>
> Cc: Vincent Palatin <vpalatin@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Stephan van Schaik <stephan@synkhronix.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v3 -> v4:
>  * Fixed samsung,pin-function 1 -> 0 for dp-hpd-gpio
>  * Replaced dp-hpd-gpio with existing dp_hpd, overriding it
>
>  v2 -> v3:
>  * Use GPIO_ACTIVE_{LOW,HIGH} (Doug Anderson)
>  * Use symbolic KEY_POWER instead of comment
>  * Moved hsic_reset to new USB3503 node's reset-gpios (Vincent Palati=
n)
>  * Use dp_hpd_gpio for dp-controller (Doug Anderson, Ajay Kumar)
>  * Override sd1_{clk,cmd,cd,bus4} pinctrl similar to Snow (Doug Ander=
son)
>  * Added ec_irq pinctrl for cros_ec (Doug Anderson)
>  * Reordered nodes to minimize diff against Snow (Doug Anderson)
>  * Dropped obsolete mmc_2 override (Doug Anderson)
>  * Added lid-switch node (Doug Anderson)
>  * Added gpio-keys pinctrl (Doug Anderson)
>  * Added bootargs to avoid empty /chosen node and to document console=
 setting
>  * Renamed s5m8767_pmic node to avoid underscore
>  * Use new style for overriding inherited pinctrl nodes, too
>  * Enable i2s0 node
>
>  v1 -> v2:
>  * Use label-based overriding/extension of nodes. (Doug Anderson)
>  * Dropped tps65090 for now, until we know where to place it.
>  * Dropped non-Spring nodes from -cros-common.dtsi rather than disabl=
ing them.
>  * Enabled a missing MMC node for access to internal storage.
>  * Dropped display-timings from dp-controller node. (Ajay Kumar)
>
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/exynos5250-spring.dts | 539 ++++++++++++++++++++++=
++++++++++
>  2 files changed, 540 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 80a781f76e88..dec4c292f63d 100644
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
> index 000000000000..1fdfa04182fc
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -0,0 +1,539 @@
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
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
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
> +               bootargs =3D "console=3Dtty1";
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&power_key_irq>, <&lid_irq>;
> +
> +               power {
> +                       label =3D "Power";
> +                       gpios =3D <&gpx1 3 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <KEY_POWER>;
> +                       gpio-key,wakeup;
> +               };
> +
> +               lid-switch {
> +                       label =3D "Lid";
> +                       gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
> +                       linux,input-type =3D <5>; /* EV_SW */
> +                       linux,code =3D <0>; /* SW_LID */
> +                       debounce-interval =3D <1>;
> +                       gpio-key,wakeup;
> +               };
> +       };
> +
> +       usb3_vbus_reg: regulator-usb3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "P5.0V_USB3CON";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               gpio =3D <&gpe1 0 GPIO_ACTIVE_LOW>;
> +               enable-active-high;
> +       };

GPE1_0 GPIO is the HSIC hub (SMSC 3503) reset# line (already defined
below afaik).
On this design there is no external USB3 port, so no VBUS reg/load
switch for USB3.



> +
> +       usb@12110000 {
> +               samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       usb-hub {
> +               compatible =3D "smsc,usb3503a";
> +               reset-gpios =3D <&hsic_reset>;
> +       };
> +
> +       fixed-rate-clocks {
> +               xxti {
> +                       compatible =3D "samsung,clock-xxti";
> +                       clock-frequency =3D <24000000>;
> +               };
> +       };
> +
> +       hdmi {
> +               hpd-gpio =3D <&gpx3 7 GPIO_ACTIVE_HIGH>;
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
> +       fimd@14400000 {
> +               status =3D "okay";
> +               samsung,invert-vclk;
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
> +               samsung,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
> +       };
> +};
> +
> +&dp_hpd {
> +       samsung,pins =3D "gpc3-0";
> +       samsung,pin-function =3D <0>;
> +       samsung,pin-pud =3D <3>;
> +       samsung,pin-drv =3D <0>;
> +};
> +
> +&i2c_0 {
> +       status =3D "okay";
> +       samsung,i2c-sda-delay =3D <100>;
> +       samsung,i2c-max-bus-freq =3D <378000>;
> +
> +       s5m8767-pmic@66 {
> +               compatible =3D "samsung,s5m8767-pmic";
> +               reg =3D <0x66>;
> +               interrupt-parent =3D <&gpx3>;
> +               interrupts =3D <2 0>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>=
;
> +               wakeup-source;
> +
> +               s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 GPIO_ACTIVE_=
LOW>, /* DVS1 */
> +                                             <&gpd1 1 GPIO_ACTIVE_LO=
W>, /* DVS2 */
> +                                             <&gpd1 2 GPIO_ACTIVE_LO=
W>; /* DVS3 */
> +
> +               s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 GPIO_ACTIVE_L=
OW>, /* SET1 */
> +                                            <&gpx2 4 GPIO_ACTIVE_LOW=
>, /* SET2 */
> +                                            <&gpx2 5 GPIO_ACTIVE_LOW=
>; /* SET3 */
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
> +/*
> + * Disabled pullups since external part has its own pullups and
> + * double-pulling gets us out of spec in some cases.
> + */
> +&i2c2_bus {
> +       samsung,pin-pud =3D <0>;
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
> +               wakeup-source;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&ec_irq>;
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
> +&i2s0 {
> +       status =3D "okay";
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
> +
> +&pinctrl_0 {
> +       s5m8767_dvs: s5m8767-dvs {
> +               samsung,pins =3D "gpd1-0", "gpd1-1", "gpd1-2";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <1>;
> +               samsung,pin-drv =3D <0>;
> +       };
> +
> +       power_key_irq: power-key-irq {
> +               samsung,pins =3D "gpx1-3";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <0>;
> +       };
> +
> +       ec_irq: ec-irq {
> +               samsung,pins =3D "gpx1-6";
> +               samsung,pin-function =3D <0>;
> +               samsung,pin-pud =3D <0>;
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
> +       lid_irq: lid-irq {
> +               samsung,pins =3D "gpx3-5";
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
> +&sd1_clk {
> +       samsung,pin-drv =3D <0>;
> +};
> +
> +&sd1_cmd {
> +       samsung,pin-pud =3D <3>;
> +       samsung,pin-drv =3D <0>;
> +};
> +
> +&sd1_cd {
> +       samsung,pin-drv =3D <0>;
> +};
> +
> +&sd1_bus4 {
> +       samsung,pin-drv =3D <0>;
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
