From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
Date: Thu, 25 Oct 2012 15:41:25 +0100
Message-ID: <20121025144125.GH11267@mudshark.cambridge.arm.com>
References: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
 <1351056894-5790-4-git-send-email-chanho61.park@samsung.com>
 <CAOesGMg5Nn5i=J8o3Rt8es3Tq_LZgVttuYSBbvYfmw1QTGwx0A@mail.gmail.com>
 <005801cdb251$e52f7480$af8e5d80$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:42677 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933068Ab2JYOmD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Oct 2012 10:42:03 -0400
Content-Disposition: inline
In-Reply-To: <005801cdb251$e52f7480$af8e5d80$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "sachin.kamat@linaro.org" <sachin.kamat@linaro.org>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>

On Thu, Oct 25, 2012 at 02:41:46AM +0100, Chanho Park wrote:
> > On Tue, Oct 23, 2012 at 10:34 PM, Chanho Park
> > <chanho61.park@samsung.com> wrote:
> > > This patch defines irq numbers of ARM performance monitoring unit for
> > exynos4.
> > > Firs of all, we need to fix IRQ_PMU correctly and to split pmu
> > > initialization of exynos from plat-samsung for easily defining it.
> > >
> > > The number of CPU cores and PMU irq numbers are vary according to soc
> > types.
> > > So, we need to identify each soc type using soc_is_xxx function and to
> > > define the pmu irqs dynamically. For example, the exynos4412 has 4 cpu
> > cores and pmus.
> > 
> > I wonder if it's worth doing this complexity on the non-DT case for exynos4?
> > 
> > I wish there was more focus on the Samsung platforms for getting the DT
> > support up to par with non-DT so you can avoid having to add new platform
> > devices like these in the first place.
> 
> The DT support of exynos4 is under development.

It seems to have been under development for a while now and changes like
this don't exactly encourage people to chip-in with that effort. Would it
not be better to spend time helping to complete the DT support instead of
retro-fitting static platform devices into the code?

> And many of exynos4 developers still use non-dt boot-up method.

That's not surprising if the DT code is still under development -- it's a
chicken-and-egg problem.

> By this time arm-pmu of exynos did not work. IMO we should fix and support it
> for non-dt users.

I agree that we definitely want to support the PMU on Exynos4, but I'm
tempted to postpone adding that code until DT support is available.

Will
