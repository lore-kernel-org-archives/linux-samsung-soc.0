From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 4/8] ARM: Add .init_platform() callback to machine
 descriptor
Date: Sat, 22 Jun 2013 12:14:44 +0200
Message-ID: <6564540.EvIEu9dlOG@flatron>
References: <1371774924-9224-1-git-send-email-tomasz.figa@gmail.com>
 <72209947.cQvP4jsDBz@amdc1227> <201306211612.15508.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306211612.15508.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benoit Cousson <benoit.cousson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 21 of June 2013 16:12:15 Arnd Bergmann wrote:
> On Friday 21 June 2013, Tomasz Figa wrote:
> > > To me, this new hook is strictly equivalent to init_irq. What do we
> > > gain exactly? I didn't think init_irq was going away...
> > > 
> > > I know init_irq is not pretty, and we tend to overload it with other
> > > stuff, but I don't really see the point of adding a new callback
> > > that
> > > has the exact same properties.
> > 
> > Well, it doesn't really give us any functional benefits.
> > 
> > However in my opinion it looks much saner in case of DT-only platforms
> > that don't need any specific IRQ initialization, but need to call
> > some platform specific initialization routines, after memory
> > management, but before anything else is initialized.
> > 
> > This way irqchip_init() doesn't have to be explicitly called in
> > platform code.
> > 
> > Anyway, I don't have any strong opinion on this. If it is perfectly
> > fine to abuse irqchip_init() for anything that must be done at this
> > stage of boot, then I'm fine with this either and will modify the
> > board file from further patch from this series to not rely on this
> > change any more.
> 
> Your init_platform only has these two calls in it:
> 
> +       of_clk_init(NULL);
> +       samsung_wdt_reset_of_init();
> 
> Presumably you need of_clk_init() for the watchdog to work.

Clock initialization is also required for timekeeping to work, so if we 
had to defer it, it must happen before (or inside) init_time().

Putting this platform aside, there might be other platforms which require 
clock initialization before IRQ initialization, e.g. to enable clock of an 
interrupt controller.

> But do you
> actually need to initialize the reset logic this early? Why not turn
> samsung_wdt_reset_of_init into a standalone driver, or call it from
> init_machine?

This is debatable. One might want to have reset support working as early 
as possible to have panic timeout working, but I'm not sure if there is 
any point of rebooting the machine if the kernel fails so early.

Personally I'd prefer this to be a separate driver, in 
drivers/power/reset/ or wherever appropriate, but I didn't want to change 
existing behavior too much, which was the reset working already after 
clock initialization.

> I would actually like to call of_clk_init from common code at some point
> between init_irq and init_time, although I'm not sure if some platforms
> need it to be called before init_irq.

Now as I think of it, some platforms might need it earlier, some later, so 
my init_platform(), which is not flexible at all, would be useless for 
some of them, that need such things done after init_irq().

I'm going to drop this patch from this series (and simply abuse one of 
existing callbacks instead), but we should think about a better solution 
for this issue.

Best regards,
Tomasz

> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
