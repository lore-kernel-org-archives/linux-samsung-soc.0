From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] ARM: S3C24XX: Move the DMA base code to mach-s3c24xx
Date: Wed, 22 Feb 2012 17:21:41 +0000
Message-ID: <201202221721.41262.arnd@arndb.de>
References: <201202212221.41744.heiko@sntech.de> <201202212226.57559.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:49263 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753666Ab2BVRVu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:21:50 -0500
In-Reply-To: <201202212226.57559.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>

On Tuesday 21 February 2012, Heiko St=FCbner wrote:
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/Kconfig  |   18 +
>  arch/arm/mach-s3c24xx/Makefile |    1 +
>  arch/arm/mach-s3c24xx/dma.c    | 1469 ++++++++++++++++++++++++++++++=
++++++++++
>  arch/arm/plat-s3c24xx/Kconfig  |   16 -
>  arch/arm/plat-s3c24xx/Makefile |    1 -
>  arch/arm/plat-s3c24xx/dma.c    | 1469 ------------------------------=
----------
>  6 files changed, 1488 insertions(+), 1486 deletions(-)
>  create mode 100644 arch/arm/mach-s3c24xx/dma.c
>  delete mode 100644 arch/arm/plat-s3c24xx/dma.c
>=20

Wouldn't it be more appropriate to move this driver to
drivers/dma/s3c24xx-dma.c instead?=20

Even if it doesn't (yet) use the dmaengine API, I think it's
valuable to keep drivers with the same purpose together. We have
had similar discussions in other subsystems and ended up moving
the drivers into one directory first, followed by a conversion
to a common API (if someone could be motivated to do that work).

	Arnd
