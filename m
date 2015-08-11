From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/4] mfd: Add DT binding for Maxim MAX77802 IC
Date: Tue, 11 Aug 2015 12:47:36 +0100
Message-ID: <20150811114736.GB18282@x1>
References: <1438252327-28427-1-git-send-email-javier@osg.samsung.com>
 <1438252327-28427-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38503 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934089AbbHKLrm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 07:47:42 -0400
Received: by wicja10 with SMTP id ja10so65259409wic.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Aug 2015 04:47:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1438252327-28427-4-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

On Thu, 30 Jul 2015, Javier Martinez Canillas wrote:

> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
> a RTC and an I2C interface to program the individual components.
>=20
> The are already DT bindings for the regulators and clocks and
> these reference to a bindings/mfd/max77802.txt file, that didn't
> exist, for the details about the PMIC.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
>=20
> Changes in v3:
> - Add Krzysztof Kozlowski Reviewed-by tag to patch #3.
> - Capitalise all acronyms. Suggested by Lee Jones.
> - Use relative path to refer other bindings. Suggested by Lee Jones.
> - Use IRQ_TYPE_NONE instead of 0 in example. Suggested by Lee Jones.
>=20
> Changes in v2:
> - Use the correct "maxim,max77802" compatible string.
>   Suggested by Krzysztof Kozlowski
> - Use a pmic generic node name for the max77802 node example.
>   Suggested by Sergei Shtylyov.
>=20
>  Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++++++=
++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77802.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Doc=
umentation/devicetree/bindings/mfd/max77802.txt
> new file mode 100644
> index 000000000000..911ec5fcaefd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max77802.txt
> @@ -0,0 +1,26 @@
> +Maxim MAX77802 multi-function device
> +
> +The Maxim MAX77802 is a Power Management IC (PMIC) that contains 10 =
high
> +efficiency Buck regulators, 32 Low-DropOut (LDO) regulators used to =
power
> +up application processors and peripherals, a 2-channel 32kHz clock o=
utputs,
> +a Real-Time-Clock (RTC) and a I2C interface to program the individua=
l
> +regulators, clocks outputs and the RTC.
> +
> +Binding for the built-in 32k clock generator block is defined separa=
tely
> +in the ../clk/maxim,max77802.txt file and binding for the regulators
> +is defined in the ../regulator/max77802.txt file.

  "Bindings for the built-in 32k clock generator block and
   regulators are defined in ../clk/maxim,max77802.txt and
   ../regulator/max77802.txt respectively."

> +Required properties:
> +- compatible : Must be "maxim,max77802";

';' ?

> +- reg : Specifies the I2C slave address of PMIC block.
> +- interrupts : This I2C device has an IRQ line connected to the main=
 SoC.
> +- interrupt-parent : The parent interrupt controller.

I always find this easier on the eye when you:

Required properties:
- compatible		: Must be "maxim,max77802"
- reg			: Specifies the I2C slave address of PMIC block.
- interrupts		: This I2C device has an IRQ line connected to the main S=
oC.
- interrupt-parent	: The parent interrupt controller.

> +Example:
> +
> +	max77802: pmic@09 {
> +		compatible =3D "maxim,max77802";
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <26 IRQ_TYPE_NONE>;
> +		reg =3D <0x09>;
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
