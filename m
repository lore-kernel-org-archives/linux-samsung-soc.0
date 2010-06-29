From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/8] ARM: S5PV310: Add Timer support
Date: Tue, 29 Jun 2010 20:23:28 +0900
Message-ID: <00e501cb177d$821387e0$863a97a0$%kim@samsung.com>
References: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
 <1277476037-8806-6-git-send-email-kgene.kim@samsung.com>
 <20100628151918.GC3287@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23104 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752108Ab0F2LX2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jun 2010 07:23:28 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4R00C3XWZ1J050@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jun 2010 20:23:25 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4R00BRYWZ18U@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jun 2010 20:23:25 +0900 (KST)
In-reply-to: <20100628151918.GC3287@debian>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rabin Vincent' <rabin@rab.in>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

Rabin Vincent wrote:
> 
Hi Rabin,

Thanks for your comments. :-)

> On Fri, Jun 25, 2010 at 11:27:14PM +0900, Kukjin Kim wrote:
> > +static void s5pv310_pwm_init(unsigned int pwm_id, unsigned long tcnt)
> > +{
> > +	unsigned long tcon;
> > +
> > +	tcon = __raw_readl(S3C2410_TCON);
> > +
> > +	/* timers reload after counting zero, so reduce the count by 1 */
> > +	tcnt--;
> > +
> > +	printk(KERN_DEBUG "timer tcon=%08lx, tcnt %08lx\n", tcon, tcnt);
> 
> This function is called from set_event().  Do you really want this
> printk every time a tick is programmed?
> 
Yeah, you're right.
Will modify it.

> > +static void __init s5pv310_clocksource_init(void)
> > +{
> > +	unsigned long pclk;
> > +	unsigned long clock_rate;
> > +
> > +	pclk = clk_get_rate(timerclk);
> > +
> > +	clk_set_rate(tdiv2, pclk / 2);
> > +	clk_set_parent(tin2, tdiv2);
> > +
> > +	clock_rate = clk_get_rate(tin2);
> > +
> > +	pwm_clocksource.mult =
> > +		clocksource_khz2mult(clock_rate/1000,
pwm_clocksource.shift);
> > +
> > +	if (clocksource_register(&pwm_clocksource))
> > +		panic("%s: can't register clocksource\n",
> pwm_clocksource.name);
> > +
> > +	s5pv310_pwm_init(2, ~0);
> > +	s5pv310_pwm_start(2, 1);
> > +}
> > +
> 
> It would probably be prudent to start the clocksource before registering
> it, rather than after.

Oh, yes.
Will change it.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
