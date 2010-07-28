From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [rtc-linux] [PATCH 2/2] rtc: rtc-s3c: Updates RTC driver for	clock
 enabling support
Date: Wed, 28 Jul 2010 13:49:53 +0900
Message-ID: <009601cb2e10$5420c7e0$fc6257a0$%kim@samsung.com>
References: <1279702501-6803-1-git-send-email-kgene.kim@samsung.com>
 <1279702501-6803-3-git-send-email-kgene.kim@samsung.com>
 <AANLkTikGjzmHxCX6_s5Z-ZXkoyPbtF28uCyE1VqdGPvb@mail.gmail.com>
 <AANLkTikEanSQBeFoqpMxR3tWxWTci_ytNsEhe9VS9ygg@mail.gmail.com>
 <AANLkTin=bqMRLYgAd4NvVnKZi1PWAGPqQSsZDPxvitfh@mail.gmail.com>
 <007a01cb2e0e$6760ad40$362207c0$%kim@samsung.com>
 <AANLkTimCd-4mqW6vt1f+xVVzMdzOqD0RwzLu3-Ue41gs@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20429 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186Ab0G1Etr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jul 2010 00:49:47 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6900FM742XO040@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 13:49:45 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6900AXP42XGA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 13:49:45 +0900 (KST)
In-reply-to: <AANLkTimCd-4mqW6vt1f+xVVzMdzOqD0RwzLu3-Ue41gs@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wan ZongShun' <mcuos.com@gmail.com>, rtc-linux@googlegroups.com
Cc: a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, 'Atul Dahiya' <atul.dahiya@samsung.com>, p_gortmaker@yahoo.com, 'Atul Dahiya' <atuldahiya84@gmail.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org



> -----Original Message-----
> From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Wan ZongShun
> Sent: Wednesday, July 28, 2010 1:42 PM
> To: rtc-linux@googlegroups.com
> Cc: a.zummo@towertech.it; linux-samsung-soc@vger.kernel.org; Atul Dahiya;
> p_gortmaker@yahoo.com; Atul Dahiya; ben-linux@fluff.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [rtc-linux] [PATCH 2/2] rtc: rtc-s3c: Updates RTC driver for clock
> enabling support
> 
> 2010/7/28 Kukjin Kim <kgene.kim@samsung.com>:
> > Wan ZongShun wrote:
> >>
> >> 2010/7/22 Atul Dahiya <atuldahiya84@gmail.com>:
> >> > On Thu, Jul 22, 2010 at 11:39 AM, Wan ZongShun <mcuos.com@gmail.com>
> >> wrote:
> >> >>
> >> >> 2010/7/21 Kukjin Kim <kgene.kim@samsung.com>:
> >> >> > From: Atul Dahiya <atul.dahiya@samsung.com>
> >> >> >
> >> >> > This Patch updates existing Samsung RTC driver for clock enabling
> support.
> >> >> >
> >> >> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> >> >> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> >> > ---
> >> >> >  drivers/rtc/rtc-s3c.c |   22 ++++++++++++++++++++++
> >> >> >  1 files changed, 22 insertions(+), 0 deletions(-)
> >> >> >
> >> >> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> >> >> > index 70b68d3..c032a15 100644
> >> >> > --- a/drivers/rtc/rtc-s3c.c
> >> >> > +++ b/drivers/rtc/rtc-s3c.c
> >> >> > @@ -1,5 +1,8 @@
> >> >> >  /* drivers/rtc/rtc-s3c.c
> >> >> >  *
> >> >> > + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> >> >> > + *             http://www.samsung.com/
> >> >> > + *
> >> >> >  * Copyright (c) 2004,2006 Simtec Electronics
> >> >> >  *     Ben Dooks, <ben@simtec.co.uk>
> >> >> >  *     http://armlinux.simtec.co.uk/
> >> >> > @@ -39,6 +42,7 @@ enum s3c_cpu_type {
> >> >> >
> >> >> >  static struct resource *s3c_rtc_mem;
> >> >> >
> >> >> > +static struct clk *rtc_clk;
> >> >> >  static void __iomem *s3c_rtc_base;
> >> >> >  static int s3c_rtc_alarmno = NO_IRQ;
> >> >> >  static int s3c_rtc_tickno  = NO_IRQ;
> >> >> > @@ -431,6 +435,10 @@ static int __devexit s3c_rtc_remove(struct
> >> platform_device *dev)
> >> >> >        s3c_rtc_setpie(&dev->dev, 0);
> >> >> >        s3c_rtc_setaie(0);
> >> >> >
> >> >> > +       clk_disable(rtc_clk);
> >> >> > +       clk_put(rtc_clk);
> >> >> > +       rtc_clk = NULL;
> >> >> > +
> >> >> >        iounmap(s3c_rtc_base);
> >> >> >        release_resource(s3c_rtc_mem);
> >> >> >        kfree(s3c_rtc_mem);
> >> >> > @@ -488,6 +496,16 @@ static int __devinit s3c_rtc_probe(struct
> >> platform_device *pdev)
> >> >> >                goto err_nomap;
> >> >> >        }
> >> >> >
> >> >> > +       rtc_clk = clk_get(&pdev->dev, "rtc");
> >> >>
> >> >> Do you really need the second argument? I think the bus clock for
> >> >> a device should be findable with NULL for s3c platform..
> >> >
> >> > No, actually  clk_get() function for s3c platform searches on the
> >> > basis of second parameter passed
> >> > so need to pass the second argument here.
> >>
> >> Okay, good patch!
> >>
> >> Acked-by: Wan ZongShun <mcuos.com@gmail.com>
> >>
> > Thanks for your review and ack.
> >
> > As I asked to Alessandro, does this goes through what subsystem go to
> upstream?
> >
> After you get ack, Samsung git tree or Andrew's mm git tree can do it.
> Thanks!
> 
Ok...will apply this for next merge window with your ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
