From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Thu, 01 Mar 2012 13:06:27 +0900
Message-ID: <076b01ccf760$ad072730$07157590$%kim@samsung.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
 <1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
 <001701ccf6cc$a83727d0$f8a57770$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9539 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754991Ab2CAEGa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:06:30 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M060087JU2Q8MB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:06:29 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600AXGU2RCA60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:06:28 +0900 (KST)
In-reply-to: <001701ccf6cc$a83727d0$f8a57770$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>

Jingoo Han wrote:
> 
> Hi Tushar,
> 

(please don't top-post)

> > -----Original Message-----
> > From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf
> > Of Tushar Behera
> > Sent: Thursday, December 01, 2011 2:50 PM
> > To: linux-samsung-soc@vger.kernel.org
> > Cc: kgene.kim@samsung.com; linaro-dev@lists.linaro.org;
> patches@linaro.org
> > Subject: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
> >
> > The framebuffer driver needs the clock named 'lcd' as its bus
> > clock but the equivalent clock on Exynos4 is named as 'fimd'.
> > Hence, create a clkdev lookup entry with the name 'lcd' that
> > references the 'fimd' clock.
> >
> > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> 
> Acked-by: Jingoo Han <jg1.han@samsung.com>
> 

OK, I will apply this with Sylwester's 'reviewed-by' I looked at  before.

BTW, Tushar, what's the [1/3] and [3/3] in this series? If they are still
needed now, could you please re-send? Maybe I missed.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
