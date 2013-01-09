From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] pwm: add Exynos PWM driver
Date: Wed, 9 Jan 2013 09:16:21 +0100
Message-ID: <20130109081621.GE12782@avionic-0098.adnet.avionic-design.de>
References: <1355393796-15436-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:56799 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757251Ab3AIIQa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 03:16:30 -0500
Content-Disposition: inline
In-Reply-To: <1355393796-15436-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 13, 2012 at 07:16:36PM +0900, Joonyoung Shim wrote:
> This is PWM driver to support 4 pwm for Exynos SoCs. Also this supports
> device tree node.

Maybe something like the following would read better:

	This is a PWM driver to support 4 PWM devices for Exynos SoCs. The
	driver also supports device tree probing.

Also if the driver support device tree probing you need to add a binding
to the Documentation/devicetree/bindings/pwm directory.

> The existing s3c24xx-pwm driver has many dependence with arch specific
> codes and it is difficult to support device tree by static mapping of

"dependencies on arch-specific code"

> PMW memory area. Also it can't support multi pwm to one device and can't
> make to module.

"PWM memory region", "multiple PWMs" and "can't be built as a module".

That said, is this driver meant to replace pwm-samsung eventually?

> +config PWM_EXYNOS
> +	tristate "Exynos pwm support"

"Exynos PWM support", please. I know others get this wrong as well, but
I plan to fix those in another patch.

> +static int exynos_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> +			     int duty_ns, int period_ns)
> +{
> +	struct exynos_pwm *exynos = container_of(chip, struct exynos_pwm, chip);

Can you add a to_exynos_pwm() macro for this, please?

> +static int exynos_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct exynos_pwm *exynos = container_of(chip, struct exynos_pwm, chip);
> +	unsigned int hw = pwm->hwpwm;

You only use the "hw" variable once, so I think you can just use
pwm->hwpwm instead.

> +static void exynos_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct exynos_pwm *exynos = container_of(chip, struct exynos_pwm, chip);
> +	unsigned int hw = pwm->hwpwm;

Same here.

> +static int exynos_pwm_probe(struct platform_device *pdev)
> +{
[...]
> +	exynos->dev = &pdev->dev;

You never use this, so you might as well remove the field from the
struct exynos_pwm.

> +	exynos->clk = devm_clk_get(&pdev->dev, "timers");
> +	if (IS_ERR(exynos->clk)) {
> +		dev_err(&pdev->dev, "failed to get timer clock with %ld\n",
> +				PTR_ERR(exynos->clk));

Can you align the PTR_ERR() with &pdev->dev, please?

> +	/* Reset registers related with PWM clock and control */
> +	writel(PWM_TCFG0_RST_VAL, exynos->base + PWM_TCFG0);
> +	writel(PWM_TCFG1_RST_VAL, exynos->base + PWM_TCFG1);
> +	writel(PWM_TCON_RST_VAL, exynos->base + PWM_TCON);

Can we get rid of these magic values? I don't quite see why they need to
be reset here anyway. Are the hardware defaults not good enough? But at
least if you absolutely must write them here, please change the reset
values definitions to use the register bit definitions instead of using
the magic values.

> +static int __devexit exynos_pwm_remove(struct platform_device *pdev)

No more __devexit, please.

> +static struct platform_driver exynos_pwm_driver = {
> +	.probe		= exynos_pwm_probe,
> +	.remove		= __devexit_p(exynos_pwm_remove),

And no more __devexit_p either.

Thierry

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7SdVAAoJEN0jrNd/PrOh7D8QALsAYcMzrYfbuIcDxiQ7ii6c
ZqR6Q0FajuRGAy/ogN+bXrhEXHNmgmGpflswZbs818bMIxrbrBD7eGxlQrSRN4Q4
1dgMY+05UWXccuZObwu/deYAOhiPuQMivp8ZvJBN6qfnquRgoeRGPqm2uYT8UBrj
Kq4oReihvADZAr8OwVYgSUoph9mmawF2oKCeuLsFC9N9g0UULLv2frnza4IPBEBh
UvHdyZcr08aepfmuHmTtk1vTraOTf4w7mlCVWix+jqO18uDL/ZN6S/MZrVTUEY9H
BqMNJpIRIt/Zi8x1xC5r9Wb3xSBo9h8LNhg5LF90Cj9aiMeGFpmHzJYdFeA1AWxz
TCnQG5aiOAbJWwMeEtzprgsXX7ilmnHLqE15VjCNoFBWT0B8J6s8SagjwbRHxdjL
huTH8JkH8u2sE18CgMn1J+HCRbHa20jn83pYRJP9HTlmrwsS4j+2/HasImicnTBJ
SWrg11qVdZAgm5mByIrpaR/9dXMS9VyY39NmRmNvnA/xFY67XAzoihnfLJfIT//S
DGY812kLDyMYvn8AA1RNiFbyKDDkz+QY/X8crYmJyoiqEnhRH2OHi4sy3EbibrpY
RtSZz5I9CTtt2mqG4rR5+iWEVcZCi+itxKCu7BPX7ZgYhfEjbmwhuVHHcTZt2MvF
aTMh/3gGYRhQmRZPZWeO
=T+oq
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
