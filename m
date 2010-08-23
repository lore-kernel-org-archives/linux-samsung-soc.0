From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix on build warning regarding VMALLOC_END
 type
Date: Mon, 23 Aug 2010 09:44:27 +0900
Message-ID: <005801cb425c$59321530$0b963f90$%kim@samsung.com>
References: <1282349227-2581-1-git-send-email-kgene.kim@samsung.com>
 <4C6FD0D3.6020406@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44160 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249Ab0HWAoR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Aug 2010 20:44:17 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7K0097DY1RCJ70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Aug 2010 09:44:15 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7K00EGQY1R7V@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Aug 2010 09:44:15 +0900 (KST)
In-reply-to: <4C6FD0D3.6020406@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi ;-)

> Kukjin Kim wrote:
> 
> > Fix this warning:
> 
> > arch/arm/mm/init.c: In function 'mem_init':
> > arch/arm/mm/init.c:644: warning: format '%08lx' expects type
> > 'long unsigned int', but argument 12 has type 'unsigned int'
> 
> > Reported-by: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> 
> [...]
> 
> > diff --git a/arch/arm/mach-s3c2410/include/mach/vmalloc.h
b/arch/arm/mach-
> s3c2410/include/mach/vmalloc.h
> > index 315b007..dc3b34c 100644
> > --- a/arch/arm/mach-s3c2410/include/mach/vmalloc.h
> > +++ b/arch/arm/mach-s3c2410/include/mach/vmalloc.h
> > @@ -15,6 +15,6 @@
> >  #ifndef __ASM_ARCH_VMALLOC_H
> >  #define __ASM_ARCH_VMALLOC_H
> >
> > -#define VMALLOC_END	  (0xE0000000)
> > +#define VMALLOC_END	(0xE0000000UL)
> >
> >  #endif /* __ASM_ARCH_VMALLOC_H */
> > diff --git a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
b/arch/arm/mach-
> s3c64xx/include/mach/vmalloc.h
> > index 7411ef3..f0a0fa2 100644
> > --- a/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
> > +++ b/arch/arm/mach-s3c64xx/include/mach/vmalloc.h
> > @@ -15,6 +15,6 @@
> >  #ifndef __ASM_ARCH_VMALLOC_H
> >  #define __ASM_ARCH_VMALLOC_H
> >
> > -#define VMALLOC_END	  (0xE0000000)
> > +#define VMALLOC_END	(0xE0000000UL)
> >
> >  #endif /* __ASM_ARCH_VMALLOC_H */
> > diff --git a/arch/arm/mach-s5p6440/include/mach/vmalloc.h
b/arch/arm/mach-
> s5p6440/include/mach/vmalloc.h
> > index 16df257..8217b99 100644
> > --- a/arch/arm/mach-s5p6440/include/mach/vmalloc.h
> > +++ b/arch/arm/mach-s5p6440/include/mach/vmalloc.h
> > @@ -12,6 +12,6 @@
> >  #ifndef __ASM_ARCH_VMALLOC_H
> >  #define __ASM_ARCH_VMALLOC_H
> >
> > -#define VMALLOC_END	  (0xE0000000)
> > +#define VMALLOC_END	(0xE0000000UL)
> >
> >  #endif /* __ASM_ARCH_VMALLOC_H */
> > diff --git a/arch/arm/mach-s5p6442/include/mach/vmalloc.h
b/arch/arm/mach-
> s5p6442/include/mach/vmalloc.h
> > index be33336..b9fd9aa 100644
> > --- a/arch/arm/mach-s5p6442/include/mach/vmalloc.h
> > +++ b/arch/arm/mach-s5p6442/include/mach/vmalloc.h
> > @@ -12,6 +12,6 @@
> >  #ifndef __ASM_ARCH_VMALLOC_H
> >  #define __ASM_ARCH_VMALLOC_H
> >
> > -#define VMALLOC_END	  (0xE0000000)
> > +#define VMALLOC_END	(0xE0000000UL)
> >
> >  #endif /* __ASM_ARCH_VMALLOC_H */
> 
>     Could eliminate the useless parens while at it...
> 
Sure, it's no problem.
Will re-send soon with fix it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
