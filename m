From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Thu, 11 Apr 2013 00:35:47 +0200
Message-ID: <201304110035.47776.arnd@arndb.de>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <2359597.ofbj7Kvioz@flatron> <5357756.gKmBOZlWcd@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5357756.gKmBOZlWcd@flatron>
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
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: buserror-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christer-rKHMIqA5R6gwFerOooGFRg@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, kwangwoo.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ghcstop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, jekhor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Monday 08 April 2013, Tomasz Figa wrote:
> On Saturday 06 of April 2013 00:24:18 Tomasz Figa wrote:
> > On Friday 05 of April 2013 21:54:21 Arnd Bergmann wrote:
> > > On Friday 05 April 2013, Tomasz Figa wrote:
> > 
> > I'm not sure what you mean by a register-level interface. Something like
> > samsung_pwm_update_reg(reg, mask, val), which modifies bitfields
> > according to the mask and value with appropriate synchronization? If
> > yes, this solves only the problem of access to shared registers.
> > 
> > The other problems that remain:
> > 
> > - negotiation of PWM channels to use for clock source and clock events,
> >   because each board can use different channels for PWM outputs,
> > 
> > - code duplication caused by both of the drivers doing mostly the same
> >   things and or having to parse the same data from device tree,
> > 
> > - both non-DT and DT platforms must be supported,
> > 
> > - how to keep the ability to load PWM driver as a module (or not load it
> > at all when PWM is not used on particular board), while retaining
> > everything that is needed for the clocksource driver in kernel,
> > 
> > - some platforms can't use PWM timers as system clocksources, while on
> >   others this is the only timekeeping hardware available.
> > 
> 
> Hmm. Does anybody have an idea of a better way of implementing this PWM 
> timer support, which solves the above problems?
> 
> This series is a dependency for moving Universal C210 board to DT-based 
> description and it's already almost out of time to get this included for 
> 3.10...
> 

Sorry for not replying earlier. My idea for the register level interface
was to create a platform_device for each PWM, e.g. using the mfd_cell
infrastructure. You can then pass a "struct regmap" as the platform
data for each child of the timer node, and all the DT handling code
can stay in the parent driver.

	Arnd
