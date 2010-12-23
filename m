From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV310: Implement kernel timers using MCT
Date: Thu, 23 Dec 2010 19:24:48 +0900
Message-ID: <003d01cba28b$a2388cc0$e6a9a640$%kim@samsung.com>
References: <1293017221-31037-1-git-send-email-kgene.kim@samsung.com>
 <20101222123502.GB2838@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18526 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751661Ab0LWKYx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 05:24:53 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LDV00DHVM9FP200@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Dec 2010 19:24:51 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LDV00520M9F9Z@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Dec 2010 19:24:51 +0900 (KST)
In-reply-to: <20101222123502.GB2838@pulham.picochip.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jamie Iles' <jamie@jamieiles.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

Jamie Iles wrote:
> 
> Hi Kukjin,
> 
Hi Jamie :-)

> Just trying to learn what other people are doing in their platforms, so
> apologies if my comments aren't applicable! Looks good to me though.
> 
No problem, thanks for your comments and always welcome to review ;-)

(snip)

> > +
> > +static struct clock_event_device mct_tick1_device = {
> > +	.name		= "mct-tick1",
> > +	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> > +	.rating		= 450,
> > +	.shift		= 20,
> > +	.set_next_event	= s5pv310_tick1_set_next_event,
> > +	.set_mode	= s5pv310_tick1_set_mode,
> > +};
> 
> Do you need to specify .shift here? Could you use
> clockevents_calc_mult_shift() to calculate mult and shift for you?
> 
Oh, yeah...Mr. Youn and I didn't notice the existence of it...will fix.

> > +irqreturn_t s5pv310_mct0_event_isr(int irq, void *dev_id)
> > +{
> > +	struct clock_event_device *evt;
> > +
> > +	/* Clear the MCT tick interrupt */
> > +
> > +	evt = &mct_tick0_device;
> > +	if (evt->mode != CLOCK_EVT_MODE_PERIODIC)
> > +		s5pv310_mct_tick_stop(MCT_TICK0);
> 
> I don't think you need to stop the timer here, the clockevents layer
> will handle this for you.
> 
This is to support One-shot mode using MCT. Because basically MCT local
timer only supports periodic mode.
But will be added comment.

> [...]
> > +static void s5pv310_mct_clockevent_init(struct clock_event_device *dev)
> > +{
> > +	dev->mult = div_sc(clk_rate / 2, NSEC_PER_SEC, dev->shift);
> > +
> > +	dev->max_delta_ns = clockevent_delta2ns(0xfffffff, dev);
> 
> Is there a reason that the delta is only using 28 bits here?
> 
Oh, your pointing out is right...Its max delta should be 31 bits.
Will fix it...and correct value is 0x7fffffff.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
