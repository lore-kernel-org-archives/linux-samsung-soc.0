From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/6] pinctrl: samsung: Various fixes
Date: Thu, 20 Sep 2012 16:55:24 +0200
Message-ID: <2771354.x9C40TPfJ1@amdc1227>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
 <CACRpkdbTPQvGSHJU_odGFtr5snb=U+L2Yuo-AhgX55hF6V5Lqw@mail.gmail.com>
 <505B2839.1040600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39858 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754100Ab2ITOze (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 10:55:34 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN008SDLGEMHK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 23:55:33 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN00HNOLGGRJA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 23:55:33 +0900 (KST)
In-reply-to: <505B2839.1040600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

Hi Kukjin,

On Thursday 20 of September 2012 23:29:13 Kukjin Kim wrote:
> On 09/20/12 19:25, Linus Walleij wrote:
> > On Thu, Sep 20, 2012 at 10:51 AM, Tomasz Figa<t.figa@samsung.com>  
wrote:
> >> This patch series contains various fixes of problems and nitpicks
> >> spotted when working on adding support for Exynos4x12. See each patch
> >> for more detailed information.
> > 
> > This all looks good, do you want me to take this into the pinctrl tree
> > or will it go through Samsung ARM SoC (Kyungmin)?
> > 
> > In the latter case, Acked-by: Linus Walleij<linus.walleij@linaro.org>
> > for all, else poke me and I'll apply them.
> 
> Linus, thanks for your ack and looks OK to me. Since now pinctrl-exynos
> driver is in my tree so let me pick this series on top of it into
> Samsung tree with your ack.

I just posted an additional last minute trivial patch which fixes another 
typo I found.

Could you take it with this series?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
