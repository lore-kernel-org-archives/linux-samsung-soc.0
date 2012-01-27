From: "HeungJun, Kim" <riverful.kim@samsung.com>
Subject: RE: [PATCH V1] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Fri, 27 Jan 2012 17:24:43 +0900
Message-ID: <004d01ccdccd$1f49d300$5ddd7900$%kim@samsung.com>
References: <1324966676-5714-1-git-send-email-riverful.kim@samsung.com>
 <028701ccc5da$31491fc0$93db5f40$%kim@samsung.com>
 <000f01ccc5de$df5987e0$9e0c97a0$%kim@samsung.com>
 <019e01ccdcaf$aa0518b0$fe0f4a10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46905 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041Ab2A0IYp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 03:24:45 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYG000LI7CUE7O0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 17:24:44 +0900 (KST)
Received: from NORIVERFULK04 ([165.213.219.118])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYG00KMA7D7GN50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 17:24:43 +0900 (KST)
In-reply-to: <019e01ccdcaf$aa0518b0$fe0f4a10$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin Kim,

Sure. I submitted the patch rebased on v3.3_rc1.
The patch's version prefix was some vague, so I just did not use to increment
the version.

Thank you.


Regards,
Heungjun Kim


> -----Original Message-----
> From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Kukjin Kim
> Sent: Friday, January 27, 2012 1:54 PM
> To: 'HeungJun, Kim'
> Cc: kyungmin.park@samsung.com; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: RE: [PATCH V1] ARM: EXYNOS: Adds Samsung TRATS board support
> 
> HeungJun, Kim wrote:
> >
> > Hi Kukjin Kim,
> >
> > > -----Original Message-----
> > > From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-
> > kernel-
> > > bounces@lists.infradead.org] On Behalf Of Kukjin Kim
> > > Sent: Thursday, December 29, 2011 12:30 PM
> > > To: 'HeungJun, Kim'
> > > Cc: kyungmin.park@samsung.com; linux-samsung-soc@vger.kernel.org; linux-
> > arm-
> > > kernel@lists.infradead.org
> > > Subject: RE: [PATCH V1] ARM: EXYNOS: Adds Samsung TRATS board support
> > >
> > > HeungJun, Kim wrote:
> > > >
> > > > This patch adds Samsung Mobile TRATS board support.
> > > >
> > > > The changes against V0:
> > > >   1) Modify Makefile & boardfile name: from "board-trats.c" to "mach-
> > > > trats.c"
> > > >   2) Fix name of mmc's fixed regulator: remove "inverted"
> > > >   3) Fix directory name on GPL comments: from "exynos4" to "exynos"
> > > >
> > > > Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> > > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > > ---
> > > >  arch/arm/mach-exynos/Kconfig      |   11 ++
> > > >  arch/arm/mach-exynos/Makefile     |    1 +
> > > >  arch/arm/mach-exynos/mach-trats.c |  340
> > > > +++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 352 insertions(+), 0 deletions(-)
> > > >  create mode 100644 arch/arm/mach-exynos/mach-trats.c
> > > >
> > > Hi HeungJun,
> > >
> > > Thanks for your re-submit.
> > >
> > > Hmm, maybe this is v2 not v1?
> > >
> > > Anyway, as I said, this conflicts with other ARM consolidation works. So
> > > please wait until after the merge window for this patch.
> > >
> > > Happy New Year.
> > This probably my mistake. v2 is right.
> > And it's no problem to be merge next windows. I'll wait.
> >
> > Happy new year, too!
> >
> Hi, could you please re-work this based on v3.3-rc1?
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
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
