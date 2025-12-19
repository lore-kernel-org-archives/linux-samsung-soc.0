Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32B321420
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157002; cv=none; b=dP4f4Zyh0LfepkPvkBXTKpiHE1F3xUoOk2P0xdAkA4KvUf5qfe3zjZ0RobUEHtpYgVW+GxJdF65RiHx0RAYdbw7O7XvKb61KlZmBDt2KNTwXtzTc7X6xq/DDN0teBkpLaXfStNOpRY7BrGxDlsydqzFBGVfT0MPA8IgSxLpS0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157002; c=relaxed/simple;
	bh=6Vq+fXBZ1pm8zTkncBYsBcLahaHaNITbGsVEeNcCw20=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UTs1vB/l51OhDXOU7Tp3zKPiIZJ7jvh7qtwnbyRG+0RpBA+7sAPsM1sQffN2KIOGQtM5XdaLK3u2hB6t0iKdzYqDceKyVM5BZxYAO52UM2UARe+3GAaabo9qfMDyEEj2pipX1znQFGc6S1KGsQzBTaKBb0BNp+ZG83jldW28aWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rD5eX1y3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rD5eX1y3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so1442783f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 07:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156999; x=1766761799; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6DYE2MNhTkzYWZad7/KQln/QRdYJn201FXeD1GBcXY=;
        b=rD5eX1y3bLtixJZyEIEsjw8GDhwxAsndFtxpppsv4n5CHKE2VKMpSfzg1kRQ963ia/
         PVjuvuk//CZlQ/mel1gJyunpmIAQmIDW8RgbTll/73Jal+02ggLtUw/u+PfolHf4bQY8
         IsMV4HRSRPLf7tjzwLvq9dqmDDb2Dw82mvU3oJpt2jB1k8f4/7ByrH/KxLYojFzEg+ei
         bROUgqEyQ5GxQsWNJOeClTLoQs1w6epgXrTE5Ugas5Ei6gDTsPc6Ps8/qXvWBvb4lxez
         XF4idgw7vQjWS9fsXxMSYHBxxmhbVCFFfkk1k7DZxX1/9OcDqT1FJ3I/WG++y6vbkuqe
         Hbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156999; x=1766761799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6DYE2MNhTkzYWZad7/KQln/QRdYJn201FXeD1GBcXY=;
        b=YjxihbSAJa/GTRQq+RstwceNDtpXRrxp1RBymAZnsQOb8CtuHvepbkLhb/VjARc4rV
         Y/8cRks9p7CI96XMrA69zWYK8yHvR9Y/iG3LbaBiVkhI37ACvhrNDn/Nzpj3l9FYSADP
         ML2Nw8/lOYCmegCdvMUalbdUf/j52iN2RzrBYV5ZGwJjvfGmZE1mInrzKBptJhOxAs+N
         D3qZ3+cWsZGxNvmnbHOj5P84Jh3pLYAByp2IInKdYnu0XCXFEAINKfuiqzEBhIH+8QdF
         /W0Z4e3us2OpHIp4/nyj4WzZ9cXVzD+QUe+557qA4/xLeL+ybXvXGaL5e7NEDyALBlRO
         THeg==
X-Forwarded-Encrypted: i=1; AJvYcCVeMfU/0dDpUjZ64NJFU0T2Mzxmox3D+ZRQgFqcJdO1npsdrUS5WQ7mcBVu4IkEf96j9ThXBtfq+BiBWvPS3jQMIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynBDSLBJ1qBT8MgPaCMbz2zvB/GI611eMu2LwmEE3XnPUMWVqw
	RMXyPCqRyXrEtcbYS8PK6lrPoyFuW/5S9NMtuBbxQFgawx4Y5HYk9NIpL4vORyy3Mh8=
