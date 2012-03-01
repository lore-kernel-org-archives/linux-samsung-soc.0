From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/12] ARM: S3C24XX: create mach-s3c24xx/ for S3C24XX SoCs
 - WIP
Date: Thu, 01 Mar 2012 12:51:49 +0900
Message-ID: <076601ccf75e$a19450a0$e4bcf1e0$%kim@samsung.com>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
 <201202282239.17107.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27498 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757055Ab2CADvx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 22:51:53 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0600LIXTEFDC90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 12:51:51 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600BKBTEDDZ10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 12:51:51 +0900 (KST)
In-reply-to: <201202282239.17107.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Heiko St=FCbner wrote:
>=20
> Am Mittwoch 15 Februar 2012, 23:55:34 schrieb Kukjin Kim:
> > This patch aims to make a one mach- directory for S3C24XX SoCs
> > and now not finished yet such as moving cpufreq and merging
> > plat-s3c24xx/. I think it will be done maybe in a week.
> >
> > [PATCH 01/12] ARM: S3C24XX: remove unused spi gpio setup functions
> > [PATCH 02/12] ARM: S3C24XX: move spi-s3c24xx platdata out of mach
> > [PATCH 03/12] ARM: S3C24XX: Remove extern declaration of clk_msyscl=
k
> > [PATCH 04/12] ARM: S3C24XX: move common S3C2443 clock definitions t=
o
> > [PATCH 05/12] ARM: S3C2410: move s3c2410_baseclk_add to clock.h
> > [PATCH 06/12] ARM: S3C24XX: change the ARCH_S3C2410 to ARCH_S3C24XX
> > [PATCH 07/12] ARM: S3C2410: move mach-s3c2410/* into mach-s3c24xx/
> > [PATCH 08/12] ARM: S3C2412: move mach-s3c2412/* into mach-s3c24xx/
> > [PATCH 09/12] ARM: S3C2416: move mach-s3c2416/* into mach-s3c24xx/
> > [PATCH 10/12] ARM: S3C2440: move mach-s3c2440/* into mach-s3c24xx/
> > [PATCH 11/12] ARM: S3C2443: move mach-s3c2443/* into mach-s3c24xx/
> could we move this forward please? :-)
>=20
> As indicated by Olof's mail for tegra, we are near the 3.4 merge wind=
ow
> and as
> is known everything must be in linux-next beforehand.
>=20
> In my opinion it should also be possible to postpone the plat-s3c24xx
> cleanup
> for now and just bring this set on the road to reach 3.4.
>=20
OK, I agree and let me move this into my -next, I think plat-s3c24xx cl=
eanup
can be done soon though.

As a note, I will send this to arm-soc tree after couple of days for te=
sting
this in linux-next.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
