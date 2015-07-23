From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] mfd: Add DT binding for Maxim MAX77802 IC
Date: Thu, 23 Jul 2015 16:16:52 +0100
Message-ID: <20150723151652.GK3436@x1>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437114567-17629-4-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 17 Jul 2015, Javier Martinez Canillas wrote:

> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
> a RTC and an I2C interface to program the individual components.
>=20
> The are already DT bindings for the regulators and clocks and
> these reference to a bindings/mfd/max77802.txt file, that didn't
> exist, for the details about the PMIC.
>=20
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>=20
> ---
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
> index 000000000000..c60cdec50d36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max77802.txt
> @@ -0,0 +1,26 @@
> +Maxim MAX77802 multi-function device
> +
> +The Maxim MAX77802 is a power management chip (PMIC) that contains 1=
0 high
> +efficiency Buck regulators, 32 Low-dropout (LDO) regulators used to =
power

Would be good to capitalise the works in the acronyms, so
"Low-DropOut" and "Power Management IC".

> +up application processors and peripherals, a 2-channel 32kHz clock o=
utputs,
> +a Real-Time-Clock (RTC) and a I2C interface to program the individua=
l
> +regulators, clocks outputs and the RTC.
> +
> +Binding for the built-in 32k clock generator block is defined separa=
tely
> +in the bindings/clk/maxim,max77802.txt file and binding for the regu=
lators

s/bindings/../

> +is defined in the bindings/regulator/max77802.txt file.
> +
> +Required properties:
> +- compatible : Must be "maxim,max77802";
> +- reg : Specifies the i2c slave address of PMIC block.

s/i2c/I2C/

> +- interrupts : This i2c device has an IRQ line connected to the main=
 SoC.

As above.

> +- interrupt-parent : The parent interrupt controller.
> +
> +Example:
> +
> +	max77802: pmic@09 {
> +		compatible =3D "maxim,max77802";
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <26 0>;

Is there a define in include/dt-bindings/interrupt-controller to
replace 0?  IRQ_TYPE_NONE perhaps.

> +		reg =3D <0x09>;
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
