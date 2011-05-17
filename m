From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
Date: Tue, 17 May 2011 14:10:43 +0200
Message-ID: <4DD265C3.9040101@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
 <4DCBA717.3090307@samsung.com>
 <002001cc1399$02964bb0$07c2e310$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48714 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754354Ab1EQMKr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 May 2011 08:10:47 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LLC00AID9TXDG80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 May 2011 13:10:45 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLC00IOZ9TVV3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 May 2011 13:10:44 +0100 (BST)
In-reply-to: <002001cc1399$02964bb0$07c2e310$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Mauro Carvalho Chehab' <mchehab@infradead.org>, 'Nick Pelling' <nickpelling@nanodome.com>

On 05/16/2011 09:15 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
> 
>> Shouldn't there be some deprecation period for whole s5pc100 support
> removal ?
> 
> This is that. But I know, there is no time...
> 
>> It looks a bit rude to me that suddenly whole support for the SoC is
> vanished.
> 
> Hmm...what did you think about my previous comments: 'removing some
> "mach-s5pxxxx"s'?

I would expect one kernel release period of so notice for such a change.
But it doesn't have to be true in this specific case.

> 
>> I know at least one active user of mainline FIMC driver @ s5pc100.
> 
> Do you _really_ want to keep it in later mainline?

I don't personally have interest in maintaining this driver for s5pc100.
It just adds unnecessary complexity to my work and in fact I have limited
possibilities now to test the driver on s5pc100.
But if there are users and it really doesn't cost much to keep the support
for s5pc100 why bother to remove it?  Just to get rid of one mach-* directory ? 

> 
> I was not sure we should keep continually 6442 and C100 in mainline when I
> decided to removing 'mach-s5pxxxx'.

I really don't care about 6442, but what's the problem with s5pc100 ?
Is it being discontinued ? Or there is little users of it ?

I would much more like to see attempts to consolidate the code rather than
simply removing it.


Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
