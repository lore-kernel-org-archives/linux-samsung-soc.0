From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/9] ARM: S3C24XX: rework irq handling for a later dt
 usage
Date: Fri, 25 Jan 2013 10:59:18 -0800
Message-ID: <016101cdfb2e$15cbd640$416382c0$@samsung.com>
References: <201301190403.50317.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18019 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755991Ab3AYS7l convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 13:59:41 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH7004B83FFMFG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:59:40 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700KSG3FDGN90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:59:39 +0900 (KST)
In-reply-to: <201301190403.50317.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> Third version of redoing the s3c24xx irqs in a generic way by using a
> declarative approach.
>=20
> Main change is the different approach to the init. Moved the
> s3c24xx_init_intc function from the dt patchset here, so that both in=
it types
> (dt and non-dt) can use a similar init scheme.
>=20
> As in the second version, the 1st patch might be hard to read due to =
the
> rewrite character, but I didn't see a way to do these changes in indi=
vidual
> steps. So it might be helpful to look at the result after applying th=
is patch.
>=20
> Runtime-tested on a s3c2416 based board and compile tested for the ot=
hers.
>=20
> As also written before, inclusion of the other S3C24XX SoCs to follow=
 once
> the general approach is acceptable.
>=20
> Applies to the most current for-next (from two hours ago) from linux-
> samsung
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
>  arch/arm/plat-s3c24xx/irq.c                  | 1110 +++++++++++++++-=
----------
>  arch/arm/plat-samsung/include/plat/pm.h      |    6 -
>  arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
>  arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
>  17 files changed, 688 insertions(+), 1132 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c
>=20
> --
> 1.7.2.3

Heiko, looks good to me :-)
BTW, can you rebase this against on next/cleanup-s3c24xx branch in my t=
ree?

Thanks.

- Kukjin
