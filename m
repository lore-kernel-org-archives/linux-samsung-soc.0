From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV310: Optimize interrupt source searching code
Date: Tue, 28 Sep 2010 23:07:35 +0900
Message-ID: <00c201cb5f16$839461d0$8abd2570$%kim@samsung.com>
References: <1285637510-16740-1-git-send-email-kgene.kim@samsung.com>
 <4CA1E387.709@ru.mvista.com> <op.vjqufzs47p4s8u@pikus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35099 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754581Ab0I1OHW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 10:07:22 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9G00DVNN88G460@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 23:07:20 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9G003HRN888J@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 23:07:21 +0900 (KST)
In-reply-to: <op.vjqufzs47p4s8u@pikus>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Micha=C5=82_Nazarewicz'?= <m.nazarewicz@samsung.com>, 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Michal Nazarewicz wrote:
> 
Hi :-)

> On Tue, 28 Sep 2010 14:45:59 +0200, Sergei Shtylyov <sshtylyov@mvista.com>
> wrote:
> 
> > Hello.
> >
> > On 28-09-2010 5:31, Kukjin Kim wrote:
> >
> >> From: Changhwan Youn<chaos.youn@samsung.com>
> >
> >> It is reported by Junseok Jung that using clz instruction is
> >> better instead of using for-loop to find the interrupt source.
> >> This patch modifies interrupt source searching code using __fls().
> >> The __fls() is implemented using clz instruction.
> >
> >> Suggested-by: Junseok Jung<jundols.jung@samsung.com>
> >> Signed-off-by: Changhwan Youn<chaos.youn@samsung.com>
> >> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> >> ---
> >>   arch/arm/mach-s5pv310/irq-combiner.c |    6 +-----
> >>   1 files changed, 1 insertions(+), 5 deletions(-)
> >
> >> diff --git a/arch/arm/mach-s5pv310/irq-combiner.c b/arch/arm/mach-s5pv310/irq-
> combiner.c
> >> index 0f70521..39e3647 100644
> >> --- a/arch/arm/mach-s5pv310/irq-combiner.c
> >> +++ b/arch/arm/mach-s5pv310/irq-combiner.c
> >> @@ -66,11 +66,7 @@ static void combiner_handle_cascade_irq(unsigned int
> irq, struct irq_desc *desc)
> >>   	if (status == 0)
> >>   		goto out;
> >>
> >> -	for (combiner_irq = 0; combiner_irq<  32; combiner_irq++) {
> >> -		if (status & 0x1)
> >> -			break;
> >> -		status>>= 1;
> >> -	}
> >> +	combiner_irq = __fls(status);
> >
> >     But the loop finds the *first* set bit, not the last...
> 
> __ffs than?
> 
Yes, already re-submitted.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
