From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND v2] mfd: s2mps11: Add manual shutdown method for Odroid
 XU3
Date: Sun, 20 Sep 2015 05:17:47 +0100
Message-ID: <20150920041747.GL3039@x1>
References: <1442232765-3211-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:35570 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753539AbbITER4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Sep 2015 00:17:56 -0400
Received: by pacfv12 with SMTP id fv12so87150554pac.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Sep 2015 21:17:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1442232765-3211-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>

On Mon, 14 Sep 2015, Krzysztof Kozlowski wrote:

> On Odroid XU3 board (with S2MPS11 PMIC) the PWRHOLD bit in CTRL1
> register must be manually set to 0 before initiating power off sequen=
ce.
>=20
> One of usual power down methods for Exynos based devices looks like:
> 1. PWRHOLD pin of PMIC is connected to PSHOLD of Exynos SoC.
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
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> ---
>=20
> The rest of patchset was applied by Kukjin Kim:
>  - dt-bindings documentation:
>    https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.g=
it/commit/?h=3Dv4.3-next/dt-samsung-new-3&id=3Dff1020841cf0ff868d61d441=
69e7cc32f73599b8
>  - DTS change:
>    https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.g=
it/commit/?h=3Dv4.3-next/dt-samsung-new-3&id=3D5bcbe4ba55bb0ad75c8495ee=
295bab036735483e
>=20
> Changes since v2:
> 1. Just rebase on current next.
>=20
> Changes since v1:
> 1. Split bindings documentation to separate patch (suggested by Lee).
> 2. Fix additional empty line (suggested by Lee).
> 3. Add Anand's tested-by, Javier's reviewed-by and Lee's acked-by.
>=20
> Patch is losely based on patch in Hardkernel repository and previous
> work of Anand Moon.
> ---
>  drivers/mfd/sec-core.c              | 30 +++++++++++++++++++++++++++=
+++
>  include/linux/mfd/samsung/core.h    |  2 ++
>  include/linux/mfd/samsung/s2mps11.h |  1 +
>  3 files changed, 33 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index d206a3e8fe87..2d1137a7a0ee 100644
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
> @@ -440,6 +442,33 @@ static int sec_pmic_remove(struct i2c_client *i2=
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
>  #ifdef CONFIG_PM_SLEEP
>  static int sec_pmic_suspend(struct device *dev)
>  {
> @@ -491,6 +520,7 @@ static struct i2c_driver sec_pmic_driver =3D {
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
