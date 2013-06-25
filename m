From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 11/18] pwm: Add new pwm-samsung driver
Date: Tue, 25 Jun 2013 13:19:54 +0200
Message-ID: <1688471.WOi6pAAcEq@amdc1227>
References: <1371766383-29077-1-git-send-email-tomasz.figa@gmail.com>
 <1405696.in3RSSDWnX@flatron> <20130625102646.GC21137@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52103 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752471Ab3FYLT5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 07:19:57 -0400
In-reply-to: <20130625102646.GC21137@manwe>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On Tuesday 25 of June 2013 12:26:47 Thierry Reding wrote:
> On Mon, Jun 24, 2013 at 11:17:03PM +0200, Tomasz Figa wrote:
> > On Monday 24 of June 2013 22:53:42 Thierry Reding wrote:
> > > On Mon, Jun 24, 2013 at 10:32:55PM +0200, Tomasz Figa wrote:
> [...]
> 
> > > > What about:
> > > > 
> > > > /*
> > > > 
> > > >  * PWM block is shared between pwm-samsung and samsung_pwm_timer
> > > >  drivers
> > > >  * and some registers need access synchronization. If both drivers
> > > >  are
> > > >  * compiled in, the spinlock is defined in the clocksource driver,
> > > >  * otherwise following definition is used.
> > > >  *
> > > >  * Currently we do not need any more complex synchronization method
> > > >  * because all the supported SoCs contain only one instance of the
> > > >  PWM
> > > >  * IP. Should this change, both drivers will need to be modified to
> > > >  * properly synchronize accesses to particular instances.
> > > >  */
> > > 
> > > I see that you can't be persuaded. And everybody else seems to be
> > > okay
> > > with it so... have it your way. I'm probably going to regret this.
> > 
> > This was just a proposal. Do you want anything else to be added to the
> > comment or anything to be changed?
> 
> For reference, I still don't like this but since I'm the only one
> complaining, go ahead. With that comment added to the driver:
> 
> Acked-by: Thierry Reding <thierry.reding@gmail.com>

OK. Thank you.

Kukjin, can you amend the comment I mentioned to this patch above the line 
with DEFINE_SPINLOCK or I should send fixed version?

Best regards,
Tomasz
