From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 00/10] ARM: S3C24XX: irq rework for S3C2412,
 S3C2440 and S3C2442
Date: Tue, 12 Feb 2013 11:13:29 -0800
Message-ID: <1d8801ce0955$0bef8600$23ce9200$@samsung.com>
References: <201302091811.05437.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17049 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933695Ab3BLTNu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 14:13:50 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI400DEGG2XVFA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 04:13:49 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI4000UTG2Z3K30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 04:13:49 +0900 (KST)
In-reply-to: <201302091811.05437.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> This series finishes the irq rework by moving the irqs for s3c2412, s=
3c2440
> and s3c2442 into the new structure.
>=20
> Now the only open point is the different handling of the eint0 to ein=
t3
> interrupts on the s3c2412. On this SoC these interrupts are represent=
ed
> in both the main register and the eint register and also need to be h=
andled
> in both.
>=20
> As this should be handlable via the new structure, I'm still investig=
ating
> the right way to do it. Therefore the override of the eint0 to eint3
> interrupts will still remain for a bit.
>=20
> As I lack the relevant hardware, this series is compile tested only, =
but as
> the used mechanisms are the same as with the s3c2416, there shouldn't=
 be
> any complications.
>=20
> This series applies on top of the moved s3c24XX.h headers into the
> common.h
> file in mach-s3c24xx.
>=20
> changes since v1:
> - included the changes for the s3c2412
>=20
> Heiko Stuebner (10):
>   ARM: S3C24XX: move s3c244x irq init to common irq code
>   ARM: S3C24XX: create dedicated irq init functions for s3c2440 and s=
3c2442
>   ARM: S3C24XX: move s3c2440 irqs to common irq code
>   ARM: S3C24XX: integrate s3c2440 irqs into common init
>   ARM: S3C24XX: transform s3c2442 irqs into new structure
>   ARM: S3C24XX: transform s3c2440 irqs into new structure
>   ARM: S3C24XX: use samsung_sync_wakemask in s3c2412 pm
>   ARM: S3C24XX: move s3c2412 irq init to common code
>   ARM: S3C24XX: modify s3c2412 irq init to initialize all irqs
>   ARM: S3C24XX: transform s3c2412 irqs into new structure
>=20
>  arch/arm/mach-s3c24xx/Kconfig          |    1 +
>  arch/arm/mach-s3c24xx/Makefile         |    6 +-
>  arch/arm/mach-s3c24xx/common.h         |    3 +
>  arch/arm/mach-s3c24xx/irq-s3c2412.c    |  215 ----------------------=
-
>  arch/arm/mach-s3c24xx/irq-s3c2440.c    |  128 --------------
>  arch/arm/mach-s3c24xx/irq-s3c244x.c    |  142 ---------------
>  arch/arm/mach-s3c24xx/irq.c            |  299
> ++++++++++++++++++++++++++++++++
>  arch/arm/mach-s3c24xx/mach-anubis.c    |    2 +-
>  arch/arm/mach-s3c24xx/mach-at2440evb.c |    2 +-
>  arch/arm/mach-s3c24xx/mach-gta02.c     |    2 +-
>  arch/arm/mach-s3c24xx/mach-jive.c      |    2 +-
>  arch/arm/mach-s3c24xx/mach-mini2440.c  |    2 +-
>  arch/arm/mach-s3c24xx/mach-nexcoder.c  |    2 +-
>  arch/arm/mach-s3c24xx/mach-osiris.c    |    2 +-
>  arch/arm/mach-s3c24xx/mach-rx1950.c    |    2 +-
>  arch/arm/mach-s3c24xx/mach-rx3715.c    |    7 +-
>  arch/arm/mach-s3c24xx/mach-smdk2413.c  |    6 +-
>  arch/arm/mach-s3c24xx/mach-smdk2440.c  |    2 +-
>  arch/arm/mach-s3c24xx/mach-vstms.c     |    2 +-
>  arch/arm/mach-s3c24xx/pm-s3c2412.c     |    8 +
>  20 files changed, 328 insertions(+), 507 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2412.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2440.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c244x.c
>=20
> --
> 1.7.2.3

Applied, this whole series and integration 2412 eint handling.

Thanks for your time and support.

- Kukjin
