From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: s3c24xx: fix build error
Date: Tue, 07 Jan 2014 20:12:42 +0100
Message-ID: <22410027.ZzM9gppO8W@phil>
References: <1389119245-2167-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38200 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752460AbaAGTNE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 14:13:04 -0500
In-Reply-To: <1389119245-2167-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Am Dienstag, 7. Januar 2014, 19:27:25 schrieb Linus Walleij:
> When enabling device tree on the S3C an additional build
> bug appears in the Osiris DVS board file:
>=20
> CC  arch/arm/mach-s3c24xx/mach-osiris-dvs.o
> archh/arm/mach-s3c24xx/mach-osiris-dvs.c:
> In function =E2=80=98osiris_dvs_notify=E2=80=99:
> arch/arm/mach-s3c24xx/mach-osiris-dvs.c:77:4:
> error: implicit declaration of function =E2=80=98S3C2410_GPB=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>     gpio_set_value(OSIRIS_GPIO_DVS, 1);
>     ^
>=20
> Fix this by explicitly including
> <linux/platform_data/gpio-samsung-s3c24xx.h>
>=20
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I have tentatively applied this to the GPIO tree so I
> don't cause build regressions, ACKs are still
> appreciated from the S3C maintainers.

Acked-by: Heiko Stuebner <heiko@sntech.de>
