From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 03/11] ARM: EXYNOS: local regs-pmu.h header file
Date: Sat, 04 Jan 2014 11:20:05 +0900
Message-ID: <22f801cf08f3$7b259750$7170c5f0$@samsung.com>
References: <116101cefb1e$69ddfe70$3d99fb50$@kernel.org>
 <CAOesGMjJXodfZUSwHWdYgJsTWL4FANxXnP519B0AUiwpEn4bQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41537 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbaADCUF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 21:20:05 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYU00E4UUHGQB90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 04 Jan 2014 11:20:04 +0900 (KST)
In-reply-to: <CAOesGMjJXodfZUSwHWdYgJsTWL4FANxXnP519B0AUiwpEn4bQQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi,
> 
Hi,

> 
> On Tue, Dec 17, 2013 at 3:52 AM,  <kgene@kernel.org> wrote:
> > From: Kukjin Kim <kgene.kim@samsung.com>
> >
> > This moves regs-pmu.h file into mach-exynos directory.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-exynos/common.c                      |    3 ++-
> >  arch/arm/mach-exynos/cpuidle.c                     |    2 +-
> >  arch/arm/mach-exynos/hotplug.c                     |    2 +-
> >  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +-
> >  arch/arm/mach-exynos/platsmp.c                     |    2 +-
> >  arch/arm/mach-exynos/pm.c                          |    2 +-
> >  arch/arm/mach-exynos/pm_domains.c                  |    3 ++-
> >  arch/arm/mach-exynos/pmu.c                         |    2 +-
> >  arch/arm/mach-exynos/{include/mach => }/regs-pmu.h |    0
> >  9 files changed, 10 insertions(+), 8 deletions(-)
> >  rename arch/arm/mach-exynos/{include/mach => }/regs-pmu.h (100%)
> 
> This looks OK, but when you committed, you did the move of the include
> file in another commit (e44de221d3ddb99387b04cfd49483bcd05daa6fb).
> That means that between that commit and this patch, there's build
> breakage. Please try to avoid that in the future since if something
> needs to be bisected near here it can cause problems.
> 
Yeah, you're right. Sorry and I'll try to avoid that per your suggestion.

Thanks,
Kukjin
