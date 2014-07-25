From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/4] ARM: dts: exynos5250: max77686 is Snow only
Date: Fri, 25 Jul 2014 14:28:02 +0900
Message-ID: <08fe01cfa7c9$341cc700$9c565500$@samsung.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
 <1405704009-8430-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1405704009-8430-2-git-send-email-afaerber@suse.de>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: 'Stephan van Schaik' <stephan@synkhronix.com>, 'Vincent Palatin' <vpalatin@chromium.org>, 'Doug Anderson' <dianders@chromium.org>, 'Ben Dooks' <ben-linux@fluff.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Russell King' <linux@arm.linux.org.uk>, "'moderated list:ARM/SAMSUNG ARM A...'" <linux-arm-kernel@lists.infradead.org>, "'open list:OPEN FIRMWARE AND...'" <devicetree@vger.kernel.org>, 'open list' <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Andreas F=C3=A4rber wrote:
>=20
> Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
> Spring does not need it, it uses an s5m8767 instead.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---

Hi Andreas,

I think this should be reviewed by chrome guys.


Doug, can you have a look this series for exynos5250-chromebook?
I'm not sure exynos5250-cros-common is still useful for exynos5250-spri=
ng...

- Kukjin

>  v2: New (Doug Anderson)
>=20
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi | 151 ----------------=
---------
>  arch/arm/boot/dts/exynos5250-snow.dts         | 155 ++++++++++++++++=
++++++++++
>  2 files changed, 155 insertions(+), 151 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm=
/boot/dts/exynos5250-cros-
> common.dtsi
> index 89ac90f..61128d1 100644
> --- a/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> @@ -27,163 +27,12 @@
>  		i2c2_bus: i2c2-bus {
>  			samsung,pin-pud =3D <0>;
>  		};
> -
> -		max77686_irq: max77686-irq {
> -			samsung,pins =3D "gpx3-2";
> -			samsung,pin-function =3D <0>;
> -			samsung,pin-pud =3D <0>;
> -			samsung,pin-drv =3D <0>;
> -		};
>  	};
>=20
>  	i2c@12C60000 {
>  		status =3D "okay";
>  		samsung,i2c-sda-delay =3D <100>;
>  		samsung,i2c-max-bus-freq =3D <378000>;
> -
> -		max77686@09 {
> -			compatible =3D "maxim,max77686";
> -			interrupt-parent =3D <&gpx3>;
> -			interrupts =3D <2 0>;
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <&max77686_irq>;
> -			wakeup-source;
> -			reg =3D <0x09>;
> -			#clock-cells =3D <1>;
> -
> -			voltage-regulators {
> -				ldo1_reg: LDO1 {
> -					regulator-name =3D "P1.0V_LDO_OUT1";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo2_reg: LDO2 {
> -					regulator-name =3D "P1.8V_LDO_OUT2";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo3_reg: LDO3 {
> -					regulator-name =3D "P1.8V_LDO_OUT3";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo7_reg: LDO7 {
> -					regulator-name =3D "P1.1V_LDO_OUT7";
> -					regulator-min-microvolt =3D <1100000>;
> -					regulator-max-microvolt =3D <1100000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo8_reg: LDO8 {
> -					regulator-name =3D "P1.0V_LDO_OUT8";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo10_reg: LDO10 {
> -					regulator-name =3D "P1.8V_LDO_OUT10";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo12_reg: LDO12 {
> -					regulator-name =3D "P3.0V_LDO_OUT12";
> -					regulator-min-microvolt =3D <3000000>;
> -					regulator-max-microvolt =3D <3000000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo14_reg: LDO14 {
> -					regulator-name =3D "P1.8V_LDO_OUT14";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo15_reg: LDO15 {
> -					regulator-name =3D "P1.0V_LDO_OUT15";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -				};
> -
> -				ldo16_reg: LDO16 {
> -					regulator-name =3D "P1.8V_LDO_OUT16";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> -
> -				buck1_reg: BUCK1 {
> -					regulator-name =3D "vdd_mif";
> -					regulator-min-microvolt =3D <950000>;
> -					regulator-max-microvolt =3D <1300000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> -
> -				buck2_reg: BUCK2 {
> -					regulator-name =3D "vdd_arm";
> -					regulator-min-microvolt =3D <850000>;
> -					regulator-max-microvolt =3D <1350000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> -
> -				buck3_reg: BUCK3 {
> -					regulator-name =3D "vdd_int";
> -					regulator-min-microvolt =3D <900000>;
> -					regulator-max-microvolt =3D <1200000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> -
> -				buck4_reg: BUCK4 {
> -					regulator-name =3D "vdd_g3d";
> -					regulator-min-microvolt =3D <850000>;
> -					regulator-max-microvolt =3D <1300000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> -
> -				buck5_reg: BUCK5 {
> -					regulator-name =3D "P1.8V_BUCK_OUT5";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> -
> -				buck6_reg: BUCK6 {
> -					regulator-name =3D "P1.35V_BUCK_OUT6";
> -					regulator-min-microvolt =3D <1350000>;
> -					regulator-max-microvolt =3D <1350000>;
> -					regulator-always-on;
> -				};
> -
> -				buck7_reg: BUCK7 {
> -					regulator-name =3D "P2.0V_BUCK_OUT7";
> -					regulator-min-microvolt =3D <2000000>;
> -					regulator-max-microvolt =3D <2000000>;
> -					regulator-always-on;
> -				};
> -
> -				buck8_reg: BUCK8 {
> -					regulator-name =3D "P2.85V_BUCK_OUT8";
> -					regulator-min-microvolt =3D <2850000>;
> -					regulator-max-microvolt =3D <2850000>;
> -					regulator-always-on;
> -				};
> -			};
> -		};
>  	};
>=20
>  	i2c@12C70000 {
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dt=
s/exynos5250-snow.dts
> index c682c88..0f867a3 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -344,4 +344,159 @@
>  	};
>  };
>=20
> +&i2c_0 {
> +	max77686@09 {
> +		compatible =3D "maxim,max77686";
> +		interrupt-parent =3D <&gpx3>;
> +		interrupts =3D <2 0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&max77686_irq>;
> +		wakeup-source;
> +		reg =3D <0x09>;
> +		#clock-cells =3D <1>;
> +
> +		voltage-regulators {
> +			ldo1_reg: LDO1 {
> +				regulator-name =3D "P1.0V_LDO_OUT1";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo2_reg: LDO2 {
> +				regulator-name =3D "P1.8V_LDO_OUT2";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo3_reg: LDO3 {
> +				regulator-name =3D "P1.8V_LDO_OUT3";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo7_reg: LDO7 {
> +				regulator-name =3D "P1.1V_LDO_OUT7";
> +				regulator-min-microvolt =3D <1100000>;
> +				regulator-max-microvolt =3D <1100000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo8_reg: LDO8 {
> +				regulator-name =3D "P1.0V_LDO_OUT8";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo10_reg: LDO10 {
> +				regulator-name =3D "P1.8V_LDO_OUT10";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo12_reg: LDO12 {
> +				regulator-name =3D "P3.0V_LDO_OUT12";
> +				regulator-min-microvolt =3D <3000000>;
> +				regulator-max-microvolt =3D <3000000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo14_reg: LDO14 {
> +				regulator-name =3D "P1.8V_LDO_OUT14";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo15_reg: LDO15 {
> +				regulator-name =3D "P1.0V_LDO_OUT15";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +			};
> +
> +			ldo16_reg: LDO16 {
> +				regulator-name =3D "P1.8V_LDO_OUT16";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			buck1_reg: BUCK1 {
> +				regulator-name =3D "vdd_mif";
> +				regulator-min-microvolt =3D <950000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck2_reg: BUCK2 {
> +				regulator-name =3D "vdd_arm";
> +				regulator-min-microvolt =3D <850000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck3_reg: BUCK3 {
> +				regulator-name =3D "vdd_int";
> +				regulator-min-microvolt =3D <900000>;
> +				regulator-max-microvolt =3D <1200000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck4_reg: BUCK4 {
> +				regulator-name =3D "vdd_g3d";
> +				regulator-min-microvolt =3D <850000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck5_reg: BUCK5 {
> +				regulator-name =3D "P1.8V_BUCK_OUT5";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck6_reg: BUCK6 {
> +				regulator-name =3D "P1.35V_BUCK_OUT6";
> +				regulator-min-microvolt =3D <1350000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +			};
> +
> +			buck7_reg: BUCK7 {
> +				regulator-name =3D "P2.0V_BUCK_OUT7";
> +				regulator-min-microvolt =3D <2000000>;
> +				regulator-max-microvolt =3D <2000000>;
> +				regulator-always-on;
> +			};
> +
> +			buck8_reg: BUCK8 {
> +				regulator-name =3D "P2.85V_BUCK_OUT8";
> +				regulator-min-microvolt =3D <2850000>;
> +				regulator-max-microvolt =3D <2850000>;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&pinctrl_0 {
> +	max77686_irq: max77686-irq {
> +		samsung,pins =3D "gpx3-2";
> +		samsung,pin-function =3D <0>;
> +		samsung,pin-pud =3D <0>;
> +		samsung,pin-drv =3D <0>;
> +	};
> +};
> +
>  #include "cros-ec-keyboard.dtsi"
> --
> 1.9.3
