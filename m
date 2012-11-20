From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/10] ARM: S3C24XX: rework irq handling for a later dt
 usage
Date: Tue, 20 Nov 2012 20:51:54 +0900
Message-ID: <0c8b01cdc715$6feff590$4fcfe0b0$%kim@samsung.com>
References: <201211180151.01029.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53000 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752492Ab2KTLv4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 06:51:56 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS00M1MBMHS101@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 20:51:55 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00K5PBMISU90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 20:51:54 +0900 (KST)
In-reply-to: <201211180151.01029.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> All S3C24XX arches share the same interrupt registers and basic handl=
ing
> principles but the individual interrupts differ quite a lot between a=
ll
> the arches.
>=20
> This series therefore tries to unify this a bit by abstracting the ir=
q
> handling and enabling the arches to simply provide a structure descri=
bing
> its individual interrupts.
>=20
> With this declarative approach it should also be (hopefully) easy to
> move this to devicetree later.
>=20
> For the initial transformation (in patch 1) I gave up on trying to do
> this in individual steps, so the patch might be a bit bumpy to read,
> but the new irq code does provide the exactly same interrupts and
> handlers as the old code. This also means that the unconverted arches
> shouldn't feel any difference at all.
>=20
> I've only included the s3c2416 and s3c2443 interrupts for now, as the
> s3c2416 is my main development platform and the s3c2443 is so very
> similar. But the other arches use the same mechanics so conversion
> should be quite easy later.
>=20
> As it seems to be the policy for drivers/irqchip that drivers there
> should not contain platform-hooks or pollute the namespace with custo=
m
> init functons, the irq code stays in plat-s3c24xx for now.
>=20
> Heiko Stuebner (10):
>   ARM: S3C24XX: transform irq handling into a declarative form
>   ARM: S3C24XX: move irq-pm code into main irq file
>   ARM: S3C24XX: cleanup irq-pm integration
>   ARM: S3C24XX: move s3c2416 irq init to common irq code
>   ARM: S3C24XX: modify s3c2416 irq init to initialize all irqs
>   ARM: S3C24XX: assimilate s3c2416 subirqs into new structure
>   ARM: S3C24XX: assimilate second s3c2416 interrupt into new structur=
e
>   ARM: S3C24XX: move s3c2443 irq code to irq.c
>   ARM: S3C24XX: modify s3c2443 irq init to initialize all irqs
>   ARM: S3C24XX: assimilate s3c2443 subirqs into new structure
>=20
>  arch/arm/mach-s3c24xx/Makefile               |    6 +-
>  arch/arm/mach-s3c24xx/common.h               |    2 +
>  arch/arm/mach-s3c24xx/irq-pm.c               |   95 ---
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
>  arch/arm/plat-s3c24xx/irq.c                  | 1140 ++++++++++++++++=
---------
> -
>  arch/arm/plat-samsung/include/plat/pm.h      |    6 -
>  arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
>  arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
>  17 files changed, 737 insertions(+), 1169 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-pm.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c
>=20
> --
> 1.7.2.3

Good job, but I need more time to look at this whole series...I will tr=
y to do before this weekend ;-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
