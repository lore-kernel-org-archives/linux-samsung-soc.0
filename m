From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
Date: Wed, 18 May 2011 17:57:48 +0900
Message-ID: <001601cc1539$aaae2380$000a6a80$%kim@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
 <4DCBA717.3090307@samsung.com>
 <002001cc1399$02964bb0$07c2e310$%kim@samsung.com>
 <4DD265C3.9040101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61061 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755174Ab1ERI5w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 May 2011 04:57:52 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLD00JFCVKCOCK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 May 2011 17:57:51 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLD00H0BVKEJY@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 May 2011 17:57:50 +0900 (KST)
In-reply-to: <4DD265C3.9040101@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Mauro Carvalho Chehab' <mchehab@infradead.org>, 'Nick Pelling' <nickpelling@nanodome.com>

Sylwester Nawrocki wrote:
> 
> On 05/16/2011 09:15 AM, Kukjin Kim wrote:
> > Sylwester Nawrocki wrote:
> >
> >> Shouldn't there be some deprecation period for whole s5pc100 support
> > removal ?
> >
> > This is that. But I know, there is no time...
> >
> >> It looks a bit rude to me that suddenly whole support for the SoC is
> > vanished.
> >
> > Hmm...what did you think about my previous comments: 'removing some
> > "mach-s5pxxxx"s'?
> 
> I would expect one kernel release period of so notice for such a change.
> But it doesn't have to be true in this specific case.
> 
> >
> >> I know at least one active user of mainline FIMC driver @ s5pc100.
> >
> > Do you _really_ want to keep it in later mainline?
> 
> I don't personally have interest in maintaining this driver for s5pc100.
> It just adds unnecessary complexity to my work and in fact I have limited
> possibilities now to test the driver on s5pc100.
> But if there are users and it really doesn't cost much to keep the support
> for s5pc100 why bother to remove it?  Just to get rid of one mach-*
directory ?
> 
> >
> > I was not sure we should keep continually 6442 and C100 in mainline when
I
> > decided to removing 'mach-s5pxxxx'.
> 
> I really don't care about 6442, but what's the problem with s5pc100 ?
> Is it being discontinued ? Or there is little users of it ?
> 
> I would much more like to see attempts to consolidate the code rather than
> simply removing it.
> 
Hi Sylwester,

Thanks for your opinion :)
Please refer to my reply on this thread.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
