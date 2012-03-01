From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Thu, 01 Mar 2012 14:15:25 +0900
Message-ID: <077401ccf76a$4f863010$ee929030$%kim@samsung.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
 <1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
 <001701ccf6cc$a83727d0$f8a57770$%han@samsung.com>
 <076b01ccf760$ad072730$07157590$%kim@samsung.com> <4F4EF845.7050803@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27784 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055Ab2CAFP1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 00:15:27 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M06002Q3X9CW5B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 14:15:26 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600D75X9PRD50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 14:15:26 +0900 (KST)
In-reply-to: <4F4EF845.7050803@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>

Tushar Behera wrote:
> 
> Hi Kukjin,
> 
Tushar, please don't top-post.

> On 03/01/2012 09:36 AM, Kukjin Kim wrote:
> > Jingoo Han wrote:
> >>
> >> Hi Tushar,
> >>
> >
> > (please don't top-post)
> >
> >>> -----Original Message-----
> >>> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-
> soc-
> >> owner@vger.kernel.org] On Behalf
> >>> Of Tushar Behera
> >>> Sent: Thursday, December 01, 2011 2:50 PM
> >>> To: linux-samsung-soc@vger.kernel.org
> >>> Cc: kgene.kim@samsung.com; linaro-dev@lists.linaro.org;
> >> patches@linaro.org
> >>> Subject: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd
> clock
> >>>
> >>> The framebuffer driver needs the clock named 'lcd' as its bus
> >>> clock but the equivalent clock on Exynos4 is named as 'fimd'.
> >>> Hence, create a clkdev lookup entry with the name 'lcd' that
> >>> references the 'fimd' clock.
> >>>
> >>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> >>
> >> Acked-by: Jingoo Han <jg1.han@samsung.com>
> >>
> >
> > OK, I will apply this with Sylwester's 'reviewed-by' I looked at
before.
> >
> Thanks. Do you want me rebase this patch on your latest for-next and
> resend?
> 
Thanks but I can do it.

> > BTW, Tushar, what's the [1/3] and [3/3] in this series? If they are
> still
> > needed now, could you please re-send? Maybe I missed.
> >
> "[PATCH 1/3] ARM: EXYNOS: Increase DMA pool allocator size for
> framebuffer"
> 	- It should be dropped.
> 
> "[PATCH 3/3] ARM: EXYNOS: Invert VCLK polarity for framebuffer on Origen
> board"
> 	- It has already been applied.

OK, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
