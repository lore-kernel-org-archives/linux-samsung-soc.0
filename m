From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: SAMSUNG: S5P: If detected device tree skip irq init
Date: Thu, 26 Sep 2013 14:29:13 +0900
Message-ID: <02c901ceba79$55b382c0$011a8840$%kim@samsung.com>
References: <1380038363-487-1-git-send-email-m.krawczuk@partner.samsung.com>
 <2123658.6S6hP57GRg@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14026 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab3IZF3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 01:29:17 -0400
In-reply-to: <2123658.6S6hP57GRg@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: 'Mateusz Krawczuk' <m.krawczuk@partner.samsung.com>, t.stanislaws@samsung.com, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, s.nawrocki@samsung.com, b.zolnierkie@samsung.com, t.figa@samsung.com, linux-kernel@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, ben-linux@fluff.org, m.szyprowski@samsung.com

Tomasz Figa wrote:
> 
> Hi Mateusz,
> 
> On Tuesday 24 of September 2013 17:59:23 Mateusz Krawczuk wrote:
> > It prevents from executing things already handled by pinctrl-exynos
> > driver, when device tree is available.
> >
> > Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/plat-samsung/s5p-irq-eint.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Acked-by: Tomasz Figa <t.figa@samsung.com>
> 
> [as a temporary solution until we move all the users of this code to
> device tree]
> 
Yes, agreed.

The 'skip irq init' in subject would be changed to 'skip eint init' for
clear meaning.

Applied.

Thanks,
Kukjin
