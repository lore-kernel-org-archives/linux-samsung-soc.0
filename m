From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v3 4/6] ARM:  EXYNOS: Remove unused header inclusion from
 hotplug.c
Date: Tue, 17 Jun 2014 09:22:20 +0530
Message-ID: <000201cf89df$8dbd9d00$a938d700$@samsung.com>
References: <1399706287-13919-1-git-send-email-y@samsung.com>
 <1399706419-13976-1-git-send-email-pankaj.dubey@samsung.com>
 <1399706419-13976-5-git-send-email-pankaj.dubey@samsung.com>
 <53970E8E.5030408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16933 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754926AbaFQDvn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 23:51:43 -0400
In-reply-to: <53970E8E.5030408@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, arnd@arndb.de

Hi Tomasz,


> -----Original Message-----
> 
> Hi Pankaj,
> 
> On 10.05.2014 09:20, Pankaj Dubey wrote:
> > This patch removed "plat/cpu.h" inclusion from hotplug.c as it is not
> > required.
> >
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
> >  arch/arm/mach-exynos/hotplug.c |    2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/hotplug.c
> > b/arch/arm/mach-exynos/hotplug.c index 0243ef3..5e19601 100644
> > --- a/arch/arm/mach-exynos/hotplug.c
> > +++ b/arch/arm/mach-exynos/hotplug.c
> > @@ -19,8 +19,6 @@
> >  #include <asm/cp15.h>
> >  #include <asm/smp_plat.h>
> >
> > -#include <plat/cpu.h>
> > -
> >  #include "common.h"
> >  #include "regs-pmu.h"
> >
> >
> 
> I don't see this header being included in current linux-next.
> 

OK, if it's already taken care, I will drop this change in next version.

> Best regards,
> Tomasz

Thanks,
Pankaj Dubey
