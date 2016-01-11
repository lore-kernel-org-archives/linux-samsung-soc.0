From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01
 bindings
Date: Mon, 11 Jan 2016 07:51:34 +0000
Message-ID: <20160111075134.GN3331@x1>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 04 Dec 2015, Krzysztof Kozlowski wrote:

> The mfd/s2mpa01.txt duplicates some of the information about bindings
> with old mfd/s2mps11.txt. Now common part exists entirely in
> mfd/samsung,sec-core.txt so:
>  - add company prefix to file name (regulator/samsung,s2mpa01.txt),
>  - remove duplicated information,
>  - reorganize the contents to match style of
>    regulator/samsung,s2mps11.txt.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/s2mpa01.txt  | 90 ------------=
----------
>  .../devicetree/bindings/mfd/samsung,sec-core.txt   |  4 +-
>  .../bindings/regulator/samsung,s2mpa01.txt         | 79 ++++++++++++=
+++++++
>  3 files changed, 82 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/s2mpa01.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsu=
ng,s2mpa01.txt

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/s2mpa01.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mpa01.txt
> deleted file mode 100644
> index c13d3d8c3947..000000000000
> --- a/Documentation/devicetree/bindings/mfd/s2mpa01.txt
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -
> -* Samsung S2MPA01 Voltage and Current Regulator
> -
> -The Samsung S2MPA01 is a multi-function device which includes high
> -efficiency buck converters including Dual-Phase buck converter, vari=
ous LDOs,
> -and an RTC. It is interfaced to the host controller using an I2C int=
erface.
> -Each sub-block is addressed by the host system using different I2C s=
lave
> -addresses.
> -
> -Required properties:
> -- compatible: Should be "samsung,s2mpa01-pmic".
> -- reg: Specifies the I2C slave address of the PMIC block. It should =
be 0x66.
> -
> -Optional properties:
> -- interrupt-parent: Specifies the phandle of the interrupt controlle=
r to which
> -  the interrupts from s2mpa01 are delivered to.
> -- interrupts: An interrupt specifier for the sole interrupt generate=
d by the
> -  device.
> -
> -Optional nodes:
> -- regulators: The regulators of s2mpa01 that have to be instantiated=
 should be
> -  included in a sub-node named 'regulators'. Regulator nodes and con=
straints
> -  included in this sub-node use the standard regulator bindings whic=
h are
> -  documented elsewhere.
> -
> -Properties for BUCK regulator nodes:
> -- regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
> -  (default), 25000, or 50000. May be 0 for disabling the ramp delay =
on
> -  BUCK{1,2,3,4}.
> -
> - In the absence of the regulator-ramp-delay property, the default ra=
mp
> - delay will be used.
> -
> -  NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value =
will be set
> -  for a particular group of BUCKs. So provide same regulator-ramp-de=
lay=3D<value>.
> -
> -  The following BUCKs share ramp settings:
> -  * 1 and 6
> -  * 2 and 4
> -  * 8, 9, and 10
> -
> -The following are the names of the regulators that the s2mpa01 PMIC =
block
> -supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK=
 number
