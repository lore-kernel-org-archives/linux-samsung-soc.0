From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] ARM: S3C24XX: cleanup debug macro/earlyprintk
Date: Tue, 06 May 2014 13:16:14 +0900
Message-ID: <0cc401cf68e1$eb87f580$c297e080$@samsung.com>
References: <1856986.kkQFKFg1L2@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9292 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757162AbaEFEQR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 00:16:17 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N54008A3X73KKD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 May 2014 13:16:15 +0900 (KST)
In-reply-to: <1856986.kkQFKFg1L2@phil>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Russell King' <linux@arm.linux.org.uk>
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> This series tries to simplify the s3c24xx debug macro, removing
> dependencies
> on mach/ includes, static mappings and finally moving it into
> include/debug.
>=20
I think, it's good way :)

> The one slightly invasive change is the need for the developer to sel=
ect
> the uart type by himself, which gets rid of the debug macro trying to
> determine the uart type itself.
>=20
> But as usage of the debug-uart is not the common case - especially in=
 a
> multiplatform scenario - I didn't worry to much.
>=20
Yeah, I also don't want s3c24xx to support multiplatform in near future=
=2E

> Based on 3.15-rc1 and tested on a S3C2442 Openmoko Freerunner (GTA02)
>=20
> changes since v1:
> - do not introduce a secondary choice option, instead implement the
>   s3c2410 debug uarts as separate options
>=20
> Heiko Stuebner (4):
>   ARM: compressed/head.S: remove s3c24xx special case
>   ARM: S3C24XX: trim down debug uart handling
>   ARM: S3C24XX: use generic DEBUG_UART_PHY/_VIRT in debug macro
>   ARM: S3C24XX: move debug-macro.S into the common space
>=20
>  arch/arm/Kconfig.debug                           |  54 +++++++++++-
>  arch/arm/boot/compressed/head.S                  |   5 --
>  arch/arm/include/debug/s3c24xx.S                 |  46 +++++++++++
>  arch/arm/mach-s3c24xx/Kconfig                    |  28 -------
>  arch/arm/mach-s3c24xx/include/mach/debug-macro.S | 101 -------------=
-----
> -----
>  5 files changed, 98 insertions(+), 136 deletions(-)
>  create mode 100644 arch/arm/include/debug/s3c24xx.S
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/debug-macro.S
>=20
> --
> 1.9.0

Basically I'm OK on this series but need to get review from Russell?

Thanks,
Kukjin
