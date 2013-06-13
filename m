From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 08/15] pwm: Add new pwm-samsung driver
Date: Thu, 13 Jun 2013 22:18:16 +0200
Message-ID: <2169030.uXO88EfhRE@flatron>
References: <1370467100-10820-1-git-send-email-tomasz.figa@gmail.com> <1370467100-10820-9-git-send-email-tomasz.figa@gmail.com> <201306132214.20017.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:61810 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757553Ab3FMUST convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 16:18:19 -0400
In-Reply-To: <201306132214.20017.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, thierry.reding@gmail.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On Thursday 13 of June 2013 22:14:19 Heiko St=FCbner wrote:
> Am Mittwoch, 5. Juni 2013, 23:18:13 schrieb Tomasz Figa:
> > This patch introduces new Samsung PWM driver, which uses Samsung
> > PWM/timer master driver to control shared parts of the hardware.
> >=20
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> >=20
> >  drivers/pwm/Makefile      |   1 +
> >  drivers/pwm/pwm-samsung.c | 528
> >=20
> > ++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed, 529
> > insertions(+)
> >=20
> >  create mode 100644 drivers/pwm/pwm-samsung.c
> >=20
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
>=20
> [...]
>=20
> > +static int pwm_samsung_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct samsung_pwm_chip *chip;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > +	if (chip =3D=3D NULL) {
> > +		dev_err(dev, "failed to allocate driver data\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	chip->chip.dev =3D &pdev->dev;
> > +	chip->chip.ops =3D &pwm_samsung_ops;
> > +	chip->chip.base =3D -1;
> > +	chip->chip.npwm =3D SAMSUNG_PWM_NUM;
> > +
> > +	if (pdev->dev.of_node) {
> > +		ret =3D pwm_samsung_parse_dt(chip);
> > +		if (ret)
> > +			return ret;
> > +
> > +		chip->chip.of_xlate =3D of_pwm_xlate_with_flags;
> > +		chip->chip.of_pwm_n_cells =3D 3;
> > +	} else {
> > +		if (!pdev->dev.platform_data) {
> > +			dev_err(&pdev->dev, "no platform data=20
specified\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		memcpy(&chip->variant, pdev->dev.platform_data,
> > +							sizeof(chip-
>variant));
> > +	}
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "failed to get mem resource\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	chip->base =3D devm_request_and_ioremap(&pdev->dev, res);
> > +	if (!chip->base) {
> > +		dev_err(&pdev->dev, "failed to request and map=20
registers\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	chip->base_clk =3D devm_clk_get(&pdev->dev, "timers");
> > +	if (IS_ERR(chip->base_clk)) {
> > +		dev_err(dev, "failed to get timer base clk\n");
> > +		return PTR_ERR(chip->base_clk);
> > +	}
> > +	clk_prepare_enable(chip->base_clk);
> > +
> > +	chip->tclk0 =3D devm_clk_get(&pdev->dev, "pwm-tclk0");
> > +	chip->tclk1 =3D devm_clk_get(&pdev->dev, "pwm-tclk1");
> > +
> > +	ret =3D pwmchip_add(&chip->chip);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register pwm\n");
> > +		goto err_clk_disable;
> > +	}
> > +
> > +	dev_info(dev, "base_clk at %lu, tclk0 at %lu, tclk1 at %lu\n",
> > +		clk_get_rate(chip->base_clk),
> > +		!IS_ERR(chip->tclk0) ? clk_get_rate(chip->tclk0) : 0,
> > +		!IS_ERR(chip->tclk1) ? clk_get_rate(chip->tclk1) : 0);
>=20
> hmm, these values simply tell some internal state of the pwm, so
> wouldn't a dev_dbg be more appropriate?

Hmm, I have kept it as dev_info as in old driver, but now as you say it=
,=20
dev_dbg might be more appropriate indeed, as it isn't really anything=20
important that users should know...

Best regards,
Tomasz

> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	return 0;
> > +
> > +err_clk_disable:
> > +	clk_disable_unprepare(chip->base_clk);
> > +
> > +	return ret;
> > +}
