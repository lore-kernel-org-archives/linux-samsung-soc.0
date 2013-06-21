From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 4/8] ARM: Add .init_platform() callback to machine descriptor
Date: Fri, 21 Jun 2013 16:12:15 +0200
Message-ID: <201306211612.15508.arnd@arndb.de>
References: <1371774924-9224-1-git-send-email-tomasz.figa@gmail.com> <51C429F4.60709@arm.com> <72209947.cQvP4jsDBz@amdc1227>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:53699 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422676Ab3FUOMZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 10:12:25 -0400
In-Reply-To: <72209947.cQvP4jsDBz@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Benoit Cousson <benoit.cousson@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jason Cooper <jason@lakedaemon.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <Will.Deacon@arm.com>

On Friday 21 June 2013, Tomasz Figa wrote:

> > To me, this new hook is strictly equivalent to init_irq. What do we gain
> > exactly? I didn't think init_irq was going away...
> > 
> > I know init_irq is not pretty, and we tend to overload it with other
> > stuff, but I don't really see the point of adding a new callback that
> > has the exact same properties.
> 
> Well, it doesn't really give us any functional benefits.
> 
> However in my opinion it looks much saner in case of DT-only platforms that 
> don't need any specific IRQ initialization, but need to call some platform 
> specific initialization routines, after memory management, but before 
> anything else is initialized.
> 
> This way irqchip_init() doesn't have to be explicitly called in platform 
> code.
> 
> Anyway, I don't have any strong opinion on this. If it is perfectly fine to 
> abuse irqchip_init() for anything that must be done at this stage of boot, 
> then I'm fine with this either and will modify the board file from further 
> patch from this series to not rely on this change any more.

Your init_platform only has these two calls in it:

+       of_clk_init(NULL);
+       samsung_wdt_reset_of_init();

Presumably you need of_clk_init() for the watchdog to work. But do you actually
need to initialize the reset logic this early? Why not turn
samsung_wdt_reset_of_init into a standalone driver, or call it from init_machine?

I would actually like to call of_clk_init from common code at some point
between init_irq and init_time, although I'm not sure if some platforms
need it to be called before init_irq.

	Arnd
