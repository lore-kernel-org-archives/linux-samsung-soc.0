From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and warning fix
Date: Sun, 13 Oct 2013 20:11:10 +0200
Message-ID: <201310132011.11285.heiko@sntech.de>
References: <201310111059.19791.heiko@sntech.de> <20131013145642.GJ2954@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:49595 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754880Ab3JMSLX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 14:11:23 -0400
In-Reply-To: <20131013145642.GJ2954@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Am Sonntag, 13. Oktober 2013, 16:56:42 schrieb Vinod Koul:
> On Fri, Oct 11, 2013 at 10:59:19AM +0200, Heiko St=FCbner wrote:
> > [I messed up the linux-arm-kernel list address yesterday, so I rese=
nd it
> > with a fixed address, sorry for the noise]
> >=20
> > When Olof reported the warning about the unused s3c2410_dma_resourc=
e, I
> > thought the best way forward would be to simply implement the missi=
ng
> > pieces and so it has users :-) .
> >=20
> > Therefore this series adds the necessary platform-devices for s3c24=
10,
> > s3c2440 and s3c2442. This especially also includes the
> > channel-constraints of those socs.
> >=20
> > As I do not have access to any of those socs these changes are of c=
ourse
> > compile-tested only.
>=20
> Do you want this to be applied thru dma or arm tree?

hmm, the original series went into the samsung tree for 3.13, so maybe =
this=20
addition should go the same way?


Heiko


> ~Vinod
>=20
> > Heiko Stuebner (3):
> >   ARM: S3C24XX: Fix possible dma selection warning
> >   dmaengine: s3c24xx-dma: add support for the s3c2410 type of contr=
oller
> >   ARM: S3C24XX: add dma platformdata for s3c2410, s3c2440 and s3c24=
42
> > =20
> >  arch/arm/mach-s3c24xx/Kconfig             |    3 +-
> >  arch/arm/mach-s3c24xx/common.c            |  100
> >  +++++++++++++++++++++++++++++ arch/arm/mach-s3c24xx/common.h      =
    =20
> >  |    2 +
> >  drivers/dma/s3c24xx-dma.c                 |   10 +++
> >  include/linux/platform_data/dma-s3c24xx.h |    3 +
> >  sound/soc/samsung/Kconfig                 |    2 +-
> >  6 files changed, 118 insertions(+), 2 deletions(-)
