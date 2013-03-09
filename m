From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5] ARM: S3C24XX: more fixes and enhancements for the
 s3c24xx irqs
Date: Sat, 09 Mar 2013 18:14:28 +0900
Message-ID: <042901ce1ca6$8054e800$80feb800$%kim@samsung.com>
References: <201302262357.24544.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10574 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757467Ab3CIJOa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Mar 2013 04:14:30 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJD00B41Z01T140@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Mar 2013 18:14:28 +0900 (KST)
In-reply-to: <201302262357.24544.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: 'Julia Lawall' <julia.lawall@lip6.fr>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=C3=BCbner wrote:
>=20
> Asorted fixes and enhancements for the recent redo of the s3c24xx
> interrupt controllers.
>=20
> The only real error that gets fixed is the handling of 0-hwirq as
> parent_irq on s3c2412 in patch 2. No other of the s3c24xx platforms
> uses the bit0 of the parent controller as parent_irq.
>=20
> Heiko Stuebner (5):
>   ARM: S3C24XX: fix redundant checks in the irq mapping function
>   ARM: S3C24XX: fix irq parent check
>   ARM: S3C24XX: move s3c24xx_init_irq to s3c2410_init_irq
>   ARM: S3C24XX: make s3c24xx_init_intc static
>   ARM: S3C24XX: add handle_irq function
>=20
>  arch/arm/Kconfig                                 |    1 +
>  arch/arm/mach-s3c24xx/common.h                   |    1 +
>  arch/arm/mach-s3c24xx/include/mach/entry-macro.S |   70 ---------
>  arch/arm/mach-s3c24xx/irq.c                      |  167 ++++++++++++=
+--------
>  arch/arm/mach-s3c24xx/mach-amlm5900.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-bast.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-h1940.c               |    7 +-
>  arch/arm/mach-s3c24xx/mach-n30.c                 |    4 +-
>  arch/arm/mach-s3c24xx/mach-otom.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-qt2410.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2410.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-tct_hammer.c          |    2 +-
>  arch/arm/mach-s3c24xx/mach-vr1000.c              |    2 +-
>  arch/arm/plat-samsung/include/plat/cpu.h         |    1 -
>  14 files changed, 115 insertions(+), 150 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/entry-macro.S
>=20
> --
> 1.7.2.3

Looks good to me, applied.

Thanks.

- Kukjin
