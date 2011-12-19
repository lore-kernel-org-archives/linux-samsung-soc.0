From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: restart: move SWRST based S3C platforms to
 machine_desc hook
Date: Mon, 19 Dec 2011 21:42:24 +0900
Message-ID: <03de01ccbe4b$a8a5bb00$f9f13100$%kim@samsung.com>
References: <03dc01ccbe45$80633d30$8129b790$%kim@samsung.com>
 <201112191312.34546.heiko@sntech.de>
 <03dd01ccbe48$88ed7d50$9ac877f0$%kim@samsung.com>
 <201112191325.56090.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60763 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866Ab1LSMm2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 07:42:28 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWG00BM2BALBTV0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Dec 2011 21:42:26 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWG003LSBAOPF50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 19 Dec 2011 21:42:26 +0900 (KST)
In-reply-to: <201112191325.56090.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, rmk+kernel@arm.linux.org.uk

Heiko St=FCbner wrote:

>=20
> S3C2412/S3C2416/S3C2443 use a special register to signal the reset to
> the processor and used therefore the s3c24xx_reset_hook mechanism in =
the
> s3c24xx-specific arch reset.
>=20
> This patch introduces restart functions for these architectures,
> moves the board files to them and removes the s3c24xx_reset_hook
> infrastructure, as all users are gone.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> @Kgene: This is my first cleanup step, done before your s3c64xx mail
> arrived,
> which transforms the 2412,2416 and 2443 arches which use the special =
SWRST
> register to do the reset. Just if it helps :-)
>=20
Heiko, thanks.

I'm looking at S5P SoCs now and of course this helps. And if possible, =
let
me do it with this.

As a note, we need to implement local header file before using new rest=
art
hook and I'm thinking which one is better to us between all s3c24xx SoC=
s'
common or each mach-s3c24xx's one.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


>  arch/arm/mach-s3c2410/include/mach/reset.h        |   22
-------------------
> --
>  arch/arm/mach-s3c2410/include/mach/system-reset.h |    5 ----
>  arch/arm/mach-s3c2410/include/mach/system.h       |    2 -
>  arch/arm/mach-s3c2412/mach-jive.c                 |    2 +
>  arch/arm/mach-s3c2412/mach-smdk2413.c             |    3 ++
>  arch/arm/mach-s3c2412/mach-vstms.c                |    1 +
>  arch/arm/mach-s3c2412/s3c2412.c                   |   10 +++-----
>  arch/arm/mach-s3c2416/mach-smdk2416.c             |    1 +
>  arch/arm/mach-s3c2416/s3c2416.c                   |    7 +++--
>  arch/arm/mach-s3c2443/mach-smdk2443.c             |    1 +
>  arch/arm/mach-s3c2443/s3c2443.c                   |    8 +++---
>  arch/arm/plat-samsung/include/plat/s3c2412.h      |    3 ++
>  arch/arm/plat-samsung/include/plat/s3c2416.h      |    2 +
>  arch/arm/plat-samsung/include/plat/s3c2443.h      |    2 +
>  14 files changed, 27 insertions(+), 42 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c2410/include/mach/reset.h
