From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 00/11] ARM: S3C24XX: rework irq handling for a later dt
 usage
Date: Wed, 02 Jan 2013 15:34:36 -0800
Message-ID: <042901cde941$bb8d2d30$32a78790$@samsung.com>
References: <201301012251.15899.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48384 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752711Ab3ABXev convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 18:34:51 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000EMJUTU7A50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 08:34:50 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG0007HTUTZQH10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 08:34:49 +0900 (KST)
In-reply-to: <201301012251.15899.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: ben-linux@fluff.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> Second version of redoing the s3c24xx irqs in a generic way by using =
a
> declarative approach.
>=20
> Changes include further generalizations resulting only in common
> irq-type declarations being needed and thus again easier code.
>=20
> As in the first version, the 1st patch might be hard to read due to t=
he
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
> Heiko Stuebner (11):
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
>   ARM: S3C24XX: remove maskack irq ack funtions
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
>  arch/arm/plat-s3c24xx/irq.c                  | 1092 +++++++++++++++-=
----------
>  arch/arm/plat-samsung/include/plat/pm.h      |    6 -
>  arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
>  arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
>  17 files changed, 649 insertions(+), 1209 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-pm.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
>  delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c
>=20
Hi Heiko,

Happy New Year!

Basically, looks OK but will look at in this weekend :-)

BTW, I have no idea why you want to keep the irq.c in plat-s3c24xx. As =
I said, I'm cleaning up the plat-s3c24xx directory and it will be going=
 away.

- Kukjin
