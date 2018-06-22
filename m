From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: s5pv210: Add initial DTS for Samsung Aries based phones.
Date: Fri, 22 Jun 2018 12:15:43 +0200
Message-ID: <2053829.UjnW4DntxV@acerlaptop>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1529608199-5583-3-git-send-email-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPf9BVXP19Yt36uEKz=bzMh3cDd6_wdyxoRRX3itk9kuhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPf9BVXP19Yt36uEKz=bzMh3cDd6_wdyxoRRX3itk9kuhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, June 22, 2018 9:41:02 AM CEST Krzysztof Kozlowski wrote:
> On 21 June 2018 at 21:09, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.c=
om> wrote:
> > This DTS file have initial support Samsung Aries based phones.
> > Initial version have support for:
> > - sdcard
> > - internal memory (present only on non 4g variant)
> > - max8998 pmic and rtc
> > - max17040 fuel gauge
> > - gpio keys
> > - fimd (no panel driver yet)
> > - usb (peripherial mode)
> > - wifi
> >
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
>=20
> Hi Pawel,
>=20
> Nice job in mainlining!
>=20
> Below you'll find some comments for improvement.
Thanks for all comments. I'll prepare v2 version with all issues fixed.

>=20
> > ---
> >  arch/arm/boot/dts/s5pv210-aries.dtsi | 397 +++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 397 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/s5pv210-aries.dtsi
> >
> > diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s=
5pv210-aries.dtsi
> > new file mode 100644
> > index 000000000000..6e8ac3615765
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
> > @@ -0,0 +1,397 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung's S5PV210 based Galaxy Aries board device tree source
> > + */
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/input/input.h>
>=20
> Is the input header used here?
>=20
> > +#include <dt-bindings/interrupt-controller/irq.h>
>=20
> Duplicated inclusion.
>=20
> > +#include "s5pv210.dtsi"
> > +
> > +/ {
> > +       compatible =3D "samsung,aries", "samsung,s5pv210";
> > +
> > +       aliases {
> > +               i2c6 =3D &i2c_pmic;
> > +               i2c9 =3D &i2c_fuel;
> > +       };
> > +
> > +       memory@30000000 {
> > +               device_type =3D "memory";
> > +               reg =3D <0x30000000 0x05000000
> > +                       0x40000000 0x10000000
> > +                       0x50000000 0x08000000>;
> > +       };
> > +
> > +       wifi_pwrseq: wifi-pwrseq {
> > +               compatible =3D "mmc-pwrseq-simple";
> > +               reset-gpios =3D <&gpg1 2 GPIO_ACTIVE_LOW>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&wlan_gpio_rst>;
> > +               post-power-on-delay-ms =3D <500>;
> > +               power-off-delay-us =3D <500>;
> > +       };
> > +
> > +       i2c_pmic: i2c-pmic {
>=20
> s/i2c-pmic/ to /i2c-gpio-0/
> to reflect generic class of this node. Change only the node name. The
> label can stay as is.
>=20
> > +               compatible =3D "i2c-gpio";
> > +               sda-gpios =3D <&gpj4 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAI=
N)>;
> > +               scl-gpios =3D <&gpj4 3 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAI=
N)>;
>=20
> Spaces around pipe |.
>=20
> > +               i2c-gpio,delay-us =3D <2>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               pmic@66 {
> > +                       compatible =3D "maxim,max8998";
> > +                       reg =3D <0x66>;
> > +                       interrupt-parent =3D <&gph0>;
> > +                       interrupts =3D <7 0>;
>=20
> If you really wanted 0 then IRQ_TYPE_NONE... but this should be a
> proper interrupt type.
>=20
> > +
> > +                       max8998,pmic-buck1-default-dvs-idx =3D <1>;
> > +                       max8998,pmic-buck1-dvs-gpios =3D <&gph0 3 GPIO_=
ACTIVE_HIGH>,
> > +                                                       <&gph0 4 GPIO_A=
CTIVE_HIGH>;
> > +                       max8998,pmic-buck1-dvs-voltage =3D <1275000>, <=
1200000>,
> > +                                                       <1050000>, <950=
000>;
> > +
> > +                       max8998,pmic-buck2-default-dvs-idx =3D <0>;
> > +                       max8998,pmic-buck2-dvs-gpio =3D <&gph0 5 GPIO_A=
CTIVE_HIGH>;
> > +                       max8998,pmic-buck2-dvs-voltage =3D <1100000>, <=
1000000>;
> > +
> > +                       regulators {
> > +                               ldo2_reg: LDO2 {
> > +                                       regulator-name =3D "VALIVE_1.2V=
";
> > +                                       regulator-min-microvolt =3D <12=
00000>;
> > +                                       regulator-max-microvolt =3D <12=
00000>;
> > +                                       regulator-always-on;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-on-in-suspend;
> > +                                       };
> > +                               };
> > +
> > +                               ldo3_reg: LDO3 {
> > +                                       regulator-name =3D "VUSB_1.1V";
> > +                                       regulator-min-microvolt =3D <11=
00000>;
> > +                                       regulator-max-microvolt =3D <11=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo4_reg: LDO4 {
> > +                                       regulator-name =3D "VADC_3.3V";
> > +                                       regulator-min-microvolt =3D <33=
00000>;
> > +                                       regulator-max-microvolt =3D <33=
00000>;
> > +                                       regulator-always-on;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo5_reg: LDO5 {
> > +                                       regulator-name =3D "VTF_2.8V";
> > +                                       regulator-min-microvolt =3D <28=
00000>;
> > +                                       regulator-max-microvolt =3D <28=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
>=20
> LDO6?
>=20
> All regulators should be defined in general. Most of the drivers would
> anyway register all of them and use driver-specific defaults for the
> ones which are missing in DT. I see that max8998 behaves differently
> and silently ignores missing regulators leaving them at bootloader
> settings. That's also not good because their initial settings might
> not be correct for current load and kernel cannot turn them off if
> needed. Also we want in general to have full description of HW in DT.
>=20
> The same applies to LDO10, clocks and ESAFEOUT2 later.
>=20
>=20
> > +
> > +                               ldo7_reg: LDO7 {
> > +                                       regulator-name =3D "VLCD_1.8V";
> > +                                       regulator-min-microvolt =3D <18=
00000>;
> > +                                       regulator-max-microvolt =3D <18=
00000>;
> > +                                       /* Till we get panel driver */
> > +                                       regulator-always-on;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo8_reg: LDO8 {
> > +                                       regulator-name =3D "VUSB_3.3V";
> > +                                       regulator-min-microvolt =3D <33=
00000>;
> > +                                       regulator-max-microvolt =3D <33=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo9_reg: LDO9 {
> > +                                       regulator-name =3D "VCC_2.8V_PD=
A";
> > +                                       regulator-min-microvolt =3D <28=
00000>;
> > +                                       regulator-max-microvolt =3D <28=
00000>;
> > +                                       regulator-always-on;
> > +                               };
> > +
> > +                               ldo11_reg: LDO11 {
> > +                                       regulator-name =3D "CAM_AF_3.0V=
";
> > +                                       regulator-min-microvolt =3D <30=
00000>;
> > +                                       regulator-max-microvolt =3D <30=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo12_reg: LDO12 {
> > +                                       regulator-name =3D "CAM_SENSOR_=
CORE_1.2V";
> > +                                       regulator-min-microvolt =3D <12=
00000>;
> > +                                       regulator-max-microvolt =3D <12=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo13_reg: LDO13 {
> > +                                       regulator-name =3D "VGA_VDDIO_2=
=2E8V";
> > +                                       regulator-min-microvolt =3D <28=
00000>;
> > +                                       regulator-max-microvolt =3D <28=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo14_reg: LDO14 {
> > +                                       regulator-name =3D "VGA_DVDD_1.=
8V";
> > +                                       regulator-min-microvolt =3D <18=
00000>;
> > +                                       regulator-max-microvolt =3D <18=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo15_reg: LDO15 {
> > +                                       regulator-name =3D "CAM_ISP_HOS=
T_2.8V";
> > +                                       regulator-min-microvolt =3D <28=
00000>;
> > +                                       regulator-max-microvolt =3D <28=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo16_reg: LDO16 {
> > +                                       regulator-name =3D "VGA_AVDD_2.=
8V";
> > +                                       regulator-min-microvolt =3D <28=
00000>;
> > +                                       regulator-max-microvolt =3D <28=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               ldo17_reg: LDO17 {
> > +                                       regulator-name =3D "VCC_3.0V_LC=
D";
> > +                                       regulator-min-microvolt =3D <30=
00000>;
> > +                                       regulator-max-microvolt =3D <30=
00000>;
> > +                                       /* Till we get panel driver */
> > +                                       regulator-always-on;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               buck1_reg: BUCK1 {
> > +                                       regulator-name =3D "vddarm";
> > +                                       regulator-min-microvolt =3D <75=
0000>;
> > +                                       regulator-max-microvolt =3D <15=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                               regulator-suspend-micro=
volt =3D <1250000>;
> > +                                       };
> > +                               };
> > +
> > +                               buck2_reg: BUCK2 {
> > +                                       regulator-name =3D "vddint";
> > +                                       regulator-min-microvolt =3D <75=
0000>;
> > +                                       regulator-max-microvolt =3D <15=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                               regulator-suspend-micro=
volt =3D <1100000>;
> > +                                       };
> > +                               };
> > +
> > +                               buck3_reg: BUCK3 {
> > +                                       regulator-name =3D "VCC_1.8V";
> > +                                       regulator-min-microvolt =3D <18=
00000>;
> > +                                       regulator-max-microvolt =3D <18=
00000>;
> > +                                       regulator-always-on;
> > +                               };
> > +
> > +                               buck4_reg: BUCK4 {
> > +                                       regulator-name =3D "CAM_ISP_COR=
E_1.2V";
> > +                                       regulator-min-microvolt =3D <12=
00000>;
> > +                                       regulator-max-microvolt =3D <12=
00000>;
> > +
> > +                                       regulator-state-mem {
> > +                                               regulator-off-in-suspen=
d;
> > +                                       };
> > +                               };
> > +
> > +                               safe1_sreg: ESAFEOUT1 {
> > +                                       regulator-name =3D "SAFEOUT1";
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       i2c_fuel: i2c-fuel {
>=20
> s/i2c-fuel/ to /i2c-gpio-1/
>=20
>=20
> > +               compatible =3D "i2c-gpio";
> > +               sda-gpios =3D <&mp05 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAI=
N)>;
> > +               scl-gpios =3D <&mp05 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAI=
N)>;
>=20
> Spaces around | please.
>=20
> > +               i2c-gpio,delay-us =3D <2>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               fuel@36 {
>=20
> Name: fuelgauge
>=20
> > +                       compatible =3D "maxim,max17040";
> > +                       interrupt-parent =3D <&vic0>;
> > +                       interrupts =3D <7>;
> > +                       reg =3D <0x36>;
> > +               };
> > +       };
> > +};
> > +
> > +&xusbxti {
> > +       clock-frequency =3D <24000000>;
> > +};
> > +
> > +&pinctrl0 {
>=20
> Please order all labels alphabetically. It reduces conflicts later
> with multiple changes.
>=20
> > +       wlan_bt_en: wlan-bt-en {
> > +               samsung,pins =3D "gpb-5";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> > +               samsung,pin-val =3D <1>;
> > +       };
> > +
> > +       wlan_gpio_rst: wlan-gpio-rst {
> > +               samsung,pins =3D "gpg1-2";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> > +       };
> > +
> > +       wifi_host_wake: wifi-host-wake {
> > +               samsung,pins =3D "gph2-4";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_DOWN>;
> > +               samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> > +       };
> > +
> > +       tf_detect: tf-detect {
> > +               samsung,pins =3D "gph3-4";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_INPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_DOWN>;
> > +               samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> > +       };
> > +
> > +       wifi_wake: wifi-wake {
> > +               samsung,pins =3D "gph3-5";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> > +       };
> > +
> > +       massmemory_en: massmemory-en {
> > +               samsung,pins =3D "gpj2-7";
> > +               samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> > +               samsung,pin-pud =3D <S3C64XX_PIN_PULL_NONE>;
> > +               samsung,pin-drv =3D <EXYNOS4_PIN_DRV_LV1>;
> > +       };
> > +};
> > +
> > +&uart0 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart2 {
> > +       status =3D "okay";
> > +};
> > +
> > +&sdhci1 {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +
> > +       bus-width =3D <4>;
> > +       max-frequency =3D <38400000>;
> > +       pinctrl-0 =3D <&sd1_clk &sd1_cmd &sd1_bus4 &wifi_wake &wifi_hos=
t_wake &wlan_bt_en>;
> > +       pinctrl-names =3D "default";
> > +       cap-sd-highspeed;
> > +       cap-mmc-highspeed;
> > +
> > +       mmc-pwrseq =3D <&wifi_pwrseq>;
> > +       non-removable;
> > +       status =3D "okay";
> > +
> > +       brcmf: bcrmf@1 {
>=20
> Name of node should describe generic class of the device so maybe
> "wlan" or "wlanbt"? Label is okay.
>=20
> Best regards,
> Krzysztof
>=20
