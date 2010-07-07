From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Add PMU device
Date: Wed, 07 Jul 2010 09:26:50 +0900
Message-ID: <013601cb1d6b$19cb4850$4d61d8f0$%kim@samsung.com>
References: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
 <005f01cb1c3f$c464d150$4d2e73f0$%kim@samsung.com>
 <4C328D3A.7060701@samsung.com>
 <00a201cb1cbd$594371a0$0bca54e0$%kim@samsung.com> <4C32D6A2.306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42282 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755977Ab0GGA0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 20:26:46 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L55003EPVWL9IA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 09:26:45 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5500MCBVWLMI@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 09:26:45 +0900 (KST)
In-reply-to: <4C32D6A2.306@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Joonyoung Shim wrote:
> 
> On 7/6/2010 12:43 PM, Kukjin Kim wrote:
> > Joonyoung Shim wrote:
> >> On 7/5/2010 9:44 PM, Kukjin Kim wrote:
> >>> Joonyoung Shim wrote:
> >>>> This patch adds an initcall for the s5p platforms so that they register
> >>>> their PMU IRQs with the PMU framework in the Kernel.
> >>>>
> >>> Please include Ben Dooks email address in the CC.
> >> OK.
> >>
> >>>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> >>>> ---
> >>>>  arch/arm/mach-s5p6442/include/mach/irqs.h |    2 +-
> >>>>  arch/arm/mach-s5pc100/include/mach/irqs.h |    1 +
> >>>>  arch/arm/mach-s5pv210/include/mach/irqs.h |    1 +
> >>>>  arch/arm/plat-s5p/Makefile                |    1 +
> >>>>  arch/arm/plat-s5p/dev-pmu.c               |   37
> >>>> +++++++++++++++++++++++++++++
> >>>>  5 files changed, 41 insertions(+), 1 deletions(-)
> >>>>  create mode 100644 arch/arm/plat-s5p/dev-pmu.c
> >>>>
> >>>> diff --git a/arch/arm/mach-s5p6442/include/mach/irqs.h b/arch/arm/mach-
> >>>> s5p6442/include/mach/irqs.h
> >>>> index 02c2374..22173cc 100644
> >>>> --- a/arch/arm/mach-s5p6442/include/mach/irqs.h
> >>>> +++ b/arch/arm/mach-s5p6442/include/mach/irqs.h
> >>>> @@ -32,7 +32,7 @@
> >>>>  #define IRQ_GPIOINT		S5P_IRQ_VIC0(30)
> >>>>
> >>>>  /* VIC1 */
> >>>> -#define IRQ_nPMUIRQ 		S5P_IRQ_VIC1(0)
> >>>> +#define IRQ_PMUIRQ		S5P_IRQ_VIC1(0)
> >>> I'm not sure this changing is better..as you know, nXXX has some meaning.
> >>>
> >> Otherwise, we should redefine it and s5p6440 was defined to IRQ_PMUIRQ.
> >>
> > Hmm..so I said...I'm not sure... :-)
> > OK...just IRQ_PMUIRQ looks good.
> >
> >>>>  #define IRQ_ONENAND 		S5P_IRQ_VIC1(7)
> >>>>  #define IRQ_UART0 		S5P_IRQ_VIC1(10)
> >>>>  #define IRQ_UART1 		S5P_IRQ_VIC1(11)
> >>>> diff --git a/arch/arm/mach-s5pc100/include/mach/irqs.h b/arch/arm/mach-
> >>>> s5pc100/include/mach/irqs.h
> >>>> index 28aa551..9cc1b0d 100644
> >>>> --- a/arch/arm/mach-s5pc100/include/mach/irqs.h
> >>>> +++ b/arch/arm/mach-s5pc100/include/mach/irqs.h
> >>>> @@ -110,5 +110,6 @@
> >>>>  #define IRQ_LCD_FIFO		IRQ_LCD0
> >>>>  #define IRQ_LCD_VSYNC		IRQ_LCD1
> >>>>  #define IRQ_LCD_SYSTEM		IRQ_LCD2
> >>>> +#define IRQ_PMUIRQ		IRQ_CORTEX0
> >>>>
> >>> I think, we don't need remapping in here.
> >>> How about use direct mapping like following:
> >>> #define IRQ_PMUIRQ	S5P_IRQ_VIC1(0)
> >>>
> >> I don't care, but above codes uses already remapping.
> >>
> > Yeah, used remapping..but written by IRQ_LCD[0-2] in datasheet.
> > In the PMUIRQ case, written by CORTEX0(nPMUIRQ).
> > ...
> > Anyway, I mean just no need IRQ_CORTEX0.
> >
> > So suggested direct mapping like above.
> > I think, we don't need to add an unused code.
> >
> 
> I don't know what means 'n' character of nPMUIRQ. If you are fine, let

The 'n' means negative, so its meaning is low-level active.

> decide to use IRQ_PMUIRQ instead of IRQ_nPMUIRQ and IRQ_CORTEX0.
> How about this?

Yes..ok..I mean it's better directly using without remapping from IRQ_CORTEX0.

Hmm...how about simply just IRQ_PMU?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
