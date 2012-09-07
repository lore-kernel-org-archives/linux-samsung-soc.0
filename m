From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] gpio: samsung: add devicetree init for s3c24xx arches
Date: Fri, 7 Sep 2012 09:27:27 +0200
Message-ID: <201209070927.28405.heiko@sntech.de>
References: <201208282355.44268.heiko@sntech.de> <243901cd8cbb$10ad0580$32071080$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <243901cd8cbb$10ad0580$32071080$%kim@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Rob Herring' <rob.herring@calxeda.com>, 'Rob Landley' <rob@landley.net>, 'Linus Walleij' <linus.walleij@stericsson.com>, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am Freitag, 7. September 2012, 07:38:52 schrieb Kukjin Kim:
> Heiko St=C3=BCbner wrote:
> > Until now the Exynos-SoC was the only Samsung-SoC supporting the GP=
IOs
> > via the device tree. This patch implements dt-support for the
> > s3c24xx arches.
> >=20
> > The controllers contain only 3 cells, as the underlying gpio contro=
ller
> > does not support controlling the drive strength on a gpio level.
> >=20
> > Tested with the gpio-keys driver on a s3c2416 based machine.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> > ---
>=20
> [...]
>=20
> > +#if defined(CONFIG_PLAT_S3C24XX) && defined(CONFIG_OF)
>=20
> [...]
>=20
> > +static __init void s3c24xx_gpiolib_attach_ofnode(struct
> > samsung_gpio_chip *chip,
> > +						 u64 base, u64 offset)
> > +{
>=20
> [...]
>=20
> > +}
> > +#elif defined(CONFIG_PLAT_S3C24XX)
>=20
> Heiko, above line breaks building for other samsung stuff except s3c2=
4xx. I
> fixed with following which has been amended in your patch. If any
> problems, please let me know.

yeah, I see the problem now. Thanks for the fix and sorry to have cause=
d=20
additional work.


Heiko
