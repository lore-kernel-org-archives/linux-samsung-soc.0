From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: remove plat-samsung/irq.h
Date: Tue, 12 Feb 2013 20:56:36 -0800
Message-ID: <1df801ce09a6$81ce38c0$856aaa40$@samsung.com>
References: <201302122042.32471.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20619 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490Ab3BME46 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 23:56:58 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI5000XL72JPEK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 13:56:56 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI500B9N72UUF40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 13:56:56 +0900 (KST)
In-reply-to: 
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Kukjin Kim wrote:
>=20
> Heiko St=C3=BCbner wrote:
> >
> > plat-samsung/irq.h did only contain functions for handling the spre=
ad
> > out subirqs on s3c24xx arches, which are not needed anymore.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > Sorry for bringing this separate submission, but I just remembered =
it
> > this evening.
> >
> > This applies on top of all the other s3c24xx irq changes and I thin=
k
> > this patch will mark the end of the irq-cleanup for now.
> >
> >  arch/arm/mach-s3c24xx/irq-pm.c           |    7 ++-
> >  arch/arm/mach-s3c24xx/irq.c              |    8 +--
> >  arch/arm/plat-samsung/include/plat/irq.h |  116
> > ------------------------------
> >  3 files changed, 9 insertions(+), 122 deletions(-)  delete mode
> > 100644 arch/arm/plat-samsung/include/plat/irq.h
> >
> Applied, thanks :-)
>=20
Just note, happens following error:

arch/arm/mach-s3c24xx/bast-irq.c:37:22: fatal error: plat/irq.h: No suc=
h file or directory
compilation terminated.
=2E..
make[2]: *** [arch/arm/mach-s3c24xx/bast-irq.o] Error 1
make[2]: *** Waiting for unfinished jobs....
  CC      crypto/testmgr.o
  CC      lib/bsearch.o
  AS      arch/arm/lib/memcpy.o
  AS      arch/arm/lib/memmove.o
make[1]: *** [arch/arm/mach-s3c24xx] Error 2
make[1]: *** Waiting for unfinished jobs....

I fixed when I applied.

Thanks.

- Kukjin
