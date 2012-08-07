From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: S3C24XX: Fix compilation errors with 3.6-rc1
Date: Tue, 07 Aug 2012 19:37:40 +0900
Message-ID: <099001cd7488$ab7c3270$02749750$%kim@samsung.com>
References: <201208051738.27728.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37702 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937Ab2HGKhm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 06:37:42 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8D001GSS6G8U40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Aug 2012 19:37:40 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8D00F68S6SMG40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Aug 2012 19:37:40 +0900 (KST)
In-reply-to: <201208051738.27728.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=C3=BCbner wrote:
>=20
> Small fallout from from the s3c64xx spi changes and from a dma change=
 from
> last year, that only surfaced after a gcc update.
>=20
> Heiko Stuebner (2):
>   ARM: S3C24XX: Add missing DMACH_DT_PROP
>   ARM: S3C24XX: Fix s3c2410_dma_enqueue parameters
>=20
>  arch/arm/mach-s3c24xx/include/mach/dma.h |    3 ++-
>  arch/arm/plat-s3c24xx/dma.c              |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> --
> 1.7.2.3

Applied this series, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
