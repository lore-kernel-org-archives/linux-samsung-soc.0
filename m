From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: exynos5250: Add Spring device tree
Date: Wed, 30 Jul 2014 15:06:36 +0200
Message-ID: <53D8EDDC.7010407@suse.de>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>	<1405704009-8430-5-git-send-email-afaerber@suse.de> <CAD=FV=Xu9b6433pV=bqi3jZZR03G6nyi2iNgbSXwAcRY4Y=4yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Xu9b6433pV=bqi3jZZR03G6nyi2iNgbSXwAcRY4Y=4yA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM PORT <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Doug,

Am 25.07.2014 18:02, schrieb Doug Anderson:
> Andreas,
>=20
> On Fri, Jul 18, 2014 at 10:20 AM, Andreas F=C3=A4rber <afaerber@suse.=
de> wrote:
>> +       gpio-keys {
>> +               compatible =3D "gpio-keys";
>> +
>> +               power {
>> +                       label =3D "Power";
>> +                       gpios =3D <&gpx1 3 1>;
>> +                       linux,code =3D <116>; /* KEY_POWER */
>> +                       gpio-key,wakeup;
>> +               };
>=20
> Is the lid switch not working?

No, I don't see any reaction at least. I notice that 3.8 has pinctrls o=
n
gpio-keys directly though...

> Where is your pinctrl?

Maybe that's what you mean here?

> Can you match this in sort order with snow to make diffs easier?

Done.

>> +       };
>> +};
>> +
>> +&i2c_0 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <378000>;
>> +
>> +       s5m8767_pmic@66 {
>> +               compatible =3D "samsung,s5m8767-pmic";
>> +               reg =3D <0x66>;
>> +               interrupt-parent =3D <&gpx3>;
>> +               interrupts =3D <2 0>;
>> +               pinctrl-names =3D "default";
>> +               pinctrl-0 =3D <&s5m8767_irq &s5m8767_dvs &s5m8767_ds=
>;
>> +               wakeup-source;
>> +
>> +               s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 1>, /* DVS1=
 */
>> +                                             <&gpd1 1 1>, /* DVS2 *=
/
>> +                                             <&gpd1 2 1>; /* DVS3 *=
/
>> +
>> +               s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 1>, /* SET1 =
*/
>> +                                            <&gpx2 4 1>, /* SET2 */
>> +                                            <&gpx2 5 1>; /* SET3 */
>> +
>> +               /*
>> +                * The following arrays of DVS voltages are not used=
, since we are
>> +                * not using GPIOs to control PMIC bucks, but they m=
ust be defined
>> +                * to please the driver.
>> +                */
>> +               s5m8767,pmic-buck2-dvs-voltage =3D <1350000>, <13000=
00>,
>> +                                                <1250000>, <1200000=
>,
>> +                                                <1150000>, <1100000=
>,
>> +                                                <1000000>, <950000>=
;
>> +
>> +               s5m8767,pmic-buck3-dvs-voltage =3D <1100000>, <11000=
00>,
>> +                                                <1100000>, <1100000=
>,
>> +                                                <1000000>, <1000000=
>,
>> +                                                <1000000>, <1000000=
>;
>> +
>> +               s5m8767,pmic-buck4-dvs-voltage =3D <1200000>, <12000=
00>,
>> +                                                <1200000>, <1200000=
>,
>> +                                                <1200000>, <1200000=
>,
>> +                                                <1200000>, <1200000=
>;
>> +
>> +               clocks {
>> +                       compatible =3D "samsung,s5m8767-clk";
>> +                       #clock-cells =3D <1>;
>> +                       clock-output-names =3D "en32khz_ap",
>> +                                            "en32khz_cp",
>> +                                            "en32khz_bt";
>> +               };
>> +
>> +               regulators {
>> +                       s5m_ldo4_reg: LDO4 {
>> +                               regulator-name =3D "P1.0V_LDO_OUT4";
>> +                               regulator-min-microvolt =3D <1000000=
>;
>> +                               regulator-max-microvolt =3D <1000000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <0>;
>> +                       };
>> +
>> +                       s5m_ldo5_reg: LDO5 {
>> +                               regulator-name =3D "P1.0V_LDO_OUT5";
>> +                               regulator-min-microvolt =3D <1000000=
>;
>> +                               regulator-max-microvolt =3D <1000000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <0>;
>> +                       };
>> +
>> +                       s5m_ldo6_reg: LDO6 {
>> +                               regulator-name =3D "vdd_mydp";
>> +                               regulator-min-microvolt =3D <1000000=
>;
>> +                               regulator-max-microvolt =3D <1000000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo7_reg: LDO7 {
>> +                               regulator-name =3D "P1.1V_LDO_OUT7";
>> +                               regulator-min-microvolt =3D <1100000=
>;
>> +                               regulator-max-microvolt =3D <1100000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo8_reg: LDO8 {
>> +                               regulator-name =3D "P1.0V_LDO_OUT8";
>> +                               regulator-min-microvolt =3D <1000000=
>;
>> +                               regulator-max-microvolt =3D <1000000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo10_reg: LDO10 {
>> +                               regulator-name =3D "P1.8V_LDO_OUT10"=
;
>> +                               regulator-min-microvolt =3D <1800000=
>;
>> +                               regulator-max-microvolt =3D <1800000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo11_reg: LDO11 {
>> +                               regulator-name =3D "P1.8V_LDO_OUT11"=
;
>> +                               regulator-min-microvolt =3D <1800000=
>;
>> +                               regulator-max-microvolt =3D <1800000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <0>;
>> +                       };
>> +
>> +                       s5m_ldo12_reg: LDO12 {
>> +                               regulator-name =3D "P3.0V_LDO_OUT12"=
;
>> +                               regulator-min-microvolt =3D <3000000=
>;
>> +                               regulator-max-microvolt =3D <3000000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo13_reg: LDO13 {
>> +                               regulator-name =3D "P1.8V_LDO_OUT13"=
;
>> +                               regulator-min-microvolt =3D <1800000=
>;
>> +                               regulator-max-microvolt =3D <1800000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <0>;
>> +                       };
>> +
>> +                       s5m_ldo14_reg: LDO14 {
>> +                               regulator-name =3D "P1.8V_LDO_OUT14"=
;
>> +                               regulator-min-microvolt =3D <1800000=
>;
>> +                               regulator-max-microvolt =3D <1800000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo15_reg: LDO15 {
>> +                               regulator-name =3D "P1.0V_LDO_OUT15"=
;
>> +                               regulator-min-microvolt =3D <1000000=
>;
>> +                               regulator-max-microvolt =3D <1000000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo16_reg: LDO16 {
>> +                               regulator-name =3D "P1.8V_LDO_OUT16"=
;
>> +                               regulator-min-microvolt =3D <1800000=
>;
>> +                               regulator-max-microvolt =3D <1800000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       s5m_ldo17_reg: LDO17 {
>> +                               regulator-name =3D "P2.8V_LDO_OUT17"=
;
>> +                               regulator-min-microvolt =3D <2800000=
>;
>> +                               regulator-max-microvolt =3D <2800000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <0>;
>> +                       };
>> +
>> +                       s5m_ldo25_reg: LDO25 {
>> +                               regulator-name =3D "vdd_bridge";
>> +                               regulator-min-microvolt =3D <1200000=
>;
>> +                               regulator-max-microvolt =3D <1200000=
>;
>> +                               regulator-always-on;
>> +                               op_mode =3D <1>;
>> +                       };
>> +
>> +                       BUCK1 {
>> +                               regulator-name =3D "vdd_mif";
>> +                               regulator-min-microvolt =3D <950000>=
;
>> +                               regulator-max-microvolt =3D <1300000=
>;
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       BUCK2 {
>> +                               regulator-name =3D "vdd_arm";
>> +                               regulator-min-microvolt =3D <850000>=
;
>> +                               regulator-max-microvolt =3D <1350000=
>;
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       BUCK3 {
>> +                               regulator-name =3D "vdd_int";
>> +                               regulator-min-microvolt =3D <900000>=
;
>> +                               regulator-max-microvolt =3D <1200000=
>;
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       BUCK4 {
>> +                               regulator-name =3D "vdd_g3d";
>> +                               regulator-min-microvolt =3D <850000>=
;
>> +                               regulator-max-microvolt =3D <1300000=
>;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +
>> +                       BUCK5 {
>> +                               regulator-name =3D "P1.8V_BUCK_OUT5"=
;
>> +                               regulator-min-microvolt =3D <1800000=
>;
>> +                               regulator-max-microvolt =3D <1800000=
>;
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <1>;
>> +                       };
>> +
>> +                       BUCK6 {
>> +                               regulator-name =3D "P1.2V_BUCK_OUT6"=
;
>> +                               regulator-min-microvolt =3D <1200000=
>;
>> +                               regulator-max-microvolt =3D <1200000=
>;
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <0>;
>> +                       };
>> +
>> +                       BUCK9 {
>> +                               regulator-name =3D "vdd_ummc";
>> +                               regulator-min-microvolt =3D <950000>=
;
>> +                               regulator-max-microvolt =3D <3000000=
>;
>> +                               regulator-always-on;
>> +                               regulator-boot-on;
>> +                               op_mode =3D <3>;
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&i2c_1 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <378000>;
>> +};
>> +
>> +&i2c_2 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <66000>;
>> +
>> +       hdmiddc@50 {
>> +               compatible =3D "samsung,exynos4210-hdmiddc";
>> +               reg =3D <0x50>;
>> +       };
>> +};
>> +
>> +&i2c_3 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <66000>;
>> +};
>> +
>> +&i2c_4 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <66000>;
>> +
>> +       cros_ec: embedded-controller {
>> +               compatible =3D "google,cros-ec-i2c";
>> +               reg =3D <0x1e>;
>> +               interrupts =3D <6 0>;
>> +               interrupt-parent =3D <&gpx1>;
>=20
> I think you want a pinctrl for gpx1-6, like Snow's "ec_irq".

Done. On v1 you had asked about a pinctrl for the keyboard, which has
none, but cros_ec itself does in fact.

>> +               wakeup-source;
>> +       };
>> +};
>> +
>> +&i2c_5 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <66000>;
>> +};
>> +
>> +&i2c_7 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <66000>;
>> +};
>> +
>> +&i2c_8 {
>> +       status =3D "okay";
>> +       samsung,i2c-sda-delay =3D <100>;
>> +       samsung,i2c-max-bus-freq =3D <378000>;
>> +
>> +       hdmiphy: hdmiphy@38 {
>> +               compatible =3D "samsung,exynos4212-hdmiphy";
>> +               reg =3D <0x38>;
>> +       };
>> +};
>> +
>> +&mmc_0 {
>> +       status =3D "okay";
>> +       num-slots =3D <1>;
>> +       supports-highspeed;
>> +       broken-cd;
>> +       card-detect-delay =3D <200>;
>> +       samsung,dw-mshc-ciu-div =3D <3>;
>> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
>> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
>> +       pinctrl-names =3D "default";
>> +       pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8=
>;
>> +
>> +       slot@0 {
>> +               reg =3D <0>;
>> +               bus-width =3D <8>;
>> +       };
>> +};
>> +
>> +&mmc_1 {
>> +       status =3D "okay";
>> +       num-slots =3D <1>;
>> +       supports-highspeed;
>> +       broken-cd;
>> +       card-detect-delay =3D <200>;
>> +       samsung,dw-mshc-ciu-div =3D <3>;
>> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
>> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
>> +       pinctrl-names =3D "default";
>> +       pinctrl-0 =3D <&sd1_clk &sd1_cmd &sd1_cd &sd1_bus4>;
>> +
>> +       slot@0 {
>> +               reg =3D <0>;
>> +               bus-width =3D <4>;
>> +       };
>> +};
>=20
> mmc_1 on Spring matches with mmc_3 on Snow.  That means you need to
> make sure you've got the reduced drive strengths, too.  I don't think
> your device tree has these.  Specifically you need local overrides of
> sd1_clk, sd1_cmd, etc to lower drive strengths.

Done. Wasn't sure about _cd, so I included it.

>> +
>> +&mmc_2 {
>> +       /* MMC2 pins are used as GPIO for eDP bridge control. */
>> +       status =3D "disabled";
>> +};
>=20
> Remove the mmc_2 reference.  It's disabled in exynos5250.dtsi already=
=2E

Done. That drops the documentation of why, too, though.

>> +
>> +&pinctrl_0 {
>> +       /*
>> +        * Disabled pullups since external part has its own pullups =
and
>> +        * double-pulling gets us out of spec in some cases.
>> +        */
>> +       i2c2_bus: i2c2-bus {
>> +               samsung,pin-pud =3D <0>;
>> +       };
>> +
>> +       s5m8767_dvs: s5m8767-dvs {
>> +               samsung,pins =3D "gpd1-0", "gpd1-1", "gpd1-2";
>> +               samsung,pin-function =3D <0>;
>> +               samsung,pin-pud =3D <1>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>> +
>> +       s5m8767_ds: s5m8767-ds {
>> +               samsung,pins =3D "gpx2-3", "gpx2-4", "gpx2-5";
>> +               samsung,pin-function =3D <0>;
>> +               samsung,pin-pud =3D <1>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>> +
>> +       s5m8767_irq: s5m8767-irq {
>> +               samsung,pins =3D "gpx3-2";
>> +               samsung,pin-function =3D <0>;
>> +               samsung,pin-pud =3D <0>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>> +
>> +       hdmi_hpd_irq: hdmi-hpd-irq {
>> +               samsung,pins =3D "gpx3-7";
>> +               samsung,pin-function =3D <0>;
>> +               samsung,pin-pud =3D <1>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>=20
> Ideally you could do one more cleanup patch to snow first to make
> diffs easier between the two dts files.  Moving things in the snow
> file from "pinctrl@11400000" to the pinctrl_0 section would help.
> ...and other cleanups you could do to snow to make diffs similar woul=
d
> also be really great.

Done.

>> +};
>> +
>> +&pinctrl_1 {
>> +       hsic_reset: hsic-reset {
>> +               samsung,pins =3D "gpe1-0";
>> +               samsung,pin-function =3D <1>;
>> +               samsung,pin-pud =3D <0>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>> +};
>> +
>> +&spi_1 {
>> +       status =3D "okay";
>> +       samsung,spi-src-clk =3D <0>;
>> +       num-cs =3D <1>;
>> +};
>> +
>> +&usbdrd_phy {
>> +       vbus-supply =3D <&usb3_vbus_reg>;
>> +};
>> +
>> +#include "cros-ec-keyboard.dtsi"
>> --
>> 1.9.3

Also found some unresolved review comments from v1 that I incorporated.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
