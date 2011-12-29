From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] Samsung S5P platform modification required for G2D
 driver
Date: Thu, 29 Dec 2011 12:29:11 +0900
Message-ID: <028501ccc5da$07da9650$178fc2f0$%kim@samsung.com>
References: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
 <CAK9yfHy2rwStKyXgr=Uf1bAToWi-ZmFvuBph64H7VCqHMJD93Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45168 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336Ab1L2D3M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:29:12 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY006TA4CN7GF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:29:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00EJC4CN3B90@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:29:11 +0900 (KST)
In-reply-to: <CAK9yfHy2rwStKyXgr=Uf1bAToWi-ZmFvuBph64H7VCqHMJD93Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Kamil Debski' <k.debski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com

Sachin Kamat wrote:
> 
> Hi Kamil,
> 
> Your previous patch set has already been merged into [1].
> Thus this has the G2D selected under SMDKV310 instead of NURI in the
> KConfig file.
> 
> 
> [1] http://git.kernel.org/?p=linux/kernel/git/kgene/linux-
> samsung.git;a=shortlog;h=refs/heads/for-next
> 
Yes, I've applied Kamil's old patches just with fixing trailing spaces not
fixing you pointed out.
I'm rebasing and will re-apply this series.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Regards
> Sachin
> 
> On 27/12/2011, Kamil Debski <k.debski@samsung.com> wrote:
> > Hi,
> >
> > This series of patches contains necessary platform modification required
> by
> > the
> > G2D driver. G2D is a 2D-graphics acceleration engine present in the
> S5PC110
> > and
> > Exynos4 Samsung SoCs.
> >
> > I have fixed the errors pointed out by Kukjin Kim an Sachin Kamat.
> (Thanks!)
> > Also the patches have been rebased to the newest kgene/for-next branch.
> >
> > Best wishes,
> > Kamil Debski
> >
> > Kamil Debski (3):
> >   s5p-g2d: add G2D to plat-s5p and mach-exynos4
> >   s5p-g2d: add G2D to mach-nuri
> >   s5p-g2d: add G2D to mach-universal
> >
> >  arch/arm/mach-exynos/Kconfig               |    2 ++
> >  arch/arm/mach-exynos/include/mach/map.h    |    3 +++
> >  arch/arm/mach-exynos/mach-nuri.c           |    1 +
> >  arch/arm/mach-exynos/mach-universal_c210.c |    1 +
> >  arch/arm/plat-s5p/Kconfig                  |    5 +++++
> >  arch/arm/plat-samsung/devs.c               |   28
> > ++++++++++++++++++++++++++++
> >  arch/arm/plat-samsung/include/plat/devs.h  |    1 +
> >  7 files changed, 41 insertions(+), 0 deletions(-)
> >
> >
> 
> 
> --
> With warm regards,
> Sachin
