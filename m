From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Sat, 10 Mar 2012 09:35:26 -0800
Message-ID: <20120310173526.GB5972@quad.lixom.net>
References: <4F589474.8050609@samsung.com>
 <CAOesGMiWOChuMjLQTK1pGys+oXCc4A=HO-2_=37rh3M6pgUP_g@mail.gmail.com>
 <4F5A22AD.1070907@samsung.com>
 <4F5B74C1.3080200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55059 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751009Ab2CJRf0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 12:35:26 -0500
Received: by iagz16 with SMTP id z16so4083375iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 09:35:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4F5B74C1.3080200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

On Sat, Mar 10, 2012 at 07:35:29AM -0800, Kukjin Kim wrote:
> On 03/09/12 07:33, Kukjin Kim wrote:
> >On 03/08/12 07:16, Olof Johansson wrote:
> >>Hi,
> >>
> >>On Thu, Mar 8, 2012 at 3:13 AM, Kukjin Kim<kgene.kim@samsung.com> wrote:
> >>
> >>>Kukjin Kim (2):
> >>>ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
> >>
> >>This is one large commit that does many things in one change. As the
> >>patch message says:
> >>
> >>ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
> >>
> >>- the prefix of clk register replace S5P_ with EXYNOS4_
> >>- move mach-exynos/clock.c to mach-exynos/clock-exynos4.c
> >>- according to moving clock-exynos4.c,
> >>move<mach/exynos4-clock.h> to "clock-exynos4.h"
> >>- add prefix exynos4_ on clk declaration
> >>
> >>It makes it hard to review, especially when you combine a move with
> >>other changes. It's better to do the move in a separate commit that
> >>doesn't change code (or only changes very very little) and then do the
> >>other changes in separate commits later.
> >>
> >Hmm...OK, let me do as per your suggestion and will re-send this soon.
> >
> Hi Olof,
> 
> I addressed comments from you and I think it should be ok to you.

Yes, much easier to review.


> Please pull from:

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/cleanup-exynos-clock
> 
> If any problems, please kindly let me know.
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> 
> The following changes since commit 192cfd58774b4d17b2fe8bdc77d89c2ef4e0591d:
> 
>   Linux 3.3-rc6 (2012-03-03 17:08:09 -0800)
> 
> are available in the git repository at:

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/cleanup-exynos-clock


The contents of the branch itself looks good, but now you have introduced
a modified/delete conflict with yourself.

You modify arch/arm/mach-exynos/clock.c in your cleanup-use-static branch, and
then you move it here. That means that when I merge in this branch, git throws
a conflict and I have to do manual edits to make the contents match.

It's better if you base this branch on your cleanup-use-static branch, so that
the move includes those edits. That way there is no conflict resolution to do
at our end either.

Can you please do that rebase and send a fresh pull request? I'll continue
looking at your other requests meanwhile.


Thanks!

-Olof
