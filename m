From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/6] S3C24XX: Add support for HSSPI on S3C2416/S3C2443
Date: Mon, 2 Apr 2012 21:25:32 +0200
Message-ID: <201204022125.33629.heiko@sntech.de>
References: <201203121959.32966.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:59872 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751498Ab2DBTZp convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 15:25:45 -0400
In-Reply-To: <201203121959.32966.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Montag 12 M=E4rz 2012, 19:59:32 schrieb Heiko St=FCbner:
> The S3C2416/S3C2443/S3C2450 SoCs contain HSSPI controllers compatible
> with the ones in the S3C64xx and later.
>=20
> The second patch modifying the dma selection depends on the series
> enabling the dma support on the S3C2416, but as the whole s3c64xx-spi
> driver needs dma support this should be ok.
>=20
> Tested on an Asus DR-900 ebook reader with a Marvell MR8686 using the
> libertas driver.
>=20
>=20
> This is a repost of the series adapted to changes resulting from the
> other cleanup series.

ping :-)

Thanks
Heiko

>=20
> Heiko Stuebner (6):
>   ARM: S3C24XX: Add forgotten clock lookup table to S3C2443
>   ARM: S3C24XX: claim spi channels for hsspi in dma-s3c2443
>   ARM: S3C24XX: Add map entries needed by the s3c64xx-spi devices
>   ARM: S3C24XX: Add clock-lookup entries required by s3c64xx-spi
>   ARM: S3C24XX: Add HSSPI setup callback for s3c64xx-spi driver
>   spi/s3c64xx: Allow usage for ARCH_S3C24XX
>=20
>  arch/arm/mach-s3c24xx/Kconfig            |    5 ++++
>  arch/arm/mach-s3c24xx/Makefile           |    1 +
>  arch/arm/mach-s3c24xx/clock-s3c2416.c    |    1 +
>  arch/arm/mach-s3c24xx/clock-s3c2443.c    |    6 ++++
>  arch/arm/mach-s3c24xx/common-s3c2443.c   |   15 +++++++----
>  arch/arm/mach-s3c24xx/dma-s3c2443.c      |   16 +++++++++---
>  arch/arm/mach-s3c24xx/include/mach/dma.h |    4 +++
>  arch/arm/mach-s3c24xx/include/mach/map.h |    5 ++++
>  arch/arm/mach-s3c24xx/setup-spi.c        |   39
> ++++++++++++++++++++++++++++++ drivers/spi/Kconfig                   =
   |=20
>   2 +-
>  10 files changed, 84 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/mach-s3c24xx/setup-spi.c
