From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: remove plat-samsung/irq.h
Date: Tue, 12 Feb 2013 15:25:22 -0800
Message-ID: <1dc701ce0978$3c127090$b43751b0$@samsung.com>
References: <201302122042.32471.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10087 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751610Ab3BLXZo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 18:25:44 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI400C8TRQ69F20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 08:25:42 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI400GJFRQSKT70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 08:25:42 +0900 (KST)
In-reply-to: <201302122042.32471.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=C3=BCbner wrote:
>=20
> plat-samsung/irq.h did only contain functions for handling the spread=
 out
> subirqs on s3c24xx arches, which are not needed anymore.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Sorry for bringing this separate submission, but I just remembered
> it this evening.
>=20
> This applies on top of all the other s3c24xx irq changes and
> I think this patch will mark the end of the irq-cleanup for now.
>=20
>  arch/arm/mach-s3c24xx/irq-pm.c           |    7 ++-
>  arch/arm/mach-s3c24xx/irq.c              |    8 +--
>  arch/arm/plat-samsung/include/plat/irq.h |  116 --------------------=
----------
>  3 files changed, 9 insertions(+), 122 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/irq.h
>=20
Applied, thanks :-)

- Kukjin
