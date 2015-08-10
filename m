From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: s2mps11: Add manual shutdown method for Odroid
 XU3
Date: Mon, 10 Aug 2015 16:49:10 +0100
Message-ID: <20150810154910.GA12631@x1>
References: <1438605447-6836-1-git-send-email-k.kozlowski.k@gmail.com>
 <1438605447-6836-2-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438605447-6836-2-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 03 Aug 2015, Krzysztof Kozlowski wrote:

> On Odroid XU3 board (with S2MPS11 PMIC) the PWRHOLD bit in CTRL1
> register must be manually set to 0 before initiating power off sequen=
ce.
>=20
> One of usual power down methods for Exynos based devices looks like:
> 1. PWRHOLD pin of PMIC is connected to PSHOLD of Exynos.
> 2. Exynos holds up this pin during system operation.
> 3. ACOKB pin of PMIC is pulled up to VBATT and optionally to pin in
>    other device.
> 4. When PWRHOLD/PSHOLD goes low, the PMIC will turn off the power if
>    ACOKB goes high.
>=20
> On Odroid XU3 family the difference is in (3) - the ACOKB is grounded=
=2E
> This means that PMIC must manually set PWRHOLD field to low and then
> wait for signal from Application Processor (the usual change in
> PWRHOLD/PSHOLD pin will actually cut off the power).
>=20
> The patch adds respective binding allowing Odroid XU3 device to be
> powered off.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> Reported-by: Anand Moon <linux.amoon@gmail.com>
>=20
> ---
>=20
> Patch is losely based on patch in Hardkernel repository [0] and previ=
ous
> work of Anand Moon [1].
>=20
> [0] https://github.com/hardkernel/linux/commit/6897e62ba328bd1c8c095d=
918101863250cd73e7
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg45959.html
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |  4 +++
>  drivers/mfd/sec-core.c                            | 31 +++++++++++++=
++++++++++
>  include/linux/mfd/samsung/core.h                  |  2 ++
>  include/linux/mfd/samsung/s2mps11.h               |  1 +
>  4 files changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 57a045016fca..90eaef393325 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -15,6 +15,10 @@ Optional properties:
>  - interrupt-parent: Specifies the phandle of the interrupt controlle=
r to which
>    the interrupts from s2mps11 are delivered to.
>  - interrupts: Interrupt specifiers for interrupt sources.

> +- samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 =
PMIC is
> +  connected to the ground so the PMIC must manually set PWRHOLD bit =
in CTRL1
> +  register to turn off the power. Usually the ACOKB is pulled up to =
VBATT so
> +  when PWRHOLD pin goes low, the rising ACOKB will trigger power off=
=2E

Binding looks fine.  Please seperate it into a different patch and
apply my Ack:

Acked-by: Lee Jones <lee.jones@linaro.org>

>  Optional nodes:
>  - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffe=
red 32.768
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index d206a3e8fe87..a56ab2102a32 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -278,6 +278,8 @@ static struct sec_platform_data *sec_pmic_i2c_par=
se_dt_pdata(
>  	 * not parsed here.
>  	 */
> =20
> +	pd->manual_poweroff =3D of_property_read_bool(dev->of_node,
> +						"samsung,s2mps11-acokb-ground");
>  	return pd;
>  }
>  #else
> @@ -440,6 +442,34 @@ static int sec_pmic_remove(struct i2c_client *i2=
c)
>  	return 0;
>  }
> =20
> +static void sec_pmic_shutdown(struct i2c_client *i2c)
> +{
> +	struct sec_pmic_dev *sec_pmic =3D i2c_get_clientdata(i2c);
> +	unsigned int reg, mask;
> +
> +	if (!sec_pmic->pdata->manual_poweroff)
> +		return;
> +
> +	switch (sec_pmic->device_type) {
> +	case S2MPS11X:
> +		reg =3D S2MPS11_REG_CTRL1;
> +		mask =3D S2MPS11_CTRL1_PWRHOLD_MASK;
> +		break;
> +	default:
> +		/*
> +		 * Currently only one board with S2MPS11 needs this, so just
> +		 * ignore the rest.
> +		 */
> +		dev_warn(sec_pmic->dev,
> +			"Unsupported device %lu for manual power off\n",
> +			sec_pmic->device_type);
> +		return;
> +	}
> +
> +	regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, 0);
> +}
> +
> +

Remove the extra '\n'.

When you resubmit, apply my Ack:

Acked-by: Lee Jones <lee.jones@linaro.org>

>  #ifdef CONFIG_PM_SLEEP
>  static int sec_pmic_suspend(struct device *dev)
>  {
> @@ -491,6 +521,7 @@ static struct i2c_driver sec_pmic_driver =3D {
>  	},
>  	.probe =3D sec_pmic_probe,
>  	.remove =3D sec_pmic_remove,
> +	.shutdown =3D sec_pmic_shutdown,
>  	.id_table =3D sec_pmic_id,
>  };
> =20
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/sam=
sung/core.h
> index 75115384f3fc..aa78957e092f 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -132,6 +132,8 @@ struct sec_platform_data {
>  	int				buck2_init;
>  	int				buck3_init;
>  	int				buck4_init;
> +	/* Whether or not manually set PWRHOLD to low during shutdown. */
> +	bool				manual_poweroff;
>  };
> =20
>  /**
> diff --git a/include/linux/mfd/samsung/s2mps11.h b/include/linux/mfd/=
samsung/s2mps11.h
> index 7981a9d77d3f..b288965e8101 100644
> --- a/include/linux/mfd/samsung/s2mps11.h
> +++ b/include/linux/mfd/samsung/s2mps11.h
> @@ -179,6 +179,7 @@ enum s2mps11_regulators {
>  #define S2MPS11_BUCK_N_VOLTAGES (S2MPS11_BUCK_VSEL_MASK + 1)
>  #define S2MPS11_RAMP_DELAY	25000		/* uV/us */
> =20
> +#define S2MPS11_CTRL1_PWRHOLD_MASK	BIT(4)
> =20
>  #define S2MPS11_BUCK2_RAMP_SHIFT	6
>  #define S2MPS11_BUCK34_RAMP_SHIFT	4

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
