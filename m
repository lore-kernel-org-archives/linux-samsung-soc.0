From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] mfd: sec-core: Dump PMIC revision to find out the
 HW
Date: Tue, 13 Oct 2015 09:47:29 +0100
Message-ID: <20151013084729.GF32409@x1>
References: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:38138 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751643AbbJMIrd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 04:47:33 -0400
Received: by wieq12 with SMTP id q12so20766568wie.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2015 01:47:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Wed, 07 Oct 2015, Krzysztof Kozlowski wrote:

> There are different revisions of the same chipset. For example S2MPS1=
3 has
> more than 2 revisions. They differ slightly in regulator constraints.
> Print the revision number to easily find which PMIC is used on the bo=
ard.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
>=20
> Changs since v1:
> None.
> ---
>  drivers/mfd/sec-core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 2d1137a7a0ee..589e5efc2d7f 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -253,6 +253,15 @@ static const struct regmap_config s5m8767_regmap=
_config =3D {
>  	.cache_type =3D REGCACHE_FLAT,
>  };
> =20
> +static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
> +{
> +	unsigned int val;
> +
> +	/* For each device type, the REG_ID is always the first register */
> +	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
> +		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
> +}
> +
>  #ifdef CONFIG_OF
>  /*
>   * Only the common platform data elements for s5m8767 are parsed her=
e from the
> @@ -425,6 +434,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
>  		goto err_mfd;
> =20
>  	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
> +	sec_pmic_dump_rev(sec_pmic);
> =20
>  	return ret;
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
