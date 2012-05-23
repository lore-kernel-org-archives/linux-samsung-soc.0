From: jonghwa3.lee@samsung.com
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 10:50:13 +0900
Message-ID: <4FBC4255.4040307@samsung.com>
References: <y@samsung.com> <4fbb2ada.63de440a.589d.78e2@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50040 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756706Ab2EWBuY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 May 2012 21:50:24 -0400
In-reply-to: <4fbb2ada.63de440a.589d.78e2@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: yadi.brar01@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

Hi, again.
On 2012=EB=85=84 05=EC=9B=94 22=EC=9D=BC 14:57, yadi.brar01@gmail.com w=
rote:


> +static __devinit int max77686_pmic_probe(struct platform_device *pde=
v)
> +{

> +
> +	for (i =3D 0; i < pdata->num_regulators; i++) {
> +		config.dev =3D max77686->dev;
> +		config.init_data =3D pdata->regulators[i].init_data;
> +		config.driver_data =3D max77686;
> +		config.regmap =3D iodev->regmap;
> +
> +		rdev[i] =3D regulator_register(&regulators[i], &config);


I'm sorry that i missed one. You have to register all regulators
unconditionally. Mark brown commented about this to my former patch.

'No, you should unconditionally register all regulators the device
physically has.  This is useful for debug and simplifies the code.'
						- from Mark Brown



Thanks.
