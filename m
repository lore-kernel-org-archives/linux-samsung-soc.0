From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Fri, 13 Dec 2013 09:58:01 +0100
Message-ID: <201312130958.01781.heiko@sntech.de>
References: <1386857210-4944-1-git-send-email-linus.walleij@linaro.org> <201312130857.23890.heiko@sntech.de> <CACRpkdaHy8BDmj+noGqhOm=c0UmSn6pKb9WbGEPtP7M-KwYxLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:36161 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752171Ab3LMI6M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 03:58:12 -0500
In-Reply-To: <CACRpkdaHy8BDmj+noGqhOm=c0UmSn6pKb9WbGEPtP7M-KwYxLA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Am Freitag, 13. Dezember 2013, 09:20:39 schrieb Linus Walleij:
> On Fri, Dec 13, 2013 at 8:57 AM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > I'm not the maintainer of s3c24xx,
>=20
> Maybe you should be. I have a hard time getting the generic
> Samsung maintainers' attention to S3C patches...
>=20
> > but this looks nice ;-)
>=20
> Do you think you can test it on hardware?

on an Openmoko Neo Freerunner (S3C2442)
Tested-by: Heiko Stuebner <heiko@sntech.de>
