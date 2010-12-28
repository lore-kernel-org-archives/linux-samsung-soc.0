From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH] ARM: S5PV310: Implement kernel timers using MCT
Date: Tue, 28 Dec 2010 00:57:01 +0000
Message-ID: <20101228005701.GA2835@pulham.picochip.com>
References: <1293017221-31037-1-git-send-email-kgene.kim@samsung.com>
 <20101222123502.GB2838@pulham.picochip.com>
 <003d01cba28b$a2388cc0$e6a9a640$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:51281 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127Ab0L1A5F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Dec 2010 19:57:05 -0500
Received: by wwa36 with SMTP id 36so9433500wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Dec 2010 16:57:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <003d01cba28b$a2388cc0$e6a9a640$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jamie Iles' <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

On Thu, Dec 23, 2010 at 07:24:48PM +0900, Kukjin Kim wrote:
> Jamie Iles wrote:
> > > +irqreturn_t s5pv310_mct0_event_isr(int irq, void *dev_id)
> > > +{
> > > +	struct clock_event_device *evt;
> > > +
> > > +	/* Clear the MCT tick interrupt */
> > > +
> > > +	evt = &mct_tick0_device;
> > > +	if (evt->mode != CLOCK_EVT_MODE_PERIODIC)
> > > +		s5pv310_mct_tick_stop(MCT_TICK0);
> > 
> > I don't think you need to stop the timer here, the clockevents layer
> > will handle this for you.
> > 
> This is to support One-shot mode using MCT. Because basically MCT local
> timer only supports periodic mode.
> But will be added comment.

Actually I think you can simply remove the s5pv310_mct_tick_stop() 
altogether. The onestop event handlers should schedule the next expiry 
and will respect the min and max deltas so after the event the timer 
will be correctly programmed for the next event.

I had to try this on hardware to convince myself (the timers on my 
platform have the same behaviour) but it does work!

Jamie
