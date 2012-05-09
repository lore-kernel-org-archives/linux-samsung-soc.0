From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] ARM: S3C24XX: move some code from plat to mach
 directory
Date: Wed, 09 May 2012 21:44:00 +0900
Message-ID: <01af01cd2de1$6812da90$38388fb0$%kim@samsung.com>
References: <201205082034.50658.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45204 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549Ab2EIMoC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 08:44:02 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R000H2A11N630@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:44:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R008OSA1BE440@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:44:00 +0900 (KST)
In-reply-to: <201205082034.50658.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> Again the series of small moves of common code from the plat-s3c24xx =
to
> the
> mach-s3c24xx directory.
>=20
> This time without the wrong handled irq.c . Hopefully I'll get time t=
o do
> it
> properly later.
>=20
> As the dev-uart.c move breaks the resource patch by Tushar Behera, I
> updated
> the patch to fix the correct code and will submit it as a v2 to the
> resource
> series.
>=20
> Heiko Stuebner (4):
>   ARM: S3C24XX: move plat-s3c24xx/cpu.c
>   ARM: S3C24XX: move plat-s3c24xx/dev-uart.c into common.c
>   ARM: S3C24XX: move common power-management code to mach-s3c24xx
>   ARM: S3C24XX: move common clock init into common.c
>=20
>  arch/arm/mach-s3c24xx/Makefile                     |    6 +
>  .../{plat-s3c24xx/cpu.c =3D> mach-s3c24xx/common.c}  |   93
> ++++++++++++++++++-
>  arch/arm/{plat-s3c24xx =3D> mach-s3c24xx}/irq-pm.c   |    0
>  arch/arm/{plat-s3c24xx =3D> mach-s3c24xx}/pm.c       |    0
>  arch/arm/{plat-s3c24xx =3D> mach-s3c24xx}/sleep.S    |    0
>  arch/arm/plat-s3c24xx/Makefile                     |    6 -
>  arch/arm/plat-s3c24xx/clock.c                      |   59 ----------=
--
>  arch/arm/plat-s3c24xx/dev-uart.c                   |  100 ----------=
----------
>  8 files changed, 98 insertions(+), 166 deletions(-)
>  rename arch/arm/{plat-s3c24xx/cpu.c =3D> mach-s3c24xx/common.c} (75%=
)
>  rename arch/arm/{plat-s3c24xx =3D> mach-s3c24xx}/irq-pm.c (100%)
>  rename arch/arm/{plat-s3c24xx =3D> mach-s3c24xx}/pm.c (100%)
>  rename arch/arm/{plat-s3c24xx =3D> mach-s3c24xx}/sleep.S (100%)
>  delete mode 100644 arch/arm/plat-s3c24xx/clock.c
>  delete mode 100644 arch/arm/plat-s3c24xx/dev-uart.c
>=20
> --
> 1.7.5.4

Thanks for your re-posting.
Looks better. Will apply this series instead.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
