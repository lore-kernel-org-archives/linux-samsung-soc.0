From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 4/5] mfd/regulator: dt-bindings: max77686: Document
 gpio properties
Date: Tue, 20 Jan 2015 13:41:11 +0000
Message-ID: <20150120134111.GI13701@x1>
References: <1420458525-22576-1-git-send-email-k.kozlowski@samsung.com>
 <1420458525-22576-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420458525-22576-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 05 Jan 2015, Krzysztof Kozlowski wrote:

> Document usage of maxim,ena-gpios properties which turn on external/G=
PIO
> control over regulator.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77686.txt | 14 ++++++++++++=
++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Doc=
umentation/devicetree/bindings/mfd/max77686.txt
> index 75fdfaf41831..e39f0bc1f55e 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -39,6 +39,12 @@ to get matched with their hardware counterparts as=
 follow:
>  	-BUCKn	:	1-4.
>    Use standard regulator bindings for it ('regulator-off-in-suspend'=
).
> =20
> +  LDO20, LDO21, LDO22, BUCK8 and BUCK9 can be configured to GPIO ena=
ble
> +  control. To turn this feature on this property must be added to th=
e regulator
> +  sub-node:
> +	- maxim,ena-gpios :	one GPIO specifier enable control (the gpio
> +				flags are actually ignored and always
> +				ACTIVE_HIGH is used)

How does this differ to the 'enable-gpio' property which has already
been defined?

>  Example:
> =20
> @@ -65,4 +71,12 @@ Example:
>  				regulator-always-on;
>  				regulator-boot-on;
>  			};
> +
> +			buck9_reg {
> +				regulator-compatible =3D "BUCK9";
> +				regulator-name =3D "CAM_ISP_CORE_1.2V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1200000>;
> +				maxim,ena-gpios =3D <&gpm0 3 GPIO_ACTIVE_HIGH>;
> +			};
>  	}

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
