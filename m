From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: Fix the S3C24XX_VA_GPIO mapping
Date: Fri, 22 Oct 2010 10:41:25 +0900
Message-ID: <007701cb718a$3f732f50$be598df0$%kim@samsung.com>
References: <1287581622-8335-1-git-send-email-kgene.kim@samsung.com>
 <4CC0BDEA.8090407@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53183 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751332Ab0JVBlI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 21:41:08 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAO00C8A4OIR4C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 10:41:06 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAO009SM4OH6D@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 10:41:06 +0900 (KST)
In-reply-to: <4CC0BDEA.8090407@fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Ben Dooks wrote:
> 
> On 20/10/10 14:33, Kukjin Kim wrote:
> > This patch changes the S3C24XX_VA_GPIO for to fix following BUG.
> > BUG: not creating mapping for 0x56000000 at 0x01000000 in user region
> >
> > It is due to commit 8fecfe9d(ARM: SAMSUNG: Move the start address of
> > Samsung SoCs' VA space) which changes S3C_ADDR_BASE from 0xF4000000
> > to 0xFA000000.
> >
> > Reported-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > ---
> >  arch/arm/plat-s3c24xx/include/plat/map.h |   14 +++-----------
> >  1 files changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm/plat-s3c24xx/include/plat/map.h b/arch/arm/plat-
> s3c24xx/include/plat/map.h
> > index bd534d3..771491e 100644
> > --- a/arch/arm/plat-s3c24xx/include/plat/map.h
> > +++ b/arch/arm/plat-s3c24xx/include/plat/map.h
> > @@ -61,17 +61,9 @@
> >
> >  /* GPIO ports */
> >
> > -/* the calculation for the VA of this must ensure that
> > - * it is the same distance apart from the UART in the
> > - * phsyical address space, as the initial mapping for the IO
> > - * is done as a 1:1 mapping. This puts it (currently) at
> > - * 0xFA800000, which is not in the way of any current mapping
> > - * by the base system.
> > -*/
> 
> This comment is really important, and it is possible this will
> break some of the s3c24xx platforms duing the boot process as
> there can be problems during the changes of mmu when booting.
> 
Hi Ben,

I understand, thanks for your pointing out.
Firstly, will drop this..and update other regarding patch.

I think, we need to sort VA mapping out later ;-)

> > -#define S3C2410_PA_GPIO	   (0x56000000)
> > -#define S3C24XX_VA_GPIO	   ((S3C24XX_PA_GPIO - S3C24XX_PA_UART) +
> S3C24XX_VA_UART)
> > -#define S3C24XX_SZ_GPIO	   SZ_1M
> > +#define S3C2410_PA_GPIO		(0x56000000)
> > +#define S3C24XX_VA_GPIO		S3C2410_ADDR(0x00F00000)
> > +#define S3C24XX_SZ_GPIO		SZ_1M
> >
> >
> >  /* ISA style IO, for each machine to sort out mappings for, if it

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
