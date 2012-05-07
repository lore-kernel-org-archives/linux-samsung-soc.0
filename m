From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/5] ARM: S3C24XX: move plat-s3c24xx/irq.c into common.c
Date: Mon, 7 May 2012 22:30:00 +0200
Message-ID: <201205072230.00758.heiko@sntech.de>
References: <201205071939.37433.heiko@sntech.de> <201205071941.33343.heiko@sntech.de> <201205071959.22122.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:60005 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757614Ab2EGUaI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 May 2012 16:30:08 -0400
In-Reply-To: <201205071959.22122.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Arnd,

Am Montag 07 Mai 2012, 21:59:21 schrieb Arnd Bergmann:
> On Monday 07 May 2012, Heiko St=FCbner wrote:
> > Again following the model set out by s3c64xx.
> >=20
> > As checkpatch showed a lot of style errors and warning, these got f=
ixed
> > too.
> >=20
> > Signed-off-by: Heiko Stueber <heiko@sntech.de>
>=20
> I object on two grounds:
>=20
> 1. there are plans to move irq chip drivers to drivers/irqchip eventu=
ally,
> so I think it makes little sense to merge the current implementation =
into
> another file. That just makes it harder to split it out again. Better=
 leave
> the file named irq.c and just move it to the mach-s3c24xx for now.
>=20
> 2. You should *never* move code around and change it at the same time
> if you have a choice. Instead if you discover coding style issues wit=
h
> code you want to move, fix those first and then do a second patch to
> move it without further changes. Otherwise it becomes very hard to
> check that the coding style changes are actually correct.

thanks for the two pointers, you are of course right with them.
I will do another round of the patches.


Thanks
Heiko
