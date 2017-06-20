From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V10 1/3] irq: Allow to pass the IRQF_TIMER flag with
 percpu irq request
Date: Tue, 20 Jun 2017 22:29:36 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1706202228490.2157@nanos>
References: <20170612135108.GD2261@mai> <1497275529-23565-1-git-send-email-daniel.lezcano@linaro.org> <alpine.DEB.2.20.1706201520290.1869@nanos> <20170620202552.GA1812@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:46026 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbdFTUbQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 16:31:16 -0400
In-Reply-To: <20170620202552.GA1812@mai>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, vincent.guittot@linaro.org, peterz@infradead.org, rafael@kernel.org, nicolas.pitre@linaro.org, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <vgupta@synopsys.com>, Marc Zyngier <marc.zyngier@arm.com>, Patrice Chotard <patrice.chotard@st.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Christoffer Dall <christoffer.dall@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Richard Cochran <rcochran@linutronix.de>, Ray Jui <ray.jui@broadcom.com>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>, moderated list:ARM

On Tue, 20 Jun 2017, Daniel Lezcano wrote:
> On Tue, Jun 20, 2017 at 04:05:07PM +0200, Thomas Gleixner wrote:
> > On Mon, 12 Jun 2017, Daniel Lezcano wrote:
> > > But, the API request_percpu_irq does not allow to pass a flag, hence specifying
> > > if the interrupt type is a timer.
> > > 
> > > Add a function request_percpu_irq_flags() where we can specify the flags. The
> > > request_percpu_irq() function is changed to be a wrapper to
> > > request_percpu_irq_flags() passing a zero flag parameter.
> > 
> > And exactly this change wants to be a separate patch. We do not make whole
> > sale changes this way. You should know that already and someone pointed
> > that out to you in some of the earlier versions.
> > 
> > > -int request_percpu_irq(unsigned int irq, irq_handler_t handler,
> > > -		       const char *devname, void __percpu *dev_id)
> > > +int request_percpu_irq_flags(unsigned int irq, irq_handler_t handler,
> > 
> > The function name sucks. The first time I read it, it meant request the per
> > cpu irq flags, which is not what you aim at, right?
> > 
> > Please make that __request_percpu_irq() for now and on -rc1 time provide a
> > patch set to convert all current request_percpu_irq() users to have the
> > extra argument and then remove the __request_percpu_irq() intermediate.
> 
> Ok, I will the change this way.
> 
> What about 2/3 and 3/3? Is it possible to take them with the
> __request_percpu_irq change?

The rest looks ok. Please repost.