> -as per the datasheet of s2mpa01.
> -
> -	- LDOn
> -		  - valid values for n are 1 to 26
> -		  - Example: LDO1, LD02, LDO26
> -	- BUCKn
> -		  - valid values for n are 1 to 10.
> -		  - Example: BUCK1, BUCK2, BUCK9
> -
> -Example:
> -
> -	s2mpa01_pmic@66 {
> -		compatible =3D "samsung,s2mpa01-pmic";
> -		reg =3D <0x66>;
> -
> -		regulators {
> -			ldo1_reg: LDO1 {
> -				regulator-name =3D "VDD_ALIVE";
> -				regulator-min-microvolt =3D <1000000>;
> -				regulator-max-microvolt =3D <1000000>;
> -			};
> -
> -			ldo2_reg: LDO2 {
> -				regulator-name =3D "VDDQ_MMC2";
> -				regulator-min-microvolt =3D <2800000>;
> -				regulator-max-microvolt =3D <2800000>;
> -				regulator-always-on;
> -			};
> -
> -			buck1_reg: BUCK1 {
> -				regulator-name =3D "vdd_mif";
> -				regulator-min-microvolt =3D <950000>;
> -				regulator-max-microvolt =3D <1350000>;
> -				regulator-always-on;
> -				regulator-boot-on;
> -			};
> -
> -			buck2_reg: BUCK2 {
> -				regulator-name =3D "vdd_arm";
> -				regulator-min-microvolt =3D <950000>;
> -				regulator-max-microvolt =3D <1350000>;
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-ramp-delay =3D <50000>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,sec-core.t=
xt b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> index 4aeb95c82304..cdd079bfc287 100644
> --- a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> +++ b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> @@ -4,7 +4,7 @@ Binding for Samsung S2M and S5M family multi-function=
 device
>  This is a part of device tree bindings for S2M and S5M family multi-=
function
>  devices.
> =20
> -The Samsung S2MPS11/13/14/15, S2MPU02 and S5M8767 is a family
> +The Samsung S2MPA01, S2MPS11/13/14/15, S2MPU02 and S5M8767 is a fami=
ly
>  of multi-function devices which include voltage and current regulato=
rs, RTC,
>  charger controller, clock outputs and other sub-blocks. It is interf=
aced
>  to the host controller using an I2C interface. Each sub-block is usu=
ally
> @@ -13,6 +13,7 @@ addressed by the host system using different I2C sl=
ave addresses.
> =20
>  This document describes bindings for main device node. Optional sub-=
blocks
>  must be a sub-nodes to it. Bindings for them can be found in:
> + - bindings/regulator/samsung,s2mpa01.txt
>   - bindings/regulator/samsung,s2mps11.txt
>   - bindings/regulator/samsung,s5m8767.txt
>   - bindings/clock/samsung,s2mps11.txt
> @@ -20,6 +21,7 @@ must be a sub-nodes to it. Bindings for them can be=
 found in:
> =20
>  Required properties:
>   - compatible: Should be one of the following
> +	- "samsung,s2mpa01-pmic",
>  	- "samsung,s2mps11-pmic",
>  	- "samsung,s2mps13-pmic",
>  	- "samsung,s2mps14-pmic",
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mp=
a01.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.t=
xt
> new file mode 100644
> index 000000000000..bae3c7f838cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
> @@ -0,0 +1,79 @@
> +Binding for Samsung S2MPA01 regulator block
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is a part of device tree bindings for S2M family multi-function=
 devices.
> +More information can be found in bindings/mfd/sec-core.txt file.
> +
> +The S2MPA01 device provide buck and LDO regulators.
> +
> +To register these with regulator framework instantiate under main de=
vice node
> +a sub-node named "regulators" with more sub-nodes for each regulator=
 using the
> +common regulator binding documented in:
> + - Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +
> +Names of regulators supported by S2MPA01 device:
> +	- LDOn
> +		  - valid values for n are 1 to 26
> +		  - Example: LDO1, LD02, LDO26
> +	- BUCKn
> +		  - valid values for n are 1 to 10.
> +		  - Example: BUCK1, BUCK2, BUCK9
> +Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
> +as per the datasheet of device.
> +
> +
> +Optional properties of buck regulator nodes under "regulators" sub-n=
ode:
> + - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
> +   (default), 25000, or 50000. May be 0 for disabling the ramp delay=
 on
> +   BUCK{1,2,3,4}.
> +
> +   In the absence of the regulator-ramp-delay property, the default =
ramp
> +   delay will be used.
> +
> +   Note: Some bucks share the ramp rate setting i.e. same ramp value
> +   will be set for a particular group of bucks so provide the same
> +   regulator-ramp-delay value for them.
> +   Groups sharing ramp rate:
> +    - buck{1,6},
> +    - buck{2,4},
> +    - buck{8,9,10}.
> +
> +Example:
> +
> +	s2mpa01_pmic@66 {
> +		compatible =3D "samsung,s2mpa01-pmic";
> +		reg =3D <0x66>;
> +
> +		regulators {
> +			ldo1_reg: LDO1 {
> +				regulator-name =3D "VDD_ALIVE";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +			};
> +
> +			ldo2_reg: LDO2 {
> +				regulator-name =3D "VDDQ_MMC2";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +				regulator-always-on;
> +			};
> +
> +			buck1_reg: BUCK1 {
> +				regulator-name =3D "vdd_mif";
> +				regulator-min-microvolt =3D <950000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck2_reg: BUCK2 {
> +				regulator-name =3D "vdd_arm";
> +				regulator-min-microvolt =3D <950000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay =3D <50000>;
> +			};
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
