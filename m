From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] mfd: max77686: Split out regulator part from the
 DT binding
Date: Mon, 20 Jul 2015 09:08:10 +0100
Message-ID: <20150720080810.GC3061@x1>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437114567-17629-5-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 17 Jul 2015, Javier Martinez Canillas wrote:

> The Maxim MAX77686 PMIC is a multi-function device with regulators,
> clocks and a RTC. The DT bindings for the clocks are in a separate
> file but the bindings for the regulators are inside the mfd part.
>=20
> To make it consistent with the clocks portion of the binding and
> because is more natural to look for regulator bindings under the
> bindings/regulator sub-directory, split the regulator portion of
> the DT binding and add it as a separate file.
>=20
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>=20
> ---
>=20
> Changes in v2:
> - Use a generic name for the max77686 node in the regulator example.
>=20
>  Documentation/devicetree/bindings/mfd/max77686.txt | 58 +-----------=
------
>  .../devicetree/bindings/regulator/max77686.txt     | 71 ++++++++++++=
++++++++++
>  2 files changed, 74 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/max77=
686.txt

I'm fine with this, but still needs Marks Ack before I can do anything
with it.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index d2ed3c20a5c3..c5aeca609b1f 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -8,7 +8,8 @@ client while probing.This document describes the bind=
ing for mfd device and
>  PMIC submodule.
> =20
>  Binding for the built-in 32k clock generator block is defined separa=
tely
> -in bindings/clk/maxim,max77686.txt file.
> +in the bindings/clk/maxim,max77686.txt file and binding for the regu=
lators
> +is defined in the bindings/regulator/max77686.txt file.
> =20
>  Required properties:
>  - compatible : Must be "maxim,max77686";
> @@ -16,36 +17,6 @@ Required properties:
>  - interrupts : This i2c device has an IRQ line connected to the main=
 SoC.
>  - interrupt-parent : The parent interrupt controller.
> =20
> -Optional node:
> -- voltage-regulators : The regulators of max77686 have to be instant=
iated
> -  under subnode named "voltage-regulators" using the following forma=
t.
> -
> -	regulator_name {
> -		regulator-compatible =3D LDOn/BUCKn
> -		standard regulator constraints....
> -	};
> -	refer Documentation/devicetree/bindings/regulator/regulator.txt
> -
> -  The regulator node's name should be initialized with a string
> -to get matched with their hardware counterparts as follow:
> -
> -	-LDOn 	:	for LDOs, where n can lie in range 1 to 26.
> -		 	example: LDO1, LDO2, LDO26.
> -	-BUCKn 	:	for BUCKs, where n can lie in range 1 to 9.
> -			example: BUCK1, BUCK5, BUCK9.
> -
> -  Regulators which can be turned off during system suspend:
> -	-LDOn	:	2, 6-8, 10-12, 14-16,
> -	-BUCKn	:	1-4.
> -  Use standard regulator bindings for it ('regulator-off-in-suspend'=
).
> -
> -  LDO20, LDO21, LDO22, BUCK8 and BUCK9 can be configured to GPIO ena=
ble
> -  control. To turn this feature on this property must be added to th=
e regulator
> -  sub-node:
> -	- maxim,ena-gpios :	one GPIO specifier enable control (the gpio
> -				flags are actually ignored and always
> -				ACTIVE_HIGH is used)
> -
>  Example:
> =20
>  	max77686: pmic@09 {
> @@ -53,27 +24,4 @@ Example:
>  		interrupt-parent =3D <&wakeup_eint>;
>  		interrupts =3D <26 0>;
>  		reg =3D <0x09>;
> -
> -		voltage-regulators {
> -			ldo11_reg: LDO11 {
> -				regulator-name =3D "vdd_ldo11";
> -				regulator-min-microvolt =3D <1900000>;
> -				regulator-max-microvolt =3D <1900000>;
> -				regulator-always-on;
> -			};
> -
> -			buck1_reg: BUCK1 {
> -				regulator-name =3D "vdd_mif";
> -				regulator-min-microvolt =3D <950000>;
> -				regulator-max-microvolt =3D <1300000>;
> -				regulator-always-on;
> -				regulator-boot-on;
> -			};
> -
> -			buck9_reg: BUCK9 {
> -				regulator-name =3D "CAM_ISP_CORE_1.2V";
> -				regulator-min-microvolt =3D <1000000>;
> -				regulator-max-microvolt =3D <1200000>;
> -				maxim,ena-gpios =3D <&gpm0 3 GPIO_ACTIVE_HIGH>;
> -			};
> -	}
> +	};
> diff --git a/Documentation/devicetree/bindings/regulator/max77686.txt=
 b/Documentation/devicetree/bindings/regulator/max77686.txt
> new file mode 100644
> index 000000000000..831cbd3cd965
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/max77686.txt
> @@ -0,0 +1,71 @@
> +Binding for Maxim MAX77686 regulators
> +
> +This is a part of the device tree bindings of MAX77686 multi-functio=
n device.
> +More information can be found in bindings/mfd/max77686.txt file.
> +
> +The MAX77686 PMIC has 9 high-efficiency Buck and 26 Low-dropout (LDO=
)
> +regulators that can be controlled over I2C.
> +
> +Following properties should be present in main device node of the MF=
D chip.
> +
> +Optional node:
> +- voltage-regulators : The regulators of max77686 have to be instant=
iated
> +  under subnode named "voltage-regulators" using the following forma=
t.
> +
> +	regulator_name {
> +		regulator-compatible =3D LDOn/BUCKn
> +		standard regulator constraints....
> +	};
> +	refer Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +  The regulator node's name should be initialized with a string
> +to get matched with their hardware counterparts as follow:
> +
> +	-LDOn 	:	for LDOs, where n can lie in range 1 to 26.
> +			example: LDO1, LDO2, LDO26.
> +	-BUCKn 	:	for BUCKs, where n can lie in range 1 to 9.
> +			example: BUCK1, BUCK5, BUCK9.
> +
> +  Regulators which can be turned off during system suspend:
> +	-LDOn	:	2, 6-8, 10-12, 14-16,
> +	-BUCKn	:	1-4.
> +  Use standard regulator bindings for it ('regulator-off-in-suspend'=
).
> +
> +  LDO20, LDO21, LDO22, BUCK8 and BUCK9 can be configured to GPIO ena=
ble
> +  control. To turn this feature on this property must be added to th=
e regulator
> +  sub-node:
> +	- maxim,ena-gpios :	one GPIO specifier enable control (the gpio
> +				flags are actually ignored and always
> +				ACTIVE_HIGH is used)
> +
> +Example:
> +
> +	max77686: pmic@09 {
> +		compatible =3D "maxim,max77686";
> +		interrupt-parent =3D <&wakeup_eint>;
> +		interrupts =3D <26 0>;
> +		reg =3D <0x09>;
> +
> +		voltage-regulators {
> +			ldo11_reg: LDO11 {
> +				regulator-name =3D "vdd_ldo11";
> +				regulator-min-microvolt =3D <1900000>;
> +				regulator-max-microvolt =3D <1900000>;
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
> +			buck9_reg: BUCK9 {
> +				regulator-name =3D "CAM_ISP_CORE_1.2V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1200000>;
> +				maxim,ena-gpios =3D <&gpm0 3 GPIO_ACTIVE_HIGH>;
> +			};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
