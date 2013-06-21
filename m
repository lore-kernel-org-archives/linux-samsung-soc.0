From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v6 4/8] ARM: Add .init_platform() callback to machine
 descriptor
Date: Fri, 21 Jun 2013 13:14:34 +0200
Message-ID: <72209947.cQvP4jsDBz@amdc1227>
References: <1371774924-9224-1-git-send-email-tomasz.figa@gmail.com>
 <1371774924-9224-5-git-send-email-tomasz.figa@gmail.com>
 <51C429F4.60709@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <51C429F4.60709@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Benoit Cousson <benoit.cousson@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jason Cooper <jason@lakedaemon.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <Will.Deacon@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marc,

On Friday 21 of June 2013 11:24:52 Marc Zyngier wrote:
> On 21/06/13 01:35, Tomasz Figa wrote:
> 
> Hi Tomasz,
> 
> > Most ARM platforms have parts that should be initialized as early as
> > possible, which usually means as soon as memory management (kmalloc,
> > ioremap) starts to work,
> > 
> > However, currently there is no appropriate callback in machine_desc
> > struct to use for such initialization and platforms tend to stuff
> > things
> > up .init_irq() and .init_time() callbacks.
> > 
> > Since all the DT-based platforms are going towards generic IRQ and time
> > initialization (using irqchip_init and clocksource_of_init) and current
> > code assumes that if custom callbacks are not provided in machine_desc
> > then generic ones should be used, this problem has become a bit more
> > inconvenient.
> > 
> > This patch tries to solve this issue by introducing new callback called
> > .init_platform(), where any custom low level initialization of platform
> > can be done safely.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> > 
> >  arch/arm/include/asm/mach/arch.h | 1 +
> >  arch/arm/kernel/irq.c            | 3 +++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/include/asm/mach/arch.h
> > b/arch/arm/include/asm/mach/arch.h index 308ad7d..b2f4d11 100644
> > --- a/arch/arm/include/asm/mach/arch.h
> > +++ b/arch/arm/include/asm/mach/arch.h
> > @@ -46,6 +46,7 @@ struct machine_desc {
> > 
> >  	void			(*reserve)(void);/* reserve mem blocks	*/
> >  	void			(*map_io)(void);/* IO mapping function	*/
> >  	void			(*init_early)(void);
> > 
> > +	void			(*init_platform)(void);
> > 
> >  	void			(*init_irq)(void);
> >  	void			(*init_time)(void);
> >  	void			(*init_machine)(void);
> > 
> > diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
> > index 9723d17..61e2000 100644
> > --- a/arch/arm/kernel/irq.c
> > +++ b/arch/arm/kernel/irq.c
> > @@ -115,6 +115,9 @@ EXPORT_SYMBOL_GPL(set_irq_flags);
> > 
> >  void __init init_IRQ(void)
> >  {
> > 
> > +	if (machine_desc->init_platform)
> > +		machine_desc->init_platform();
> > +
> > 
> >  	if (IS_ENABLED(CONFIG_OF) && !machine_desc->init_irq)
> >  	
> >  		irqchip_init();
> >  	
> >  	else
> 
> To me, this new hook is strictly equivalent to init_irq. What do we gain
> exactly? I didn't think init_irq was going away...
> 
> I know init_irq is not pretty, and we tend to overload it with other
> stuff, but I don't really see the point of adding a new callback that
> has the exact same properties.

Well, it doesn't really give us any functional benefits.

However in my opinion it looks much saner in case of DT-only platforms that 
don't need any specific IRQ initialization, but need to call some platform 
specific initialization routines, after memory management, but before 
anything else is initialized.

This way irqchip_init() doesn't have to be explicitly called in platform 
code.

Anyway, I don't have any strong opinion on this. If it is perfectly fine to 
abuse irqchip_init() for anything that must be done at this stage of boot, 
then I'm fine with this either and will modify the board file from further 
patch from this series to not rely on this change any more.

Best regards,
Tomasz

> 
> 	M.
