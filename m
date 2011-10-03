From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: SAMSUNG: Cleanup resources by using macro
Date: Mon, 03 Oct 2011 12:27:12 +0900
Message-ID: <005601cc817c$577cdb70$06769250$%kim@samsung.com>
References: <001e01cc80e5$1c9eb150$55dc13f0$%kim@samsung.com>
 <20111002110724.GT11710@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14597 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044Ab1JCD1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 23:27:15 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSH00C3O09CQL90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Oct 2011 12:27:13 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSH00F1W09CE940@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 03 Oct 2011 12:27:13 +0900 (KST)
In-reply-to: <20111002110724.GT11710@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Russell King - ARM Linux wrote:
> 
> On Sun, Oct 02, 2011 at 06:24:40PM +0900, Kukjin Kim wrote:
> > This patch adds macro SAMSUNG_RES_MEM and SAMSUNG_RES_IRQ to
> cleanup
> > regarding 'struct resource'
> 
> Why not include the braces inside the macro as well?
> 
I thought, if other member such as name is required additionally, can add it
like following.

[0] = { SAMSUNG_RES_MEM(xxx, xxx, xxx), .name = "xxx" },

But below helpers can do it :)

> > diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-
> samsung/include/plat/devs.h
> > index 8f19241..8b8bd1c 100644
> > --- a/arch/arm/plat-samsung/include/plat/devs.h
> > +++ b/arch/arm/plat-samsung/include/plat/devs.h
> > @@ -18,6 +18,16 @@
> >
> >  #include <linux/platform_device.h>
> >
> > +#define SAMSUNG_RES_MEM(soc, ip, sz)			\
> > +		.start	= soc##_PA_##ip,		\
> > +		.end	= soc##_PA_##ip + sz - 1,	\
> > +		.flags	= IORESOURCE_MEM,
> > +
> > +#define SAMSUNG_RES_IRQ(ip)				\
> > +		.start	= IRQ_##ip,			\
> > +		.end	= IRQ_##ip,			\
> > +		.flags	= IORESOURCE_IRQ,
> > +
> 
> How about using DEFINE_RES_MEM and DEFINE_RES_IRQ here?
> 
> #define SAMSUNG_RES_MEM(soc, ip, sz) DEFINE_RES_MEM(soc##_PA_##ip,
> sz)
> #define SAMSUNG_RES_IRQ(ip) DEFINE_RES_IRQ(IRQ_##ip)

Great, I don't know why I couldn't find it and nobody use it now...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
