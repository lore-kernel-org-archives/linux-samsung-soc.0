From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: fix GIC using for EXYNOS5440
Date: Tue, 18 Dec 2012 19:26:07 -0800
Message-ID: <001501cddd98$9698dba0$c3ca92e0$@samsung.com>
References: <030c01cdd672$cb1b6b40$615241c0$%kim@samsung.com>
 <50C545E8.8050301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39348 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752337Ab2LSD0M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 22:26:12 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF900I4JDJB1H90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 12:26:09 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MF900EA8DJJTW10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 12:26:09 +0900 (KST)
In-reply-to: <50C545E8.8050301@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Joonyoung Shim wrote:
> 
> Hi,
> 
> On 12/10/2012 10:07 AM, Kukjin Kim wrote:
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >   arch/arm/mach-exynos/common.c |    3 ++-
> >   1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-
> exynos/common.c
> > index 0eb3b9a..9ecda37 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -684,7 +684,8 @@ void __init exynos5_init_irq(void)
> >   	 * Theses parameters should be NULL and 0 because EXYNOS4
> >   	 * uses GIC instead of VIC.
> >   	 */
> > -	s5p_init_irq(NULL, 0);
> > +	if (!of_machine_is_compatible("samsung,exynos5440"))
> > +		s5p_init_irq(NULL, 0);
> 
> How about remove to call s5p_init_irq() here because All exynos SoCs use
> GIC instead of VIC?
> 

NO, the current s5p_init_irq() is not only for VIC but also Timer which is
used on EXYNOS SoCs, I know the name is strange...

> >   	gic_arch_extn.irq_set_wake = s3c_irq_wake;
> >   }
