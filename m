From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and
 warning fix
Date: Sun, 13 Oct 2013 20:26:42 +0530
Message-ID: <20131013145642.GJ2954@intel.com>
References: <201310111059.19791.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:12864 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752617Ab3JMPta (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 11:49:30 -0400
Content-Disposition: inline
In-Reply-To: <201310111059.19791.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Fri, Oct 11, 2013 at 10:59:19AM +0200, Heiko St=FCbner wrote:
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
Do you want this to be applied thru dma or arm tree?

~Vinod
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
>=20
> --=20
> 1.7.10.4
>=20

--=20
