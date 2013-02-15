From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] ARM: S3C24XX: handle s3c2412 eints using new infrastructure
Date: Fri, 15 Feb 2013 16:26:35 +0100
Message-ID: <201302151626.36805.heiko@sntech.de>
References: <201302120102.03511.heiko@sntech.de> <201302120105.45608.heiko@sntech.de> <CACRpkdZ5dxyXhrNUJDEzPoDOGRn_50ZuaHW4ZpguSyApQvh7hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:36255 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755933Ab3BOP0p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 10:26:45 -0500
In-Reply-To: <CACRpkdZ5dxyXhrNUJDEzPoDOGRn_50ZuaHW4ZpguSyApQvh7hw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Freitag, 15. Februar 2013, 15:48:52 schrieb Linus Walleij:
> On Tue, Feb 12, 2013 at 1:05 AM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > The s3c2412 handles the eints 0 to 3 different than all the other S=
oCs
> > of the 24xx range. These eints must be acked and masked in the regu=
lar
> > bits as well as the bits 0 to 3 of the eint registers, which are un=
used
> > on the other SoCs.
> >=20
> > This of course can be realized using the new infrastructure with th=
e
> > eint bits in the main register being the parent interrupts of the
> > same bits in the eint register.
> >=20
> > The s3c2412 therefore gets its own IRQ_EINT0 to 4 constants that
> > reside in the newly created gap before IRQ_EINT4. gpio-samsung, as =
the
> > only user of these is modified to return the correct values when
> > handling gpio_to_irq requests on s3c2412 based machines.
> >=20
> > Due to lack of hardware this is compile tested only, but should
> > hopefully work as intended.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> We definately need an ACK from some Samsung maintainer for
> this patch...

Kukjin has already included these patches [0], but did only reply to
the previous series (which handles s3c2440 specific stuff) that he
included both [1].


Heiko


[0] http://git.kernel.org/?p=3Dlinux/kernel/git/kgene/linux-samsung.git=
;a=3Dshortlog;h=3Drefs/heads/next/irq-s3c24xx-2
[1] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/16074
