From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 5 Jul 2011 16:46:47 +0530
Message-ID: <CABb+yY3UqrbBNS1J1X1gCxPLp8Kv8JSe92Pnb7JpE9x9kqTPiA@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<201107041859.11548.heiko@sntech.de>
	<20110704170217.GH28042@ponder.secretlab.ca>
	<201107042151.44075.heiko@sntech.de>
	<20110704232758.GB12824@ponder.secretlab.ca>
	<00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33991 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932110Ab1GELQt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 07:16:49 -0400
Received: by bwd5 with SMTP id 5so4660430bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 04:16:48 -0700 (PDT)
In-Reply-To: <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

On Tue, Jul 5, 2011 at 12:35 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Grant Likely wrote:
>>
>> On Mon, Jul 04, 2011 at 09:51:43PM +0200, Heiko St=C3=BCbner wrote:
>> > Am Montag 04 Juli 2011, 19:02:17 schrieb Grant Likely:
>> > > On Mon, Jul 04, 2011 at 06:59:11PM +0200, Heiko St=C3=BCbner wro=
te:
>> > > > Am Montag 04 Juli 2011, 18:42:51 schrieb Grant Likely:
>> > > > >
>> > > > > Wow. =C2=A0A lot of #ifdefs here. =C2=A0It does not look mul=
tiplatform
> friendly
>> > > > > at all. =C2=A0Are the s3c2410_dma functions obsolete when DM=
ADEV_PL330
> is
>> > > > > selected? =C2=A0If so, can they be removed entirely, or are =
they
> required
>> > > > > to support certain hardware?
>> > > >
>> > > > The spi_s3c64xx driver can also support the SPI controller of =
the
>> > > > S3C2416/S3C2443 line of SoCs.
>> > > > As I'm currently working on a S3C2416 based project, my small =
wish
> from
>> > > > the sidelines would be to not break this support with whatever
> solution
>> > > > you will decide on :-) .
>> > >
>> > > I will not merge a patch that either breaks a platform, or requi=
res
>> > > a compile time either/or choice of device support (enabling supp=
ort
>> > > for one device should not break support for another).
>> >
>> > The patch above seems to contain the support for both SoCs (i.e.
>> s3c2410_dma_*
>> > for S3C2416 etc), so it wouldn't break the support.
>> > But this form will definitly break future multiplatform kernels wh=
en the
> 2416
>> > and some variant using the DMADEV_PL330 are selected at the same t=
ime.
>>
>> Yes, that's the breakage I'm talking about.
>>
>> > The 2416/2443 seem to be the first Samsung-SoCs to have a SPI-cont=
roller
> of
>> > this type. Implementing the DMA engine stuff for these SoCs would
> obviously
>> > solve the ifdef-problem but I don't know if this is possible to do=
=2E
>>
>> Of course it's possible, it's just software. =C2=A0:-D
>>
>> If a config option is either/or then it needs to be really well
>> justified before I will accept it. =C2=A0Most either/or options I've=
 seen
>> aren't for any strong technical reason other than it was easier to
>> code that way.
>
> Hi all,
>
> Yes I know your concerns on this.
>
> First of all, please see below which is block diagram of Samsung DMA =
usage
> and 1st step will be finished with other patches for S5PC100 and S5PV=
210
> soon. Basically we need more time maybe 2 or 3 days to test on boards=
=2E
>
> +--------------------------------------------------------------------=
-+
> | Each drivers which uses DMA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> +--------------------------------------------------------------------=
-+
> | S3C DMA API (such as s3c2410_dma_xxxx) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|
> +-------------------------------+------------------------------------=
-+
> | PL080 DMA driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
S3C PL330 DMA API driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | for S3C24XX and S3C64XX =C2=A0 =C2=A0 =C2=A0 | (arch/arm/plat-samsu=
ng/s3c-pl330.c) |
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +----------------------------------=
---+
> | (arch/arm/plat-s3c24xx/dma.c) | Common DMA core driver =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | (arch/arm/mach-s3c64xx/dma.c) | (arch/arm/common/pl330.c) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1st step. removing S3C DMA API for=
 PL330)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \/
> +--------------------------------------------------------------------=
-+
> | Each drivers which uses DMA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
> | S3C DMA API(s3c2410_dma_xxx) =C2=A0| DMA generic API for PL330 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
> | PL080 DMA driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
PL330 DMA API driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|
> | for S3C24XX and S3C64XX =C2=A0 =C2=A0 =C2=A0 | (drivers/dma/pl330.c=
) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +----------------------------------=
---+
> | (arch/arm/plat-s3c24xx/dma.c) | Common DMA core driver =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | (arch/arm/mach-s3c64xx/dma.c) | (arch/arm/common/pl330.c) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
>
> As you saw, the S3C_DMA_API is still used for PL080 DMA for compatibi=
lities
> with this patches in each driver, e.g., spi and audio. As a note, S3C=
24XX
> and S3C64XX include PL080 DMAC not PL330.
Not exactly.
S3C24XX  use 2-3 different versions of Samsung's DMA implementations.
S3C6400/10  use PL080
S5P and later series use PL330

>
> Of course, if we can remove every S3C_DMA_API, that can be the best s=
olution
> but it needs more time. I'd like to go to our goal step by step.
>
Ideally, like PL330 for S5Pxxxx, drivers/dma/pl080 should be enabled fo=
r s3c64xx
And new generic dma api drivers written for S3C24xx in drivers/dma/

-j
