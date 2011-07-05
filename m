From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 05 Jul 2011 16:05:32 +0900
Message-ID: <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <201107041859.11548.heiko@sntech.de>
 <20110704170217.GH28042@ponder.secretlab.ca>
 <201107042151.44075.heiko@sntech.de>
 <20110704232758.GB12824@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65142 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753815Ab1GEHFy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:05:54 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNU007WWMDC2RO0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:05:39 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNU00526MDER5@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:05:39 +0900 (KST)
In-reply-to: <20110704232758.GB12824@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Boojin Kim' <boojin.kim@samsung.com>

Grant Likely wrote:
>=20
> On Mon, Jul 04, 2011 at 09:51:43PM +0200, Heiko St=FCbner wrote:
> > Am Montag 04 Juli 2011, 19:02:17 schrieb Grant Likely:
> > > On Mon, Jul 04, 2011 at 06:59:11PM +0200, Heiko St=FCbner wrote:
> > > > Am Montag 04 Juli 2011, 18:42:51 schrieb Grant Likely:
> > > > >
> > > > > Wow.  A lot of #ifdefs here.  It does not look multiplatform
friendly
> > > > > at all.  Are the s3c2410_dma functions obsolete when DMADEV_P=
L330
is
> > > > > selected?  If so, can they be removed entirely, or are they
required
> > > > > to support certain hardware?
> > > >
> > > > The spi_s3c64xx driver can also support the SPI controller of t=
he
> > > > S3C2416/S3C2443 line of SoCs.
> > > > As I'm currently working on a S3C2416 based project, my small w=
ish
from
> > > > the sidelines would be to not break this support with whatever
solution
> > > > you will decide on :-) .
> > >
> > > I will not merge a patch that either breaks a platform, or requir=
es
> > > a compile time either/or choice of device support (enabling suppo=
rt
> > > for one device should not break support for another).
> >
> > The patch above seems to contain the support for both SoCs (i.e.
> s3c2410_dma_*
> > for S3C2416 etc), so it wouldn't break the support.
> > But this form will definitly break future multiplatform kernels whe=
n the
2416
> > and some variant using the DMADEV_PL330 are selected at the same ti=
me.
>=20
> Yes, that's the breakage I'm talking about.
>=20
> > The 2416/2443 seem to be the first Samsung-SoCs to have a SPI-contr=
oller
of
> > this type. Implementing the DMA engine stuff for these SoCs would
obviously
> > solve the ifdef-problem but I don't know if this is possible to do.
>=20
> Of course it's possible, it's just software.  :-D
>=20
> If a config option is either/or then it needs to be really well
> justified before I will accept it.  Most either/or options I've seen
> aren't for any strong technical reason other than it was easier to
> code that way.

Hi all,

Yes I know your concerns on this.

=46irst of all, please see below which is block diagram of Samsung DMA =
usage
and 1st step will be finished with other patches for S5PC100 and S5PV21=
0
soon. Basically we need more time maybe 2 or 3 days to test on boards.

+---------------------------------------------------------------------+
| Each drivers which uses DMA                                         |
+---------------------------------------------------------------------+
| S3C DMA API (such as s3c2410_dma_xxxx)                              |
+-------------------------------+-------------------------------------+
| PL080 DMA driver              | S3C PL330 DMA API driver            |
| for S3C24XX and S3C64XX       | (arch/arm/plat-samsung/s3c-pl330.c) |
|                               +-------------------------------------+
| (arch/arm/plat-s3c24xx/dma.c) | Common DMA core driver              |
| (arch/arm/mach-s3c64xx/dma.c) | (arch/arm/common/pl330.c)           |
+-------------------------------+-------------------------------------+
                               ||
          (1st step. removing S3C DMA API for PL330)
                               ||
                               \/
+---------------------------------------------------------------------+
| Each drivers which uses DMA                                         |
+-------------------------------+-------------------------------------+
| S3C DMA API(s3c2410_dma_xxx)  | DMA generic API for PL330           |
+-------------------------------+-------------------------------------+
| PL080 DMA driver              | PL330 DMA API driver                |
| for S3C24XX and S3C64XX       | (drivers/dma/pl330.c)               |
|                               +-------------------------------------+
| (arch/arm/plat-s3c24xx/dma.c) | Common DMA core driver              |
| (arch/arm/mach-s3c64xx/dma.c) | (arch/arm/common/pl330.c)           |
+-------------------------------+-------------------------------------+

As you saw, the S3C_DMA_API is still used for PL080 DMA for compatibili=
ties
with this patches in each driver, e.g., spi and audio. As a note, S3C24=
XX
and S3C64XX include PL080 DMAC not PL330.

Of course, if we can remove every S3C_DMA_API, that can be the best sol=
ution
but it needs more time. I'd like to go to our goal step by step.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
