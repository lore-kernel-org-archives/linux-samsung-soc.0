From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/5] ARM: S3C24XX: move plat-s3c24xx/irq.c into common.c
Date: Tue, 08 May 2012 14:38:37 +0900
Message-ID: <017901cd2cdc$d1214c20$7363e460$%kim@samsung.com>
References: <201205071939.37433.heiko@sntech.de>
 <201205071941.33343.heiko@sntech.de> <201205071959.22122.arnd@arndb.de>
 <201205072230.00758.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45839 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016Ab2EHFij convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 01:38:39 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3O00G1HVNX09Q0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:38:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3O00D7EVOEM730@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:38:38 +0900 (KST)
In-reply-to: <201205072230.00758.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Hi Arnd,
>=20
> Am Montag 07 Mai 2012, 21:59:21 schrieb Arnd Bergmann:
> > On Monday 07 May 2012, Heiko St=FCbner wrote:
> > > Again following the model set out by s3c64xx.
> > >
> > > As checkpatch showed a lot of style errors and warning, these got
> fixed
> > > too.
> > >
> > > Signed-off-by: Heiko Stueber <heiko@sntech.de>
> >
> > I object on two grounds:
> >
> > 1. there are plans to move irq chip drivers to drivers/irqchip
> eventually,
> > so I think it makes little sense to merge the current implementatio=
n
> into
> > another file. That just makes it harder to split it out again. Bett=
er
> leave
> > the file named irq.c and just move it to the mach-s3c24xx for now.
> >
> > 2. You should *never* move code around and change it at the same ti=
me
> > if you have a choice. Instead if you discover coding style issues w=
ith
> > code you want to move, fix those first and then do a second patch t=
o
> > move it without further changes. Otherwise it becomes very hard to
> > check that the coding style changes are actually correct.
>=20
> thanks for the two pointers, you are of course right with them.
> I will do another round of the patches.
>=20
Yes, agree.

I will apply Heiko's this series except 2nd patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
