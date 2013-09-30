From: Jungseok Lee <jays.lee@samsung.com>
Subject: RE: [PATCH V2] ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 14:20:48 +0900
Message-ID: <003401cebd9c$d29c75a0$77d560e0$%lee@samsung.com>
References: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com>
 <CAK9yfHywzpbuYag4RM_00Z5UdQ0qY3y0iDzyY1Yt8KYh83Z3pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62456 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab3I3FUu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 01:20:50 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTX00LTQATZLEJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Sep 2013 14:20:49 +0900 (KST)
In-reply-to: <CAK9yfHywzpbuYag4RM_00Z5UdQ0qY3y0iDzyY1Yt8KYh83Z3pA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

On Monday, September 30, 2013 12:04 PM, Sachin Kamat wrote:
> On 30 September 2013 07:02, Jungseok Lee <jays.lee@samsung.com> wrote:
> 
> > +       /* turn off all power domains */
> > +       addr = of_iomap(np, 0) + 0x14;
> > +       __raw_writel(0x1, addr);
> 
> Actually my comment was more about mentioning what these above values
> especially 0x14 represented? Either using a macro (preferred way) or
> atleast a comment.

How about changing a variable name "addr" to "power_down_reg"?

0x14 is only available for exynos5440, not exynos5. Currently, there are no
macros for specific SoCs in exynos5, such as exynos5250 or exynos5420. That is
why I hesitate to add a macro for 0x14.

Best Regards
Jungseok Lee

> 
> --
> With warm regards,
> Sachin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
