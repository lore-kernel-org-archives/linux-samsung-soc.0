From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 7/7] Samsung SoC for v3.14
Date: Tue, 24 Dec 2013 10:35:22 +0900
Message-ID: <1af601cf0048$695ad700$3c108500$@samsung.com>
References: <52AE0FA5.3090804@samsung.com>
 <20131222221141.GF13365@quad.lixom.net> <1566886.jecinlyiQ0@flatron>
 <20131223103618.5815379e@amdc2363> <20131223213809.GA23509@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45075 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753643Ab3LXBfY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 20:35:24 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYA0096TF2ZFN20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 10:35:23 +0900 (KST)
In-reply-to: <20131223213809.GA23509@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Lukasz Majewski' <l.majewski@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Arun Kumar K' <arunkk.samsung@gmail.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>

Olof Johansson wrote:
> 
> On Mon, Dec 23, 2013 at 10:36:18AM +0100, Lukasz Majewski wrote:
> > Hi Tomasz,
> >
> > > Hi Olof,
> > >
> > > On Sunday 22 of December 2013 14:11:41 Olof Johansson wrote:
> > > > On Mon, Dec 16, 2013 at 05:23:01AM +0900, Kukjin Kim wrote:
> > > > > The following changes since commit
> > > > > 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> > > > >
> > > > >   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> > > > >
> > > > > are available in the git repository at:
> > > > >
> > > >
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-
> samsung.git
> > > > > tags/samsung-soc
> > > > >
> > > > > for you to fetch changes up to
> > > > > 538cfbb4c40ab59688236484138133b8e3e89220:
> > > > >
> > > > >   ARM: dts: Add initial support for Arndale Octa board (2013-12-16
> > > > > 05:05:43 +0900)
> > > >
> > > > Hi,
> > > >
> > > > I'm not going to pull this.
> > > >
> > > > I've asked you for about 6 months now (ever since Arnd went on
> > > > leave) to please finish his multiplatform work for Exynos. Nothing
> > > > has happened.
> > > >
> > > > I'm not going to merge any more platform or SoC enablement code
> > > > for Samsung platforms until Exynos has been converted over to
> > > > multiplatform. Sorry.
> > >
> > > Well, it's hard to disagree with you on this. Keeping adding new
> > > things constantly definitely does not make us closer to multiplatform
> > > support, as it only increases codebase of code that needs to be
> > > cleaned up and made multiplatform aware.
> > >

Well, I don't know why this will hurt multiplatform, even you requested that
long time ago. I thought I could finish that by end of this year but it will
be done in Jan. Of course, I'm not sure it could be merged in 3.14, because
it's up to arm-soc tree, it could be sent to before merge window though.

Samsung SoC patches in this pull-request already got review in mailing-list
and it's ready to merge in the mainline. I think, multiplatform support
issue should be handled separately, it's up to you and arm-soc maintainers
though.

> > > However it's not that we're not doing anything towards mutliplatform
> > > support. We're slowly getting there. A bit too slowly, but I'm afraid
> > > this is due to the fact that we have definitely too little manpower
> > > working on mainline support of Samsung SoCs.
> > >
> > > As for good news, I already have a series cleaning up PM/sleep support
> > > and making it multiplatform friendly and I'm going to post it
> > > tomorrow. The bad news is that it depends on other series and I'm not
> > > sure if we can get it merged in this release. I'll try to do whatever
> > > possible to merge things as soon as possible, though.
> > >
> > > From smaller things, we still need to sort out Exynos cpufreq driver
> > > that has dependencies on headers in plat-samsung/ and mach-exynos/.
> > > Unfortunately I don't have so much time to work on all the things at
> > > the same time, so I hope that someone else could pick this task up.
> > > Marek, Lukasz, what do you think?
> >
> > Regarding the cpufreq for Exynos, we do need to clean things up.
> >
> > It shall be possible to reuse generic cpufreq-cpu0.c and
> > arm_big_little.c code instead of several copy pasted
> > exynos[4|5]xxx-cpufreq.c ones.
> >
> > This change will require some "virtual" clocks implementation for atomic
> > clocks dividers change.
> >
> > I've already committed myself to fix this code. When all goes smooth, I
> > shall deliver some RFC code after new year.
> 
> Great!
> 
> Sounds like if you can start with this after new year that 3.15 will be
> a good target for Exynos multiplatform. It's way overdue, and I would
> be very happy to see it completed.
> 
And Thomas P Abraham is working on multiplatform for exynos stuff and I
think he could finish in Jan. So I think Samsung folks need to talk
internally to avoid duplication efforts, let me talk to Marek in SRPC.

Thanks,
Kukjin
