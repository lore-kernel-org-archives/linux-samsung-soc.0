From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/3] mfd: sec-core: Disable buck voltage reset on
 watchdog falling edge
Date: Tue, 13 Oct 2015 10:03:50 +0100
Message-ID: <20151013090350.GG32409@x1>
References: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
 <1444178681-16188-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:34088 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbbJMJD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 05:03:57 -0400
Received: by wicgb1 with SMTP id gb1so80071819wic.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2015 02:03:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1444178681-16188-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, 07 Oct 2015, Krzysztof Kozlowski wrote:

> The WRSTBI bit (disabled by default but enabled by bootloader), when
> set, is responsible for resetting voltages to default values of
> certain bucks on falling edge of Warm Reset Input pin from AP.
>=20
> However on some boards (with S2MPS13) the pin is pulled down so any
> suspend will effectively trigger the reset of bucks supplying the pow=
er
> to the little and big cores. In the same time when resuming, these bu=
cks
> must provide voltage greater or equal to voltage before suspend to ma=
tch
> the frequency chosen by cpufreq. If voltage (default value of voltage
> after reset) is lower than one set by cpufreq before suspend, then
> system will hang during resuming.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reported-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

These should be in chronological order.

I will do that for you this time when I apply the patch.

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> ---
>=20
> Changs since v1:
> 1. Add Bartlomiej's Reported-by and Tested-by.
> ---
>  drivers/mfd/sec-core.c              | 26 ++++++++++++++++++++++++++
>  include/linux/mfd/samsung/core.h    |  2 ++
>  include/linux/mfd/samsung/s2mps13.h |  1 +
>  3 files changed, 29 insertions(+)
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 589e5efc2d7f..2626fc0b5b8c 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -262,6 +262,29 @@ static void sec_pmic_dump_rev(struct sec_pmic_de=
v *sec_pmic)
>  		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
>  }
> =20
> +static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
> +{
> +	int err;
> +
> +	if (sec_pmic->device_type !=3D S2MPS13X)
> +		return;
> +
> +	if (sec_pmic->pdata->disable_wrstbi) {
> +		/*
> +		 * If WRSTBI pin is pulled down this feature must be disabled
> +		 * because each Suspend to RAM will trigger buck voltage reset
> +		 * to default values.
> +		 */
> +		err =3D regmap_update_bits(sec_pmic->regmap_pmic,
> +					 S2MPS13_REG_WRSTBI,
> +					 S2MPS13_REG_WRSTBI_MASK, 0x0);
> +		if (err)
> +			dev_warn(sec_pmic->dev,
> +				 "Cannot initialize WRSTBI config: %d\n",
> +				 err);
> +	}
> +}
> +
>  #ifdef CONFIG_OF
>  /*
>   * Only the common platform data elements for s5m8767 are parsed her=
e from the
> @@ -289,6 +312,8 @@ static struct sec_platform_data *sec_pmic_i2c_par=
se_dt_pdata(
> =20
>  	pd->manual_poweroff =3D of_property_read_bool(dev->of_node,
>  						"samsung,s2mps11-acokb-ground");
> +	pd->disable_wrstbi =3D of_property_read_bool(dev->of_node,
> +						"samsung,s2mps11-wrstbi-ground");
>  	return pd;
>  }
>  #else
> @@ -434,6 +459,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
>  		goto err_mfd;
> =20
>  	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
> +	sec_pmic_configure(sec_pmic);
>  	sec_pmic_dump_rev(sec_pmic);
> =20
>  	return ret;
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/sam=
sung/core.h
> index aa78957e092f..a06098639399 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -134,6 +134,8 @@ struct sec_platform_data {
>  	int				buck4_init;
>  	/* Whether or not manually set PWRHOLD to low during shutdown. */
>  	bool				manual_poweroff;
> +	/* Disable the WRSTBI (buck voltage warm reset) when probing? */
> +	bool				disable_wrstbi;
>  };
> =20
>  /**
> diff --git a/include/linux/mfd/samsung/s2mps13.h b/include/linux/mfd/=
samsung/s2mps13.h
> index b1fd675fa36f..239e977ba45d 100644
> --- a/include/linux/mfd/samsung/s2mps13.h
> +++ b/include/linux/mfd/samsung/s2mps13.h
> @@ -184,5 +184,6 @@ enum s2mps13_regulators {
>   * Let's assume that default value will be set.
>   */
>  #define S2MPS13_BUCK_RAMP_DELAY		12500
> +#define S2MPS13_REG_WRSTBI_MASK		BIT(5)
> =20
>  #endif /*  __LINUX_MFD_S2MPS13_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
