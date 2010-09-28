From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV310: Optimize interrupt source searching code
Date: Tue, 28 Sep 2010 22:10:55 +0900
Message-ID: <008a01cb5f0e$9a433df0$cec9b9d0$%kim@samsung.com>
References: <1285637510-16740-1-git-send-email-kgene.kim@samsung.com>
 <4CA1E387.709@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25643 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753780Ab0I1NKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 09:10:44 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9G00DZ5KLUG450@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 22:10:42 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9G00BFQKLULH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 22:10:42 +0900 (KST)
In-reply-to: <4CA1E387.709@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi ;-)

> On 28-09-2010 5:31, Kukjin Kim wrote:
> 
> > From: Changhwan Youn<chaos.youn@samsung.com>
> 
> > It is reported by Junseok Jung that using clz instruction is
> > better instead of using for-loop to find the interrupt source.
> > This patch modifies interrupt source searching code using __fls().
> > The __fls() is implemented using clz instruction.
> 
> > Suggested-by: Junseok Jung<jundols.jung@samsung.com>
> > Signed-off-by: Changhwan Youn<chaos.youn@samsung.com>
> > Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> > ---
> >   arch/arm/mach-s5pv310/irq-combiner.c |    6 +-----
> >   1 files changed, 1 insertions(+), 5 deletions(-)
> 
> > diff --git a/arch/arm/mach-s5pv310/irq-combiner.c
b/arch/arm/mach-s5pv310/irq-
> combiner.c
> > index 0f70521..39e3647 100644
> > --- a/arch/arm/mach-s5pv310/irq-combiner.c
> > +++ b/arch/arm/mach-s5pv310/irq-combiner.c
> > @@ -66,11 +66,7 @@ static void combiner_handle_cascade_irq(unsigned int
irq,
> struct irq_desc *desc)
> >   	if (status == 0)
> >   		goto out;
> >
> > -	for (combiner_irq = 0; combiner_irq<  32; combiner_irq++) {
> > -		if (status & 0x1)
> > -			break;
> > -		status>>= 1;
> > -	}
> > +	combiner_irq = __fls(status);
> 
>     But the loop finds the *first* set bit, not the last...
> 
Yes, you're right.
So I already re-submitted like following :-)

http://lists.infradead.org/pipermail/linux-arm-kernel/2010-September/027071.
html

Thanks for your pointing out.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
