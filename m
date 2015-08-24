From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/4] mfd: max77686: Split out regulator part from the
 DT binding
Date: Mon, 24 Aug 2015 12:49:14 +0100
Message-ID: <20150824114914.GD3237@x1>
References: <1440406041-25071-1-git-send-email-javier@osg.samsung.com>
 <1440406041-25071-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440406041-25071-5-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 24 Aug 2015, Javier Martinez Canillas wrote:

> The Maxim MAX77686 PMIC is a multi-function device with regulators,
> clocks and a RTC. The DT bindings for the clocks are in a separate
> file but the bindings for the regulators are inside the mfd part.
>=20
> To make it consistent with the clocks portion of the binding and
> because is more natural to look for regulator bindings under the
> bindings/regulator sub-directory, split the regulator portion of
> the DT binding and add it as a separate file.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> ---
>=20
> Changes in v4: None
> Changes in v3:
> - Add Krzysztof Kozlowski Reviewed-by tag to patch #4.
> - Add Lee Jones Acked-by tag to patch #4.
>=20
> Changes in v2:
> - Use a generic name for the max77686 node in the regulator example.
>=20
>  Documentation/devicetree/bindings/mfd/max77686.txt | 60 ++----------=
------
>  .../devicetree/bindings/regulator/max77686.txt     | 71 ++++++++++++=
++++++++++
>  2 files changed, 75 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/max77=
686.txt

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index d2ed3c20a5c3..741e76688cf2 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -7,8 +7,9 @@ different i2c slave address,presently for which we ar=
e statically creating i2c
>  client while probing.This document describes the binding for mfd dev=
ice and
>  PMIC submodule.
> =20
> -Binding for the built-in 32k clock generator block is defined separa=
tely
> -in bindings/clk/maxim,max77686.txt file.
> +Bindings for the built-in 32k clock generator block and
> +regulators are defined in ../clk/maxim,max77686.txt and
> +../regulator/max77686.txt respectively.
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
> index 000000000000..0dded64d89d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/max77686.txt
> @@ -0,0 +1,71 @@
> +Binding for Maxim MAX77686 regulators
> +
> +This is a part of the device tree bindings of MAX77686 multi-functio=
n device.
> +More information can be found in ../mfd/max77686.txt file.
> +
> +The MAX77686 PMIC has 9 high-efficiency Buck and 26 Low-DropOut (LDO=
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
> +		interrupts =3D <26 IRQ_TYPE_NONE>;
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
