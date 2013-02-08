From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: S3C24XX: make s3c24XX.h header content local
Date: Fri, 08 Feb 2013 14:42:01 -0800
Message-ID: <1a5701ce064d$840dd2f0$8c2978d0$@samsung.com>
References: <201302072249.04263.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31743 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760359Ab3BHWmS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:42:18 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX004ZIB2HJFC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:42:17 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00G94B2F7V60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:42:17 +0900 (KST)
In-reply-to: <201302072249.04263.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> This series moves the contents of the plat/s3c24XX.h headers into
> common.h, as their content does not need to be global anymore, now th=
at
> everything lives in mach-s3c24xx.
>=20
> Heiko Stuebner (2):
>   ARM: S3C24XX: move plat-samsung/s3c24XX headers to local common.h
>   ARM: S3C24XX: cleanup the included soc init functions in common.h
>=20
>  arch/arm/mach-s3c24xx/clock-s3c2410.c        |    1 -
>  arch/arm/mach-s3c24xx/clock-s3c2412.c        |    1 -
>  arch/arm/mach-s3c24xx/clock-s3c2416.c        |    1 -
>  arch/arm/mach-s3c24xx/clock-s3c2443.c        |    1 -
>  arch/arm/mach-s3c24xx/common.c               |    7 +--
>  arch/arm/mach-s3c24xx/common.h               |   90
> +++++++++++++++++++++++++-
>  arch/arm/mach-s3c24xx/mach-jive.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-n30.c             |    1 -
>  arch/arm/mach-s3c24xx/mach-nexcoder.c        |    2 -
>  arch/arm/mach-s3c24xx/mach-otom.c            |    1 -
>  arch/arm/mach-s3c24xx/mach-smdk2413.c        |    4 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c        |    3 +-
>  arch/arm/mach-s3c24xx/mach-smdk2440.c        |    2 -
>  arch/arm/mach-s3c24xx/mach-smdk2443.c        |    4 +-
>  arch/arm/mach-s3c24xx/mach-vstms.c           |    4 +-
>  arch/arm/mach-s3c24xx/pm-s3c2412.c           |    1 -
>  arch/arm/mach-s3c24xx/s3c2410.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c2412.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c2416.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c2440.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c2442.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c2443.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c244x.c              |    2 -
>  arch/arm/plat-samsung/include/plat/s3c2410.h |   31 ---------
>  arch/arm/plat-samsung/include/plat/s3c2412.h |   32 ---------
>  arch/arm/plat-samsung/include/plat/s3c2416.h |   37 -----------
>  arch/arm/plat-samsung/include/plat/s3c2443.h |   36 ----------
>  arch/arm/plat-samsung/include/plat/s3c244x.h |   42 ------------
>  28 files changed, 99 insertions(+), 212 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2410.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2412.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2416.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2443.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c244x.h
>=20
> --

Yeah, looks good to me, applied this series.

Thanks.

- Kukjin
