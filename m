From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V1] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Fri, 27 Jan 2012 13:53:51 +0900
Message-ID: <019e01ccdcaf$aa0518b0$fe0f4a10$%kim@samsung.com>
References: <1324966676-5714-1-git-send-email-riverful.kim@samsung.com>
 <028701ccc5da$31491fc0$93db5f40$%kim@samsung.com>
 <000f01ccc5de$df5987e0$9e0c97a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55560 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755344Ab2A0Exz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 23:53:55 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYF007D0XLRFFD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 13:53:54 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYF00CEFXLRGO10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 13:53:54 +0900 (KST)
In-reply-to: <000f01ccc5de$df5987e0$9e0c97a0$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'HeungJun, Kim'" <riverful.kim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

HeungJun, Kim wrote:
> 
> Hi Kukjin Kim,
> 
> > -----Original Message-----
> > From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-
> kernel-
> > bounces@lists.infradead.org] On Behalf Of Kukjin Kim
> > Sent: Thursday, December 29, 2011 12:30 PM
> > To: 'HeungJun, Kim'
> > Cc: kyungmin.park@samsung.com; linux-samsung-soc@vger.kernel.org; linux-
> arm-
> > kernel@lists.infradead.org
> > Subject: RE: [PATCH V1] ARM: EXYNOS: Adds Samsung TRATS board support
> >
> > HeungJun, Kim wrote:
> > >
> > > This patch adds Samsung Mobile TRATS board support.
> > >
> > > The changes against V0:
> > >   1) Modify Makefile & boardfile name: from "board-trats.c" to "mach-
> > > trats.c"
> > >   2) Fix name of mmc's fixed regulator: remove "inverted"
> > >   3) Fix directory name on GPL comments: from "exynos4" to "exynos"
> > >
> > > Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> > >  arch/arm/mach-exynos/Kconfig      |   11 ++
> > >  arch/arm/mach-exynos/Makefile     |    1 +
> > >  arch/arm/mach-exynos/mach-trats.c |  340
> > > +++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 352 insertions(+), 0 deletions(-)
> > >  create mode 100644 arch/arm/mach-exynos/mach-trats.c
> > >
> > Hi HeungJun,
> >
> > Thanks for your re-submit.
> >
> > Hmm, maybe this is v2 not v1?
> >
> > Anyway, as I said, this conflicts with other ARM consolidation works. So
> > please wait until after the merge window for this patch.
> >
> > Happy New Year.
> This probably my mistake. v2 is right.
> And it's no problem to be merge next windows. I'll wait.
> 
> Happy new year, too!
> 
Hi, could you please re-work this based on v3.3-rc1?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
