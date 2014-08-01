From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [FIX][RESEND PATCH v3] ARM: EXYNOS: Fix suspend/resume sequences
Date: Fri, 01 Aug 2014 23:18:53 +0900
Message-ID: <081101cfad93$8615d810$92418830$@samsung.com>
References: <1406883097-14157-1-git-send-email-tomasz.figa@gmail.com>
 <1910401.THJm9YLBl0@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12345 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaHAOS5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 10:18:57 -0400
In-reply-to: <1910401.THJm9YLBl0@amdc1032>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, arm@kernel.org

Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
Hi,

> On Friday, August 01, 2014 10:51:37 AM Tomasz Figa wrote:
> > From: Tomasz Figa <t.figa@samsung.com>
> >
> > Due to recent consolidation of Exynos suspend and cpuidle code, some
> > parts of suspend and resume sequences are executed two times, once from
> > exynos_pm_syscore_ops and then from exynos_cpu_pm_notifier() and thus it
> > breaks suspend, at least on Exynos4-based boards. In addition, simple
> > core power down from a cpuidle driver could, in case of CPU 0 could
> > result in calling functions that are specific to suspend and deeper idle
> > states.
> >
> > This patch fixes the issue by moving those operations outside the CPU PM
> > notifier into suspend and AFTR code paths. This leads to a bit of code
> > duplication, but allows additional code simplification, so in the end
> > more code is removed than added.
> >
> > Fixes: 85f9f90808b4 ("ARM: EXYNOS: Use the cpu_pm notifier for pm")
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: arm@kernel.org
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > ---
> >  arch/arm/mach-exynos/pm.c        | 164 ++++++++++++++++++---------------------
> >  drivers/cpuidle/cpuidle-exynos.c |  25 +-----
> >  2 files changed, 80 insertions(+), 109 deletions(-)
> >
> > This is resend of a regression fix sent more than two weeks ago (July, 15;
> > [1]), without any response from respective maintainers. It fixes
> > a significant regression breaking suspend/resume on Exynos4-based systems.
> >
> > I know we already have -rc7, but this patch in its first iteration was
> > sent more than a month ago (June, 24; [2]) and it changed only for
> > convenience of authors of further patches, to either avoid conflicts ([3])
> > or reduce the need of changes to support more functionality later (as
> > discussed in [4]). However it should have had priority over clean-up or
> > functional patches, which was apparently not the case.
> 
> This is not quite right, your initial version needed to be changed also
> because of potential problems (https://lkml.org/lkml/2014/7/15/206).
> 
Yeah...hmm...maybe it should be updated in 3.17...

> However the current version (from two weeks ago) is fine and IMO still
> should be merged as a _regression_ fix for v3.16 (despite not being
> a tiny patch).
> 
Agreed. OK.

> Also FWIW:
> 
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

@Olof,

It's true this is a regression for v3.16 and I couldn't take this before
because of some dependencies...so I'd like to ask you to take for v3.16 even
though it's late and big...

Thanks,
Kukjin
