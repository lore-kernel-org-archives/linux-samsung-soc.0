From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 1/4] mfd: max77686: Don't suggest in binding to use a
 deprecated property
Date: Mon, 24 Aug 2015 12:48:33 +0100
Message-ID: <20150824114833.GA3237@x1>
References: <1440406041-25071-1-git-send-email-javier@osg.samsung.com>
 <1440406041-25071-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440406041-25071-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 24 Aug 2015, Javier Martinez Canillas wrote:

> The regulator-compatible property from the regulator DT binding was
> deprecated. But the max77686 DT binding doc still suggest to use it
> instead of the regulator node name's which is the correct approach.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> ---
>=20
> Changes in v4:
> - Add Lee Jones Acked-by tag to patch #1.
>=20
> Changes in v3: None
> Changes in v2:
> - Add Krzysztof Kozlowski Reviewed-by tag to patch #1.
>=20
>  Documentation/devicetree/bindings/mfd/max77686.txt | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index 163bd81a4607..8221102d3fc2 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -26,7 +26,7 @@ Optional node:
>  	};
>  	refer Documentation/devicetree/bindings/regulator/regulator.txt
> =20
> -  The regulator-compatible property of regulator should initialized =
with string
> +  The regulator node's name should be initialized with a string
>  to get matched with their hardware counterparts as follow:
> =20
>  	-LDOn 	:	for LDOs, where n can lie in range 1 to 26.
> @@ -55,16 +55,14 @@ Example:
>  		reg =3D <0x09>;
> =20
>  		voltage-regulators {
> -			ldo11_reg {
> -				regulator-compatible =3D "LDO11";
> +			ldo11_reg: LDO11 {
>  				regulator-name =3D "vdd_ldo11";
>  				regulator-min-microvolt =3D <1900000>;
>  				regulator-max-microvolt =3D <1900000>;
>  				regulator-always-on;
>  			};
> =20
> -			buck1_reg {
> -				regulator-compatible =3D "BUCK1";
> +			buck1_reg: BUCK1 {
>  				regulator-name =3D "vdd_mif";
>  				regulator-min-microvolt =3D <950000>;
>  				regulator-max-microvolt =3D <1300000>;
> @@ -72,8 +70,7 @@ Example:
>  				regulator-boot-on;
>  			};
> =20
> -			buck9_reg {
> -				regulator-compatible =3D "BUCK9";
> +			buck9_reg: BUCK9 {
>  				regulator-name =3D "CAM_ISP_CORE_1.2V";
>  				regulator-min-microvolt =3D <1000000>;
>  				regulator-max-microvolt =3D <1200000>;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
