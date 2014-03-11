From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/2] ARM: SAMSUNG: remove the rest of local uncompress.h
 files
Date: Tue, 11 Mar 2014 10:56:49 +0900
Message-ID: <025401cf3ccd$2a38ee10$7eaaca30$@samsung.com>
References: <6973248.vNO4T7GhE6@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29556 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752567AbaCKB4v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 21:56:51 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N29004CS1EPXXA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Mar 2014 10:56:49 +0900 (KST)
In-reply-to: <6973248.vNO4T7GhE6@phil>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>

Heiko St=FCbner wrote:
>=20
> Two patches from Sachin Kamat already removed the Exynos-uncompress.h=
 .
> But in fact all Samsung platforms can use the generic uncompress code
> without needing local implementation.
>=20
> Therefore this two-part series removes the rest of the uncompress.h f=
iles
> from all Samsung platforms.
>=20
> Tested on a s3c2416 and s3c2442 based machine.
>=20
> The patches should be applied on top of the patches from Sachin Kamat=
 in
> the v3.15-next/cleanup-samsung branch in the linux-samsung.git
>=20
>=20
> Heiko Stuebner (2):
>   ARM: SAMSUNG: use generic uncompress.h
>   ARM: SAMSUNG: remove all custom uncompress.h
>=20
>  arch/arm/Kconfig.debug                          |   4 +-
>  arch/arm/mach-s3c24xx/include/mach/uncompress.h |  57 --------
>  arch/arm/mach-s3c64xx/include/mach/uncompress.h |  31 -----
>  arch/arm/mach-s5p64x0/include/mach/uncompress.h |  34 -----
>  arch/arm/mach-s5pc100/include/mach/uncompress.h |  30 ----
>  arch/arm/mach-s5pv210/include/mach/uncompress.h |  28 ----
>  arch/arm/plat-samsung/include/plat/uncompress.h | 175 --------------=
-----
> -----
>  7 files changed, 2 insertions(+), 357 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/uncompress.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/uncompress.h
>  delete mode 100644 arch/arm/mach-s5p64x0/include/mach/uncompress.h
>  delete mode 100644 arch/arm/mach-s5pc100/include/mach/uncompress.h
>  delete mode 100644 arch/arm/mach-s5pv210/include/mach/uncompress.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/uncompress.h
>=20
> --
> 1.8.5.3

Looks good to me, will apply.

Thanks,
Kukjin
