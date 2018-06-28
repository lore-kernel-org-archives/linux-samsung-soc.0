From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 02/10] ARM: dts: s5pv210: Add initial DTS for Samsung
 Aries based phones
Date: Thu, 28 Jun 2018 09:41:21 +0200
Message-ID: <CAJKOXPdxdwmCcXNnYNCc81hZVi=YUs_+CNKev_gPZbXoMPPepg@mail.gmail.com>
References: <1530119544-30023-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1530119544-30023-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530119544-30023-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On 27 June 2018 at 19:12, Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
> wrote:
> This DTS file have initial support Samsung Aries based phones.
> Initial version have support for:
> - sdcard
> - internal memory (present only on non 4g variant)
> - max8998 pmic and rtc
> - max17040 fuel gauge
> - gpio keys
> - fimd (no panel driver yet)
> - usb (peripherial mode)
> - wifi
>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>
> Changes from v1:
>   - Removed duplicated and unneeded headers
>   - Corrected node names
>   - Added missing spaces
>   - Removed unneeded pinctrl and sorted entries
>   - Set correct interrupt type for max8998 pmic
>   - Add missing regulators
> ---
> ---
>  arch/arm/boot/dts/s5pv210-aries.dtsi | 423 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 423 insertions(+)
>  create mode 100644 arch/arm/boot/dts/s5pv210-aries.dtsi
>
> diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5p=
v210-aries.dtsi
> new file mode 100644
> index 000000000000..61b6cf76265f
> --- /dev/null
> +++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's S5PV210 based Galaxy Aries board device tree source
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "s5pv210.dtsi"
> +
> +/ {
> +       compatible =3D "samsung,aries", "samsung,s5pv210";
> +
> +       aliases {
> +               i2c6 =3D &i2c_pmic;
> +               i2c9 =3D &i2c_fuel;
> +       };
> +
> +       memory@30000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x30000000 0x05000000
> +                       0x40000000 0x10000000
> +                       0x50000000 0x08000000>;
> +       };
> +
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&gpg1 2 GPIO_ACTIVE_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wlan_gpio_rst>;
> +               post-power-on-delay-ms =3D <500>;
> +               power-off-delay-us =3D <500>;
> +       };
> +
> +       i2c_pmic: i2c-gpio-0 {
> +               compatible =3D "i2c-gpio";
> +               sda-gpios =3D <&gpj4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
> +               scl-gpios =3D <&gpj4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
> +               i2c-gpio,delay-us =3D <2>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               pmic@66 {
> +                       compatible =3D "maxim,max8998";
> +                       reg =3D <0x66>;
> +                       interrupt-parent =3D <&gph0>;
> +                       interrupts =3D <7 IRQ_TYPE_EDGE_FALLING>;
> +
> +                       max8998,pmic-buck1-default-dvs-idx =3D <1>;
> +                       max8998,pmic-buck1-dvs-gpios =3D <&gph0 3 GPIO_AC=
TIVE_HIGH>,
> +                                                       <&gph0 4 GPIO_ACT=
IVE_HIGH>;
> +                       max8998,pmic-buck1-dvs-voltage =3D <1275000>, <12=
00000>,
> +                                                       <1050000>, <95000=
0>;
> +
> +                       max8998,pmic-buck2-default-dvs-idx =3D <0>;
> +                       max8998,pmic-buck2-dvs-gpio =3D <&gph0 5 GPIO_ACT=
IVE_HIGH>;
> +                       max8998,pmic-buck2-dvs-voltage =3D <1100000>, <10=
00000>;
> +
> +                       regulators {
> +                               ldo2_reg: LDO2 {
> +                                       regulator-name =3D "VALIVE_1.2V";
> +                                       regulator-min-microvolt =3D <1200=
000>;
> +                                       regulator-max-microvolt =3D <1200=
000>;
> +                                       regulator-always-on;
> +
> +                                       regulator-state-mem {
> +                                               regulator-on-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo3_reg: LDO3 {
> +                                       regulator-name =3D "VUSB_1.1V";
> +                                       regulator-min-microvolt =3D <1100=
000>;
> +                                       regulator-max-microvolt =3D <1100=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo4_reg: LDO4 {
> +                                       regulator-name =3D "VADC_3.3V";
> +                                       regulator-min-microvolt =3D <3300=
000>;
> +                                       regulator-max-microvolt =3D <3300=
000>;
> +                                       regulator-always-on;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo5_reg: LDO5 {
> +                                       regulator-name =3D "VTF_2.8V";
> +                                       regulator-min-microvolt =3D <2800=
000>;
> +                                       regulator-max-microvolt =3D <2800=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo6_reg: LDO6 {
> +                                       regulator-name =3D "LDO6";
> +                                       regulator-min-microvolt =3D <1600=
000>;
> +                                       regulator-max-microvolt =3D <3600=
000>;
> +                               };
> +
> +                               ldo7_reg: LDO7 {
> +                                       regulator-name =3D "VLCD_1.8V";
> +                                       regulator-min-microvolt =3D <1800=
000>;
> +                                       regulator-max-microvolt =3D <1800=
000>;
> +                                       /* Till we get panel driver */
> +                                       regulator-always-on;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo8_reg: LDO8 {
> +                                       regulator-name =3D "VUSB_3.3V";
> +                                       regulator-min-microvolt =3D <3300=
000>;
> +                                       regulator-max-microvolt =3D <3300=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo9_reg: LDO9 {
> +                                       regulator-name =3D "VCC_2.8V_PDA"=
;
> +                                       regulator-min-microvolt =3D <2800=
000>;
> +                                       regulator-max-microvolt =3D <2800=
000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo10_reg: LDO10 {
> +                                       regulator-name =3D "VPLL_1.2V";
> +                                       regulator-min-microvolt =3D <1200=
000>;
> +                                       regulator-max-microvolt =3D <1200=
000>;
> +                                       regulator-always-on;
> +
> +                                       regulator-state-mem {
> +                                               regulator-on-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo11_reg: LDO11 {
> +                                       regulator-name =3D "CAM_AF_3.0V";
> +                                       regulator-min-microvolt =3D <3000=
000>;
> +                                       regulator-max-microvolt =3D <3000=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo12_reg: LDO12 {
> +                                       regulator-name =3D "CAM_SENSOR_CO=
RE_1.2V";
> +                                       regulator-min-microvolt =3D <1200=
000>;
> +                                       regulator-max-microvolt =3D <1200=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo13_reg: LDO13 {
> +                                       regulator-name =3D "VGA_VDDIO_2.8=
V";
> +                                       regulator-min-microvolt =3D <2800=
000>;
> +                                       regulator-max-microvolt =3D <2800=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo14_reg: LDO14 {
> +                                       regulator-name =3D "VGA_DVDD_1.8V=
";
> +                                       regulator-min-microvolt =3D <1800=
000>;
> +                                       regulator-max-microvolt =3D <1800=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo15_reg: LDO15 {
> +                                       regulator-name =3D "CAM_ISP_HOST_=
2.8V";
> +                                       regulator-min-microvolt =3D <2800=
000>;
> +                                       regulator-max-microvolt =3D <2800=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo16_reg: LDO16 {
> +                                       regulator-name =3D "VGA_AVDD_2.8V=
";
> +                                       regulator-min-microvolt =3D <2800=
000>;
> +                                       regulator-max-microvolt =3D <2800=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ldo17_reg: LDO17 {
> +                                       regulator-name =3D "VCC_3.0V_LCD"=
;
> +                                       regulator-min-microvolt =3D <3000=
000>;
> +                                       regulator-max-microvolt =3D <3000=
000>;
> +                                       /* Till we get panel driver */
> +                                       regulator-always-on;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               buck1_reg: BUCK1 {
> +                                       regulator-name =3D "vddarm";
> +                                       regulator-min-microvolt =3D <7500=
00>;
> +                                       regulator-max-microvolt =3D <1500=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                               regulator-suspend-microvo=
lt =3D <1250000>;
> +                                       };
> +                               };
> +
> +                               buck2_reg: BUCK2 {
> +                                       regulator-name =3D "vddint";
> +                                       regulator-min-microvolt =3D <7500=
00>;
> +                                       regulator-max-microvolt =3D <1500=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                               regulator-suspend-microvo=
lt =3D <1100000>;
> +                                       };
> +                               };
> +
> +                               buck3_reg: BUCK3 {
> +                                       regulator-name =3D "VCC_1.8V";
> +                                       regulator-min-microvolt =3D <1800=
000>;
> +                                       regulator-max-microvolt =3D <1800=
000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               buck4_reg: BUCK4 {
> +                                       regulator-name =3D "CAM_ISP_CORE_=
1.2V";
> +                                       regulator-min-microvolt =3D <1200=
000>;
> +                                       regulator-max-microvolt =3D <1200=
000>;
> +
> +                                       regulator-state-mem {
> +                                               regulator-off-in-suspend;
> +                                       };
> +                               };
> +
> +                               ap32khz_reg: EN32KHz-AP {
> +                                       regulator-name =3D "32KHz AP";
> +                                       regulator-always-on;
> +                               };
> +
> +                               cp32khz_reg: EN32KHz-CP {
> +                                       regulator-name =3D "32KHz CP";
> +                               };
> +
> +                               vichg_reg: ENVICHG {
> +                                       regulator-name =3D "VICHG";
> +                                       regulator-always-on;
> +                               };
> +
> +                               safe1_sreg: ESAFEOUT1 {
> +                                       regulator-name =3D "SAFEOUT1";
> +                               };
> +
> +                               safe2_sreg: ESAFEOUT2 {
> +                                       regulator-name =3D "SAFEOUT2";
> +                               };
> +                       };
> +               };
> +       };
> +
> +       i2c_fuel: i2c-gpio-1 {
> +               compatible =3D "i2c-gpio";
> +               sda-gpios =3D <&mp05 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
> +               scl-gpios =3D <&mp05 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
> +               i2c-gpio,delay-us =3D <2>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               fuelgauge@36 {
> +                       compatible =3D "maxim,max17040";
> +                       interrupt-parent =3D <&vic0>;
> +                       interrupts =3D <7>;
> +                       reg =3D <0x36>;
> +               };
> +       };
> +};
> +
> +&xusbxti {
> +       clock-frequency =3D <24000000>;
> +};
> +
> +&pinctrl0 {

Thanks for changes. You missed one part - ordering the labels here
alphabetically, so:

&fimd {}
&hsotg {}
...
&xusbxti {}

Best regards,
Krzysztof
