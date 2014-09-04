From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Thu, 4 Sep 2014 08:03:59 +0200
Message-ID: <20140904080359.6b15cce5@bbrezillon>
References: <1409668935-10667-1-git-send-email-pankaj.dubey@samsung.com>
	<6034841.GFrG3XCMdb@wuerfel>
	<20140903151611.260a7218@bbrezillon>
	<4224773.hl3QDeILqz@wuerfel>
	<20140903161528.05f566e1@bbrezillon>
	<002701cfc7fb$110a7350$331f59f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <002701cfc7fb$110a7350$331f59f0$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, kgene.kim@samsung.com, linux@arm.linux.org.uk, 'Alexander Shiyan' <shc_work@mail.ru>, naushad@samsung.com, 'Tomasz Figa' <t.figa@samsung.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, tomasz.figa@gmail.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, lee.jones@linaro.org, 'Michal Simek' <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, 'Mark Brown' <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pankaj

On Thu, 04 Sep 2014 10:15:27 +0530
Pankaj Dubey <pankaj.dubey@samsung.com> wrote:

> Hi Boris,
> 
> On Wednesday, September 03, 2014 Boris BREZILLON wrote,
> > To: Arnd Bergmann
> > Cc: Pankaj Dubey; kgene.kim@samsung.com; linux@arm.linux.org.uk; Alexander
> > Shiyan; naushad@samsung.com; Tomasz Figa; linux-kernel@vger.kernel.org;
> > joshi@samsung.com; linux-samsung-soc@vger.kernel.org;
> thomas.ab@samsung.com;
> > tomasz.figa@gmail.com; vikas.sajjan@samsung.com; chow.kim@samsung.com;
> > lee.jones@linaro.org; Michal Simek; linux-arm-kernel@lists.infradead.org;
> Mark
> > Brown
> > Subject: Re: [PATCH v2] mfd: syscon: Decouple syscon interface from
> platform
> > devices
> > 
> > On Wed, 03 Sep 2014 15:49:04 +0200
> > Arnd Bergmann <arnd@arndb.de> wrote:
> > 
> > > On Wednesday 03 September 2014 15:16:11 Boris BREZILLON wrote:
> > > > I checked that part, and it appears most of the code is already
> > > > there (see usage of regmap_attach_dev function here [1]).
> > > >
> > > > The only problem I see is that errors are still printed with
> > > > dev_err, which, AFAIK, will trigger a kernel panic if dev is NULL.
> > >
> > > Actually not:
> > >
> > > static int __dev_printk(const char *level, const struct device *dev,
> > >                         struct va_format *vaf) {
> > >         if (!dev)
> > >                 return printk("%s(NULL device *): %pV", level, vaf);
> > >
> > >         return dev_printk_emit(level[1] - '0', dev,
> > >                                "%s %s: %pV",
> > >                                dev_driver_string(dev), dev_name(dev),
> > > vaf); }
> > >
> > 
> > My bad then (I don't know where I looked at to think NULL dev was not
> gracefully
> > handled :-)). Thanks for pointing this out.
> > Given that, I think it should work fine even with a NULL dev.
> > I'll give it a try on at91 ;-).
> > 
> 
> We have tested this patch, on Exynos board and found working well.
> In our use case DT based drivers such as USB Phy, SATA Phy, Watchdog are
> calling 
> syscon_regmap_lookup_by APIs to get regmap handle to Exynos PMU and it
> worked 
> well for these drivers. 

Great!

> 
> It would be great if after testing you share result here or give a
> Tested-By.

Yep, that's the idea.
Let me some time to rework the PMC drivers (drivers/clk/at91/pmc.c) and
test it, and I'll add my Tested-by ;-).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
