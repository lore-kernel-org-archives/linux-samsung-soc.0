From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix PL330 DMA controller clkdev entries
Date: Thu, 07 Mar 2013 20:08:20 +0900
Message-ID: <021101ce1b24$13dfcdd0$3b9f6970$%kim@samsung.com>
References: <1362227906-13921-1-git-send-email-s.nawrocki@samsung.com>
 <51321326.6050800@gmail.com> <008001ce18d8$451527e0$cf3f77a0$%kim@samsung.com>
 <5134A78A.9050709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9538 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932235Ab3CGLIW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 06:08:22 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJA008BVEXOQ7K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 20:08:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJA0056REXW8I20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 20:08:20 +0900 (KST)
In-reply-to: <5134A78A.9050709@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: 'Lonsn' <lonsn2005@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Inderpal Singh' <inderpal.singh@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>

Sylwester Nawrocki wrote:
> 
> On 03/04/2013 02:00 PM, Kukjin Kim wrote:
> > Looks good to me, applied into -fixes.
> >
> > Sylwester, why did you want to re-send this patch?
> 
> Only to add
> 
> Tested-by: Lonsn <lonsn2005@gmail.com>
> Cc: stable@vger.kernel.org # 3.7
> 
> tags, and any other in case someone else tests the patch.
> 
> I think we would need this fix for stable 3.7 as well.
> 
> Thanks for applying it.
> 
I already added above when I applied ;-)

Thanks for your confirmation.

- Kukjin
