From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] ARM: S3C24XX: move plat-s3c24xx/irq.c into common.c
Date: Mon, 7 May 2012 19:59:21 +0000
Message-ID: <201205071959.22122.arnd@arndb.de>
References: <201205071939.37433.heiko@sntech.de> <201205071941.33343.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:51756 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757523Ab2EGT70 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 May 2012 15:59:26 -0400
In-Reply-To: <201205071941.33343.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On Monday 07 May 2012, Heiko St=FCbner wrote:
> Again following the model set out by s3c64xx.
>=20
> As checkpatch showed a lot of style errors and warning, these got fix=
ed too.
>=20
> Signed-off-by: Heiko Stueber <heiko@sntech.de>

I object on two grounds:

1. there are plans to move irq chip drivers to drivers/irqchip eventual=
ly,
so I think it makes little sense to merge the current implementation in=
to
another file. That just makes it harder to split it out again. Better l=
eave
the file named irq.c and just move it to the mach-s3c24xx for now.

2. You should *never* move code around and change it at the same time
if you have a choice. Instead if you discover coding style issues with
code you want to move, fix those first and then do a second patch to
move it without further changes. Otherwise it becomes very hard to
check that the coding style changes are actually correct.

The other four patches look fine to me.

	Arnd
