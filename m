From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
Date: Fri, 26 Oct 2012 13:05:36 +0900
Message-ID: <007301cdb32f$26eb92e0$74c2b8a0$@samsung.com>
References: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
 <1351056894-5790-4-git-send-email-chanho61.park@samsung.com>
 <CAOesGMg5Nn5i=J8o3Rt8es3Tq_LZgVttuYSBbvYfmw1QTGwx0A@mail.gmail.com>
 <005801cdb251$e52f7480$af8e5d80$@samsung.com>
 <20121025144125.GH11267@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55516 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709Ab2JZEFi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 00:05:38 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCH005PDFD67960@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 13:05:36 +0900 (KST)
Received: from DOCHANHO61P01 ([10.90.51.44])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCH00JCMFDCSW90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 13:05:36 +0900 (KST)
In-reply-to: <20121025144125.GH11267@mudshark.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Will Deacon' <will.deacon@arm.com>
Cc: 'Olof Johansson' <olof@lixom.net>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kyungmin.park@samsung.com, sachin.kamat@linaro.org, thomas.abraham@linaro.org

> -----Original Message-----
> From: Will Deacon [mailto:will.deacon@arm.com]
> Sent: Thursday, October 25, 2012 11:41 PM
> To: Chanho Park
> Cc: 'Olof Johansson'; kgene.kim@samsung.com; linux-samsung-
> soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux@arm.linux.org.uk; ben-linux@fluff.org; kyungmin.park@samsung.com;
> sachin.kamat@linaro.org; thomas.abraham@linaro.org
> Subject: Re: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
> 
> On Thu, Oct 25, 2012 at 02:41:46AM +0100, Chanho Park wrote:
> > > On Tue, Oct 23, 2012 at 10:34 PM, Chanho Park
> > > <chanho61.park@samsung.com> wrote:
> > > > This patch defines irq numbers of ARM performance monitoring unit
> > > > for
> > > exynos4.
> > > > Firs of all, we need to fix IRQ_PMU correctly and to split pmu
> > > > initialization of exynos from plat-samsung for easily defining it.
> > > >
> > > > The number of CPU cores and PMU irq numbers are vary according to
> > > > soc
> > > types.
> > > > So, we need to identify each soc type using soc_is_xxx function
> > > > and to define the pmu irqs dynamically. For example, the
> > > > exynos4412 has 4 cpu
> > > cores and pmus.
> > >
> > > I wonder if it's worth doing this complexity on the non-DT case for
> exynos4?
> > >
> > > I wish there was more focus on the Samsung platforms for getting the
> > > DT support up to par with non-DT so you can avoid having to add new
> > > platform devices like these in the first place.
> >
> > The DT support of exynos4 is under development.
> 
> It seems to have been under development for a while now and changes like
> this don't exactly encourage people to chip-in with that effort. Would it not
> be better to spend time helping to complete the DT support instead of retro-
> fitting static platform devices into the code?

The purposes of this patchset are two things.
The first thing is that fixing incorrect interrupt definition of the exynos4.
We already have arm-pmu platform device for s3c and s5p Samsung platforms.
However, it did not work in case of exynos series platform. I separate it from
plat-samsung code to support easily for exynos platforms. Please see that
the purpose of added platform device is fixing and supporting arm-pmu without
difficulty.
The next one is arm-pmu DT support for exynos4 and 5. You can see it in this
patchset(4 and 5).

> 
> > And many of exynos4 developers still use non-dt boot-up method.
> 
> That's not surprising if the DT code is still under development -- it's a chicken-
> and-egg problem.
> 
> > By this time arm-pmu of exynos did not work. IMO we should fix and
> > support it for non-dt users.
> 
> I agree that we definitely want to support the PMU on Exynos4, but I'm
> tempted to postpone adding that code until DT support is available.

I already included DT support for exynos4(except exynos4412) in this patchset.
(Please see the [PATCH v5 5/5] ARM: EXYNOS: Add arm-pmu DT binding for exynos421x)

Best regards,
Chanho Park

> 
> Will
