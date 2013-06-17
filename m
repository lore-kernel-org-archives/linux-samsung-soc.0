From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] gpio: samsung: add PINCTRL_S3C24XX to exclude options
Date: Mon, 17 Jun 2013 17:48:38 +0200
Message-ID: <2878524.ZISTLvd28A@amdc1227>
References: <201306140044.15568.heiko@sntech.de> <1825186.C6XXUYx8Nl@amdc1227>
 <51BF2EAD.9030504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39942 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab3FQPss convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 11:48:48 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00JOMNWOWQ50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 16:48:46 +0100 (BST)
In-reply-to: <51BF2EAD.9030504@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linus.walleij@linaro.org

On Tuesday 18 of June 2013 00:43:41 Kukjin Kim wrote:
> On 06/17/13 22:19, Tomasz Figa wrote:
> > Hi Heiko,
> >=20
> > On Friday 14 of June 2013 00:45:27 Heiko St=FCbner wrote:
> >> When a pinctrl driver is loaded legacy gpio support has to be disa=
bled.
> >> The code checking for the pinctrl presence is contained in an #ifd=
ef
> >> checking for the presence of a valid samsung pinctrl driver.
> >>=20
> >> There the new PINCTRL_S3C24XX was missing resulting in the check n=
ever
> >> being run and the gpio being enabled breaking the pinctrl driver.
> >>=20
> >> Fix this by adding the missing CONFIG_PINCTRL_S3C24XX
> >>=20
> >> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> >> ---
> >>=20
> >>   drivers/gpio/gpio-samsung.c |    3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsu=
ng.c
> >> index a1392f4..c84503e 100644
> >> --- a/drivers/gpio/gpio-samsung.c
> >> +++ b/drivers/gpio/gpio-samsung.c
> >> @@ -2949,7 +2949,8 @@ static __init int samsung_gpiolib_init(void)
> >>=20
> >>   	int i, nr_chips;
> >>   	int group =3D 0;
> >>=20
> >> -#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYN=
OS5440)
> >> +#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYN=
OS5440)
> >> || \ +    defined(CONFIG_PINCTRL_S3C24XX)
> >=20
> > I wonder if this wouldn't be simply covered by PINCTRL_SAMSUNG (exc=
ept
> > PINCTRL_EXYNOS5440 which doesn't use the common part).
>=20
> Well, not added compatible for 's3c64xx-pinctrl' yet?

Right, but this shouldn't have any effect on this code. PINCTRL_S3C64XX=
 isn't=20
selected by anything yet, so PINCTRL_SAMSUNG won't be selected when=20
ARCH_S3C64XX is used.

As for s3c64xx DT support, I'm planning to finally post patches this we=
ek.

Best regards,
Tomasz

> - Kukjin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
