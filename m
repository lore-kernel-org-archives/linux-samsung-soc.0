From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] Remove hw_addr dma leftovers from S3C24xx machs
Date: Fri, 19 Aug 2011 14:24:09 +0900
Message-ID: <000301cc5e30$39f12d50$add387f0$%kim@samsung.com>
References: <201108101227.32780.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63948 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752349Ab1HSFYM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:24:12 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ500CI6TNXX0L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:11 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ500KA7TOA6V@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:11 +0900 (KST)
In-reply-to: <201108101227.32780.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> While trying to sort the dma for S3C2416 I stumbled open the hw_addr
> declarations in the other dma.c files.
>=20
> It took me a while to figure out that they seem to be some sort
> of leftover, i.e. they are used in dma-pl080.c of the old Samsung
> kernels based on 2.6.21 but nowhere in current kernels.
>=20
> Therefore I think removing this stuff is appropriate.
>=20
> The patches apply against current linux-next and are
> compile-tested against s3c2410_defconfig and mini2440_defconfig.
>=20
> Heiko Stuebner (2):
>   Remove hw_addr from s3c24XX dma channel declarations
>   Remove s3c24xx_dma_addr definition
>=20
>  arch/arm/mach-s3c2410/dma.c                      |   14 -----------
>  arch/arm/mach-s3c2412/dma.c                      |   18 ------------=
--
>  arch/arm/mach-s3c2440/dma.c                      |   17 ------------=
-
>  arch/arm/mach-s3c2443/dma.c                      |   27
----------------------
>  arch/arm/plat-samsung/include/plat/dma-s3c24xx.h |    6 -----
>  5 files changed, 0 insertions(+), 82 deletions(-)
>=20
> --
> 1.7.5.4

Good :)
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
