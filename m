From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS5: Fix kernel dump in AFTR idle mode
Date: Fri, 10 May 2013 08:32:07 +0900
Message-ID: <044a01ce4d0d$6bf36570$43da3050$%kim@samsung.com>
References: <1367235107-31328-1-git-send-email-inderpal.singh@linaro.org>
 <20130509202208.GA21831@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19961 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754287Ab3EIXcJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 19:32:09 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMK001XV1DKD0J0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 May 2013 08:32:08 +0900 (KST)
In-reply-to: <20130509202208.GA21831@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Inderpal Singh' <inderpal.singh@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, lorenzo.pieralisi@arm.com, patches@linaro.org

Olof Johansson wrote:
> 
> On Mon, Apr 29, 2013 at 05:01:47PM +0530, Inderpal Singh wrote:
> > The kernel crashes while resuming from AFTR idle mode. It happens
> > because L2 cache was not going into retention state.
> >
> > This patch configures the USE_RETENTION bit of ARM_L2_OPTION register
> > so that it does not depend on MANUAL_L2RSTDISABLE_CONTROL of
> > ARM_COMMON_OPTION register for L2RSTDISABLE signal.
> >
> > Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> 
> I haven't seen any activity from Kgene on this, but it seems reasonably
> bad

I spent time with my family last week...

> (and the fix is self-contained). Applying to arm-soc fixes branch.
> 
Anyway, thanks.

- Kukjin
