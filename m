From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: EXYNOS: Remove unused variables
Date: Tue, 20 Nov 2012 18:18:49 +0900
Message-ID: <0c3001cdc700$0d13eef0$273bccd0$@org>
References: <1353387812-20001-1-git-send-email-tushar.behera@linaro.org>
 <50AB14E2.7060506@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35356 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753109Ab2KTJSv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 04:18:51 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS001O44J9OAW0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:18:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00GE04JDKL40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:18:49 +0900 (KST)
In-reply-to: <50AB14E2.7060506@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Tushar Behera wrote:
> 
> On 11/20/2012 10:33 AM, Tushar Behera wrote:
> > Fixes following compilation warnings.
> >
> > arch/arm/mach-exynos/common.c: In function 'exynos5_init_irq':
> > arch/arm/mach-exynos/common.c:661:6: warning: unused variable
> > 'irq' [-Wunused-variable]
> > arch/arm/mach-exynos/common.c: In function 'exynos_init_irq_eint':
> > arch/arm/mach-exynos/common.c:1046:15: warning: unused variable
> > 'paddr' [-Wunused-variable]
> >
> > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> > ---
> >  arch/arm/mach-exynos/common.c |    2 --
> >  1 files changed, 0 insertions(+), 2 deletions(-)
> >
> Please ignore this patch. It was based on some other patchset which is
> not yet in mainline.
> 
OK.

> Apologies.
> 
No prob.

K-Gene <kgene@kernel.org>
