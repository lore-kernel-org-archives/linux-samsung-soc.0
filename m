From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/9] ARM: S3C24XX: rework irq handling for a later dt
 usage
Date: Tue, 29 Jan 2013 15:40:41 -0800
Message-ID: <072d01cdfe7a$0e14ecd0$2a3ec670$@samsung.com>
References: <201301272124.18530.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11805 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415Ab3A2Xks convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 18:40:48 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHE00MKXV3PRI10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 08:40:47 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHE00A3FV3WFPC0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 08:40:46 +0900 (KST)
In-reply-to: <201301272124.18530.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:=20
>=20
> This v4 does not change any code part. The patches are merely rebased
> to apply to the next/cleanup-s3c24xx branch as requested.
>=20
> Heiko Stuebner (9):
>   ARM: S3C24XX: transform irq handling into a declarative form
>   ARM: S3C24XX: Move irq syscore-ops to irq-pm
>   ARM: S3C24XX: Modify s3c_irq_wake to use the hwirq property
>   ARM: S3C24XX: move s3c2416 irq init to common irq code
>   ARM: S3C24XX: modify s3c2416 irq init to initialize all irqs
>   ARM: S3C24XX: transform s3c2416 irqs into new structure
>   ARM: S3C24XX: move s3c2443 irq code to irq.c
>   ARM: S3C24XX: modify s3c2443 irq init to initialize all irqs
>   ARM: S3C24XX: transform s3c2443 subirqs into new structure
>=20
>  arch/arm/mach-s3c24xx/Makefile               |    4 +-
>  arch/arm/mach-s3c24xx/common.h               |    2 +
>  arch/arm/mach-s3c24xx/irq-pm.c               |   41 +-
>  arch/arm/mach-s3c24xx/irq-s3c2416.c          |  348 --------
>  arch/arm/mach-s3c24xx/irq-s3c2443.c          |  281 -------
>  arch/arm/mach-s3c24xx/mach-smdk2416.c        |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c        |    2 +-
>  arch/arm/mach-s3c24xx/s3c2410.c              |    4 +-
>  arch/arm/mach-s3c24xx/s3c2412.c              |    4 +-
>  arch/arm/mach-s3c24xx/s3c2416.c              |    4 +-
>  arch/arm/mach-s3c24xx/s3c2440.c              |    4 +-
>  arch/arm/mach-s3c24xx/s3c2442.c              |    4 +-
>  arch/arm/plat-s3c24xx/Kconfig                |    1 +
>  arch/arm/plat-s3c24xx/irq.c                  | 1110
+++++++++++++++-----------
>  arch/arm/plat-samsung/include/plat/pm.h      |    6 -
>  arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
>  arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
>  17 files changed, 688 insertions(+), 1132 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c
>=20
> --
> 1.7.10.4

Looks good to me, applied.

Thanks.

- Kukjin
