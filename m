From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/7] Common Clock Framework support for Samsung S3C64xx
Date: Wed, 19 Jun 2013 16:23:45 +0200
Message-ID: <1617281.ftRel2CUbr@amdc1227>
References: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
 <51C1BD62.8050007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <51C1BD62.8050007-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 19 of June 2013 23:17:06 Kukjin Kim wrote:
> On 06/06/13 08:57, Tomasz Figa wrote:
> > This series is an attempt to move clock support on Samsung S3C64xx SoCs
> > to Common Clock Framework.
> 
> Looks good :)

Thanks.

> > First, support for PLL types present on S3C64xx SoCs is added to
> > Samsung
> > Common Clock Framework driver. Then the main clock driver for mentioned
> > SoCs is introduced. Further patches contain fixes for drivers to make
> > them compliant with CCF semantics, migration of platform code to use
> > the new clock driver and removal of old clock management code.
> > 
> > Depends on:
> >   - [PATCH 0/6] Samsung watchdog support clean-up
> >   
> >     http://thread.gmane.org/gmane.linux.kernel.samsung-soc/18736/focus=
> >     18989
> >   
> >   - [PATCH 00/15] Final Samsung PWM support cleanup
> >   
> >     http://www.spinics.net/lists/arm-kernel/msg248725.html
> 
> BTW, Tomasz, so how was going on above PWM patches?
> 

I have them ready now, but the PWM maintainer has some objections, which 
will hopefully be resolved soon.

Best regards,
Tomasz

> > On S3C6410-based Tiny6410 board (Mini6410-compatible):
> > 
> > Tested-by: Tomasz Figa<tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Tomasz Figa (7):
> >    clk: samsung: pll: Add support for PLL6552 and PLL6553
> >    clk: samsung: Add clock driver for S3C64xx SoCs
> >    ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
> >    ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
> >    usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
> >    ARM: s3c64xx: Migrate clock handling to Common Clock Framework
> >    ARM: s3c64xx: Remove old clock management code
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