X-Gm-Gg: AY/fxX5hOpIxNjjZJ6EfifqUlwiAwozUHoNw7vH9/em6+cBpHt+RANXj5QsVhfLVAny
	tBgozT+RJ8sgeJpbsw7hmKLk6X+9k0NHkq06lwFbkfInOB3Pg/NdVOWVr0gvGvc+JU1vnfxOH6B
	nvN8I1n3CGwYF/2dtGqs8o+5sDh5SC4sdro51B0irSVY17FBApTOvfV6HBDyR220BMLgfJoOtna
	tFroWPT4qO6fYMQgkhHqe+jMwCWLqlhJ7kedYa2lDUVyOUfunLnVx0/o+L5TgbcZc8AKGi6ycf/
	/NOPOtX2i9/UCSeW6vy8fs3zYj/VjW8Yd7+TzzOWkpC++qU9s8BSZQocDjgHfnG1WohmcAXsWcY
	xmIi7+PNjDoct53ylKpDavNBsJ9V4KZNJWKXNh3nM15jaL1uG/Sor70/Tp2thevsvOXkz21izAt
	/aOwIA9n3issoeAFNELw==
X-Google-Smtp-Source: AGHT+IHfurN12FpNnNPiiNVGLrHRJmgkN9qwpziMmbCueFgBzqKgruvEnsQbRkbsEmUQUdLB2C9F4g==
X-Received: by 2002:a05:6000:22c1:b0:431:771:a50c with SMTP id ffacd0b85a97d-432447952a3mr8084959f8f.1.1766156998712;
        Fri, 19 Dec 2025 07:09:58 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82c5csm5281983f8f.21.2025.12.19.07.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:09:58 -0800 (PST)
