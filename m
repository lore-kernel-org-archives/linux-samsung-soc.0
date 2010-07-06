From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on S5PV210/S5PC110.
Date: Wed, 07 Jul 2010 08:29:38 +0900
Message-ID: <013101cb1d63$1c8cd2f0$55a678d0$%kim@samsung.com>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
 <4C330916.1070201@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19242 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754861Ab0GFX3h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 19:29:37 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L55000ZZT9ADZ70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 08:29:34 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5500EMRT99KM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 08:29:34 +0900 (KST)
In-reply-to: <4C330916.1070201@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Sergei Shtylyov wrote:

> 
> Hello.

Hi :-)
> 
> Kukjin Kim wrote:
> 
> > This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5PC110.
> > Because smallest size of a bank on S5PV210/S5PC110 is aligned by 16MB.
> > So each section's maximum size should be 16MB.
> 
> > Reported-by: Kyongho Cho <pullip.cho@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-s5pv210/include/mach/memory.h |    8 ++++++--
> >  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> > diff --git a/arch/arm/mach-s5pv210/include/mach/memory.h
b/arch/arm/mach-
> s5pv210/include/mach/memory.h
> > index 379117e..4a372d8 100644
> > --- a/arch/arm/mach-s5pv210/include/mach/memory.h
> > +++ b/arch/arm/mach-s5pv210/include/mach/memory.h
> > @@ -16,8 +16,12 @@
> >  #define PHYS_OFFSET		UL(0x20000000)
> >  #define CONSISTENT_DMA_SIZE	(SZ_8M + SZ_4M + SZ_2M)
> >
> > -/* Maximum of 256MiB in one bank */
> > +/* Sparsemem support. Each section is a maximum of 16MB.
> > + * Because there are many different memory type on S5PC110(MCP),
> > + * and there is a case that having 80MB, 128MB or 256MB in one
> > + * bank.
> > +*/
> 
>     According to CodingStyle, the prefrerrable format for multi-line
comments
> is this:
> 
> /*
>   * bla
>   * bla
>   */
> 
Oh, ok..will modify.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
