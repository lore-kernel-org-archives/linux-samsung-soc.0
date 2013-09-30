From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2] ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 16:25:15 +0900
Message-ID: <069501cebdae$357285a0$a05790e0$@org>
References: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com>
 <CAK9yfHywzpbuYag4RM_00Z5UdQ0qY3y0iDzyY1Yt8KYh83Z3pA@mail.gmail.com>
 <003401cebd9c$d29c75a0$77d560e0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23476 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432Ab3I3H06 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 03:26:58 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTX00L3AGM9STI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Sep 2013 16:25:21 +0900 (KST)
In-reply-to: <003401cebd9c$d29c75a0$77d560e0$%lee@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jungseok Lee' <jays.lee@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Jungseok Lee wrote:
> 
> On Monday, September 30, 2013 12:04 PM, Sachin Kamat wrote:
> > On 30 September 2013 07:02, Jungseok Lee <jays.lee@samsung.com> wrote:
> >
> > > +       /* turn off all power domains */
> > > +       addr = of_iomap(np, 0) + 0x14;
> > > +       __raw_writel(0x1, addr);
> >
> > Actually my comment was more about mentioning what these above values
> > especially 0x14 represented? Either using a macro (preferred way) or
> > atleast a comment.
> 
> How about changing a variable name "addr" to "power_down_reg"?
> 
> 0x14 is only available for exynos5440, not exynos5. Currently, there are
> no
> macros for specific SoCs in exynos5, such as exynos5250 or exynos5420.
> That is
> why I hesitate to add a macro for 0x14.
> 
I think current patch looks good to me, and in this case I don't have any
idea why we should macro for just one time usage.

Applied, thanks.
Kukjin
