From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
Date: Thu, 25 Oct 2012 10:41:46 +0900
Message-ID: <005801cdb251$e52f7480$af8e5d80$@samsung.com>
References: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
 <1351056894-5790-4-git-send-email-chanho61.park@samsung.com>
 <CAOesGMg5Nn5i=J8o3Rt8es3Tq_LZgVttuYSBbvYfmw1QTGwx0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28350 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755636Ab2JYBlt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Oct 2012 21:41:49 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCF00A1IE0A4GC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Oct 2012 10:41:47 +0900 (KST)
Received: from DOCHANHO61P01 ([10.90.51.44])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCF00EX9E1MTE90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Oct 2012 10:41:47 +0900 (KST)
In-reply-to: <CAOesGMg5Nn5i=J8o3Rt8es3Tq_LZgVttuYSBbvYfmw1QTGwx0A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kyungmin.park@samsung.com, sachin.kamat@linaro.org, thomas.abraham@linaro.org, will.deacon@arm.com

> -----Original Message-----
> From: Olof Johansson [mailto:olof@lixom.net]
> Sent: Thursday, October 25, 2012 2:15 AM
> To: Chanho Park
> Cc: kgene.kim@samsung.com; linux-samsung-soc@vger.kernel.org; linux-
> arm-kernel@lists.infradead.org; linux@arm.linux.org.uk; ben-linux@fluff.org;
> kyungmin.park@samsung.com; sachin.kamat@linaro.org;
> thomas.abraham@linaro.org; will.deacon@arm.com
> Subject: Re: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
> 
> Hi,
> 
> On Tue, Oct 23, 2012 at 10:34 PM, Chanho Park
> <chanho61.park@samsung.com> wrote:
> > This patch defines irq numbers of ARM performance monitoring unit for
> exynos4.
> > Firs of all, we need to fix IRQ_PMU correctly and to split pmu
> > initialization of exynos from plat-samsung for easily defining it.
> >
> > The number of CPU cores and PMU irq numbers are vary according to soc
> types.
> > So, we need to identify each soc type using soc_is_xxx function and to
> > define the pmu irqs dynamically. For example, the exynos4412 has 4 cpu
> cores and pmus.
> 
> I wonder if it's worth doing this complexity on the non-DT case for exynos4?
> 
> I wish there was more focus on the Samsung platforms for getting the DT
> support up to par with non-DT so you can avoid having to add new platform
> devices like these in the first place.

The DT support of exynos4 is under development.
And many of exynos4 developers still use non-dt boot-up method.
By this time arm-pmu of exynos did not work. IMO we should fix and support it
for non-dt users.

Thanks,

Best regards,
Chanho Park

> 
> 
> Thanks,
> 
> -Olof
