From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: SAMSUNG: Fix compilation error
Date: Wed, 08 Aug 2012 09:38:08 +0900
Message-ID: <0a1e01cd74fe$14ecc970$3ec65c50$%kim@samsung.com>
References: <1340165950-8996-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23479 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523Ab2HHAiK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 20:38:10 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8E008W3V18GC80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 09:38:08 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8E000YCV3KIR40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 09:38:08 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Kukjin Kim wrote:
>=20
> Sachin Kamat wrote:
> >
> > Fixes the following build error:
> > In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
> >                  from arch/arm/plat-samsung/include/plat/dma-ops.h:=
17,
> >                  from arch/arm/plat-samsung/include/plat/dma.h:128,
> >                  from sound/soc/samsung/pcm.c:23:
> > arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8: error:
> redefinition
> > of =E2=80=98struct s3c2410_dma_client=E2=80=99
> > arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally def=
ined
> > here
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  arch/arm/plat-samsung/include/plat/dma.h |    5 +----
> >  1 files changed, 1 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/pl=
at-
> > samsung/include/plat/dma.h
> > index 7b02143..fdf34bc 100644
> > --- a/arch/arm/plat-samsung/include/plat/dma.h
> > +++ b/arch/arm/plat-samsung/include/plat/dma.h
> > @@ -37,10 +37,7 @@ enum s3c2410_chan_op {
> >  	S3C2410_DMAOP_STARTED,		/* indicate channel started */
> >  };
> >
> > -struct s3c2410_dma_client {
> > -	char                *name;
> > -};
> > -
> > +struct s3c2410_dma_client;
> >  struct s3c2410_dma_chan;
> >  enum dma_ch;
> >
> > --
> > 1.7.4.1
>=20
> Applied, thanks.
>=20
Oops, this brings following error :(

drivers/spi/spi-s3c64xx.c:205: error: variable 's3c64xx_spi_dma_client'=
 has initializer but incomplete type
drivers/spi/spi-s3c64xx.c:206: error: unknown field 'name' specified in=
 initializer
drivers/spi/spi-s3c64xx.c:206: warning: excess elements in struct initi=
alizer
drivers/spi/spi-s3c64xx.c:206: warning: (near initialization for 's3c64=
xx_spi_dma_client')

As you know, the 'struct s3c2410_dma_client' is defined at the <plat/dm=
a-pl330.h>  after applying this patch but S3C24XX and S3C64XX are not i=
ncluding 'plat/dma-pl330.h' so above error happened.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
