From: kgene@kernel.org
Subject: RE: [PATCH 1/2] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Fri, 13 Dec 2013 18:18:12 +0900
Message-ID: <0bc201cef7e4$3f2cae20$bd860a60$@kernel.org>
References: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org>
 <201312130857.23890.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58090 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752005Ab3LMJSP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 04:18:15 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXQ004WIN6DJLA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Dec 2013 18:18:13 +0900 (KST)
In-reply-to: <201312130857.23890.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Heiko St=FCbner wrote:
>=20
> Am Donnerstag, 12. Dezember 2013, 15:06:50 schrieb Linus Walleij:
> > This isolates the custom S3C24xx GPIO definition table to
> > <linux/platform_data/gpio-samsung-s3x24xx.h> as this is
> > used in a few different places in the kernel, removing the
> > need to depend on the implicit inclusion of <mach/gpio.h>
> > from <linux/gpio.h> and thus getting rid of a few nasty
> > cross-dependencies.
> >
> > We also delete the nifty CONFIG_S3C24XX_GPIO_EXTRA stuff.
> > The biggest this can ever be for the S3C24XX is
> > CONFIG_S3C24XX_GPIO_EXTRA =3D 128, and then for CPU_S3C2443 or
> > CPU_S3C2416 32*12 GPIOs are added, so 32*12+128 =3D 512
> > is the absolute roof value on this platform. So we set
> > the size of ARCH_NR_GPIO to this and the GPIOs array will
> > fit any S3C24XX platform, as per pattern from other archs.
> >
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>

=46or this whole series:
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Added an #ifdef ARCH_S3C24XX around the header inclusion
> >   in drivers/gpio/gpio-samsung.c as we would otherwise
> >   have colliding definitions when compiling S3C64XX.
> > - Rename inclusion guard in the header file.
> >
> > If one of the maintainers give me an ACK for this I will
> > take it through the GPIO tree.
> > ---
>=20
> I'm not the maintainer of s3c24xx, but this looks nice ;-)
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Linus, please take this series with my ack.

Thanks,
Kukjin
