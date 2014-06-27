From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 10/14] regulator: Add driver for Maxim 77802 PMIC
 regulators
Date: Fri, 27 Jun 2014 10:26:11 +0100
Message-ID: <20140627092611.GI19645@lee--X1>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403806546-31122-11-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:55758 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752603AbaF0J0T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 05:26:19 -0400
Received: by mail-ie0-f179.google.com with SMTP id tr6so4186270ieb.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 02:26:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1403806546-31122-11-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Jun 2014, Javier Martinez Canillas wrote:
> The MAX77802 PMIC has 10 high-efficiency Buck and 32 Low-dropout
> (LDO) regulators. This patch adds support for all these regulators
> found on the MAX77802 PMIC and is based on a driver added by Simon
> Glass to the Chrome OS kernel 3.8 tree.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>=20
> Changes since v4: None
>=20
> Changes since v3:
>  - Set the supply_name for regulators to lookup their parent supply n=
ode.
>    Suggested by Mark Brown.
>  - Change Exyno5 for Exynos5420/Exynos5800 in regulator driver Kconfi=
g.
>    Suggested by Doug Anderson.
>=20
> Changes since v2:
>  - Use dev_warn() instead pr_warn(). Suggested by Mark Brown.
>  - Add a generic function to regmap core to copy registers instead of
>    having a driver-specific function. Suggested by Mark Brown.
>  - Remove unnecessary probe debug log. Suggested by Mark Brown.
>  - Set struct regulator_config dev field to MFD instead of the platfo=
rm dev.
>    Suggested by Mark Brown.
>  - Read the regulators operational mode from the hardware registers i=
nstead
>    of setting to normal as default on probe. Suggested by Mark Brown.
>  - Remove unnecessary cross-subsystem dependencies. Suggested by Lee =
Jones.
>=20
> Changes since v1:
>  - Remove unneeded check if num_regulators !=3D MAX77802_MAX_REGULATO=
RS.
>  - Fix .set_suspend_mode handler comment and split regulators ops for
>    regulators that behave differently. Suggested by Mark Brown.
>  - Use module_platform_driver() instead of having init/exit functions=
=2E
>    Suggested by Mark Brown.
>  - Use the new descriptor-based GPIO interface instead of the depreca=
ted
>    integer based GPIO one. Suggested by Mark Brown.
>  - Look for "regulators" child node instead of "voltage-regulators" t=
o be
>    consistent with other PMIC drivers. Suggested by Mark Brown.
>=20
>  drivers/mfd/max77802.c               |   8 +-
>  drivers/regulator/Kconfig            |   9 +
>  drivers/regulator/Makefile           |   1 +
>  drivers/regulator/max77802.c         | 694 +++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/max77802-private.h |   3 -
>  5 files changed, 711 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/regulator/max77802.c
>=20
> diff --git a/drivers/mfd/max77802.c b/drivers/mfd/max77802.c
> index 3d477fb..79d36b6 100644
> --- a/drivers/mfd/max77802.c
> +++ b/drivers/mfd/max77802.c
> @@ -228,7 +228,7 @@ static int max77802_i2c_probe(struct i2c_client *=
i2c,
> =20
>  	max77802 =3D devm_kzalloc(&i2c->dev, sizeof(struct max77802_dev),
>  				GFP_KERNEL);
> -	if (max77802 =3D=3D NULL)
> +	if (!max77802)
>  		return -ENOMEM;
> =20
>  	i2c_set_clientdata(i2c, max77802);
> @@ -315,6 +315,12 @@ static int max77802_suspend(struct device *dev)
>  	if (device_may_wakeup(dev))
>  		enable_irq_wake(max77802->irq);
> =20
> +	/*
> +	 * The IRQ must be disabled during suspend since due wakeup
> +	 * ordering issues it may be possible that the I2C controller
> +	 * is still suspended when the interrupt happens so the IRQ
> +	 * handler will fail to read the I2C bus.
> +	 */

Please re-word this, the English is a little off.

>  	disable_irq(max77802->irq);
> =20
>  	return 0;

Please separate the MFD changes out.  There is no need for them to be
munged in with regulator changes.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
