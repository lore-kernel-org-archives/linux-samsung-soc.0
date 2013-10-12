From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Sat, 12 Oct 2013 06:38:50 +0200
Message-ID: <3315189.7g6koLM0p3@amdn883>
References: <201310111059.19791.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24673 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705Ab3JLEiy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Oct 2013 00:38:54 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUJ0037EGWJCHB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Oct 2013 05:38:52 +0100 (BST)
In-reply-to: <201310111059.19791.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Olof Johansson <olof@lixom.net>

Hi Heiko,

[Resending, due to my e-mail client enabling HTML formatting.
Sorry for the noise.]

On Friday 11 of October 2013 10:59:19 Heiko St=FCbner wrote:
> [I messed up the linux-arm-kernel list address yesterday, so I resend=
 it
> with a fixed address, sorry for the noise]
>=20
> When Olof reported the warning about the unused s3c2410_dma_resource,=
 I
> thought the best way forward would be to simply implement the missing
> pieces and so it has users :-) .
>=20
> Therefore this series adds the necessary platform-devices for s3c2410=
,
> s3c2440 and s3c2442. This especially also includes the channel-constr=
aints
> of those socs.
>=20
> As I do not have access to any of those socs these changes are of cou=
rse
> compile-tested only.
>=20
> Heiko Stuebner (3):
>   ARM: S3C24XX: Fix possible dma selection warning
>   dmaengine: s3c24xx-dma: add support for the s3c2410 type of control=
ler
>   ARM: S3C24XX: add dma platformdata for s3c2410, s3c2440 and s3c2442
>=20
>  arch/arm/mach-s3c24xx/Kconfig             |    3 +-
>  arch/arm/mach-s3c24xx/common.c            |  100 +++++++++++++++++++=
++++++++++
>  arch/arm/mach-s3c24xx/common.h            |    2 +
>  drivers/dma/s3c24xx-dma.c                 |   10 +++
>  include/linux/platform_data/dma-s3c24xx.h |    3 +
>  sound/soc/samsung/Kconfig                 |    2 +-
>  6 files changed, 118 insertions(+), 2 deletions(-)

Big thanks for this series and the one adding DMA engine support for
S3C24xx. It would be great if someone could test this on affected
platforms, so we could finally drop the old S3C-DMA nonsense.

Anyway, for the whole series

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
