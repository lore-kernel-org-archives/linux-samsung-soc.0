From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [GIT PULL 7/7] Samsung SoC for v3.14
Date: Mon, 23 Dec 2013 10:36:18 +0100
Message-ID: <20131223103618.5815379e@amdc2363>
References: <52AE0FA5.3090804@samsung.com>
 <20131222221141.GF13365@quad.lixom.net> <1566886.jecinlyiQ0@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49185 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756983Ab3LWJg2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 04:36:28 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MY900I846OQBUD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Dec 2013 18:36:26 +0900 (KST)
In-reply-to: <1566886.jecinlyiQ0@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Arun Kumar K <arunkk.samsung@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>

Hi Tomasz,

> Hi Olof,
> 
> On Sunday 22 of December 2013 14:11:41 Olof Johansson wrote:
> > On Mon, Dec 16, 2013 at 05:23:01AM +0900, Kukjin Kim wrote:
> > > The following changes since commit
> > > 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> > > 
> > >   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> > > 
> > > are available in the git repository at:
> > > 
> > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > > tags/samsung-soc
> > > 
> > > for you to fetch changes up to
> > > 538cfbb4c40ab59688236484138133b8e3e89220:
> > > 
> > >   ARM: dts: Add initial support for Arndale Octa board (2013-12-16
> > > 05:05:43 +0900)
> > 
> > Hi,
> > 
> > I'm not going to pull this.
> > 
> > I've asked you for about 6 months now (ever since Arnd went on
> > leave) to please finish his multiplatform work for Exynos. Nothing
> > has happened.
> > 
> > I'm not going to merge any more platform or SoC enablement code
> > for Samsung platforms until Exynos has been converted over to
> > multiplatform. Sorry.
> 
> Well, it's hard to disagree with you on this. Keeping adding new
> things constantly definitely does not make us closer to multiplatform
> support, as it only increases codebase of code that needs to be
> cleaned up and made multiplatform aware.
> 
> However it's not that we're not doing anything towards mutliplatform
> support. We're slowly getting there. A bit too slowly, but I'm afraid
> this is due to the fact that we have definitely too little manpower
> working on mainline support of Samsung SoCs.
> 
> As for good news, I already have a series cleaning up PM/sleep support
> and making it multiplatform friendly and I'm going to post it
> tomorrow. The bad news is that it depends on other series and I'm not
> sure if we can get it merged in this release. I'll try to do whatever
> possible to merge things as soon as possible, though.
> 
> From smaller things, we still need to sort out Exynos cpufreq driver
> that has dependencies on headers in plat-samsung/ and mach-exynos/.
> Unfortunately I don't have so much time to work on all the things at
> the same time, so I hope that someone else could pick this task up.
> Marek, Lukasz, what do you think?

Regarding the cpufreq for Exynos, we do need to clean things up.

It shall be possible to reuse generic cpufreq-cpu0.c and
arm_big_little.c code instead of several copy pasted
exynos[4|5]xxx-cpufreq.c ones.

This change will require some "virtual" clocks implementation for atomic
clocks dividers change.

I've already committed myself to fix this code. When all goes smooth, I
shall deliver some RFC code after new year.


> 
> Best regards,
> Tomasz
> 


-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