Message-ID: <653202f78f060b7e001b78604dd26d0f18ab76f9.camel@linaro.org>
Subject: Re: [PATCH v3 5/6] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 15:10:04 +0000
In-Reply-To: <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
>=20
> Add the GS101 chip ID support. The support is intentionally added in the
> exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
> we estimate that there will not be any OTP consumers in the kernel other
> than the chip ID/SoC interface. The downstream GS101 drivers confirm
> this supposition.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 87 ++++++++++++++++++++++++++=
++++++-----
> =C2=A01 file changed, 75 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/ex=
ynos-chipid.c
> index 5c8660374269c87ec38ebca242918bd7b1d362e5..06eb6ef8740d3f58eda52c8e7=
1cf40074d2deb1f 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -13,9 +13,11 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/array_size.h>
> +#include <linux/clk.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/device/devres.h>
> -#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/ioport.h>
> =C2=A0#include <linux/mfd/syscon.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> @@ -28,9 +30,11 @@
> =C2=A0#include "exynos-asv.h"
> =C2=A0
> =C2=A0struct exynos_chipid_variant {
> -	unsigned int rev_reg;		/* revision register offset */
> +	unsigned int main_rev_reg;	/* main revision register offset */
> +	unsigned int sub_rev_reg;	/* sub revision register offset */
> =C2=A0	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
> =C2=A0	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
> +	bool efuse;
> =C2=A0};
> =C2=A0
> =C2=A0struct exynos_chipid_info {
> @@ -69,6 +73,8 @@ static const struct exynos_soc_id {
> =C2=A0	{ "EXYNOS990", 0xE9830000 },
> =C2=A0	{ "EXYNOSAUTOV9", 0xAAA80000 },
> =C2=A0	{ "EXYNOSAUTOV920", 0x0A920000 },
> +	/* Compatible with: google,gs101-otp */
> +	{ "GS101", 0x9845000 },
> =C2=A0};
> =C2=A0
> =C2=A0static const char *exynos_product_id_to_name(unsigned int product_i=
d)
> @@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct devic=
e *dev,
> =C2=A0		return dev_err_probe(dev, ret, "failed to read Product ID\n");
> =C2=A0	soc_info->product_id =3D val & EXYNOS_MASK;
> =C2=A0
> -	if (data->rev_reg !=3D EXYNOS_CHIPID_REG_PRO_ID) {
> -		ret =3D regmap_read(regmap, data->rev_reg, &val);
> +	if (data->sub_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID) {
> +		/* exynos4210 case */
> +		main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +	} else {
> +		unsigned int val2;
> +
> +		ret =3D regmap_read(regmap, data->sub_rev_reg, &val2);
> =C2=A0		if (ret < 0)
> =C2=A0			return dev_err_probe(dev, ret,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to read revision\n");
> +
> +		if (data->main_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID)
> +			/* gs101 case */
> +			main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		else
> +			/* exynos850 case */
> +			main_rev =3D (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> +		sub_rev =3D (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;

The above looks a little fragile, comparing register offsets between differ=
ent
hardware platforms and macros, but I guess it works for now and isn't reall=
y
much different to before.

> =C2=A0	}
> -	main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> -	sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> =C2=A0	soc_info->revision =3D (main_rev << EXYNOS_REV_PART_SHIFT) | sub_r=
ev;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_dev=
ice *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return ERR_CAST(base);
> +
> +	const struct regmap_config reg_config =3D {
> +		.reg_bits =3D 32,
> +		.reg_stride =3D 4,
> +		.val_bits =3D 32,
> +		.use_relaxed_mmio =3D true,
> +		.max_register =3D (resource_size(res) - reg_config.reg_stride),
> +	};
> +
> +	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
> +}
> +
> =C2=A0static void exynos_chipid_unregister_soc(void *data)
> =C2=A0{
> =C2=A0	soc_device_unregister(data);
> @@ -127,10 +167,24 @@ static int exynos_chipid_probe(struct platform_devi=
ce *pdev)
> =C2=A0		return dev_err_probe(dev, -EINVAL,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get match data\n");
> =C2=A0
> -	regmap =3D device_node_to_regmap(dev->of_node);
> -	if (IS_ERR(regmap))
> -		return dev_err_probe(dev, PTR_ERR(regmap),
> -				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get regmap\n");
> +	if (drv_data->efuse) {
> +		struct clk *clk;
> +
> +		regmap =3D exynos_chipid_get_efuse_regmap(pdev);
> +		if (IS_ERR(regmap))
> +			return dev_err_probe(dev, PTR_ERR(regmap),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get efuse regmap\n");
> +
> +		clk =3D devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(clk))
> +			return dev_err_probe(dev, PTR_ERR(clk),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get clock\n");

Could you use devm_regmap_init_mmio_clk() instead?

Cheers,
Andre'

> +	} else {
> +		regmap =3D device_node_to_regmap(dev->of_node);
> +		if (IS_ERR(regmap))
> +			return dev_err_probe(dev, PTR_ERR(regmap),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get regmap\n");
> +	}
> =C2=A0
> =C2=A0	ret =3D exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_=
info);
> =C2=A0	if (ret < 0)
> @@ -177,19 +231,28 @@ static int exynos_chipid_probe(struct platform_devi=
ce *pdev)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct exynos_chipid_variant exynos4210_chipid_drv_dat=
a =3D {
> -	.rev_reg	=3D 0x0,
> =C2=A0	.main_rev_shift	=3D 4,
> =C2=A0	.sub_rev_shift	=3D 0,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct exynos_chipid_variant exynos850_chipid_drv_data=
 =3D {
> -	.rev_reg	=3D 0x10,
> +	.main_rev_reg	=3D 0x10,
> +	.sub_rev_reg	=3D 0x10,
> =C2=A0	.main_rev_shift	=3D 20,
> =C2=A0	.sub_rev_shift	=3D 16,
> =C2=A0};
> =C2=A0
> +static const struct exynos_chipid_variant gs101_chipid_drv_data =3D {
> +	.sub_rev_reg	=3D 0x10,
> +	.sub_rev_shift	=3D 16,
> +	.efuse =3D true,
> +};
> +
> =C2=A0static const struct of_device_id exynos_chipid_of_device_ids[] =3D =
{
> =C2=A0	{
> +		.compatible	=3D "google,gs101-otp",
> +		.data		=3D &gs101_chipid_drv_data,
> +	}, {
> =C2=A0		.compatible	=3D "samsung,exynos4210-chipid",
> =C2=A0		.data		=3D &exynos4210_chipid_drv_data,
> =C2=A0	}, {
