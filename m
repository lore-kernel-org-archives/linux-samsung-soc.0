From: Ben Dooks <ben-i2c@fluff.org>
Subject: Re: [PATCH 2/2] arm: dt: Add device tree support for i2c instance
	1 on exynos4 dt machine
Date: Mon, 18 Jul 2011 10:45:34 +0100
Message-ID: <20110718094534.GN15795@trinity.fluff.org>
References: <1310950241-13602-1-git-send-email-thomas.abraham@linaro.org> <1310950241-13602-3-git-send-email-thomas.abraham@linaro.org> <20110718043059.GB15023@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57784 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755182Ab1GRJpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 05:45:38 -0400
Content-Disposition: inline
In-Reply-To: <20110718043059.GB15023@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, patches@linaro.org

On Sun, Jul 17, 2011 at 10:30:59PM -0600, Grant Likely wrote:
> On Mon, Jul 18, 2011 at 06:20:41AM +0530, Thomas Abraham wrote:
> > Add device node for i2c instance 1 and list all its connected slave
> > devices.
> > 
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > ---
> >  arch/arm/boot/dts/exynos4-smdkv310.dts  |   19 ++++++++++++++++++-
> >  arch/arm/mach-exynos4/Kconfig           |    1 +
> >  arch/arm/mach-exynos4/mach-exynos4-dt.c |    9 +++++++++
> >  3 files changed, 28 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/exynos4-smdkv310.dts
> > index d65c18c..29c40ed 100644
> > --- a/arch/arm/boot/dts/exynos4-smdkv310.dts
> > +++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
> > @@ -23,7 +23,7 @@
> >  	};
> >  
> >  	chosen {
> > -		bootargs = "root=/dev/mmcblk0p1 rootfstype=ext3 rootwait console=ttySAC1,115200";
> > +		bootargs = "root=/dev/mmcblk0p1 rootfstype=ext3 rootwait console=ttySAC1,115200 init=/linuxrc";
> >  	};
> >  
> >  	soc {
> > @@ -64,5 +64,22 @@
> >  			samsung,sdhci-cd-type = <0>;
> >  			samsung,sdhci-clkdiv-external;
> >  		};
> > +
> > +		i2c@13870000 {
> > +			compatible = "samsung,s3c2440-i2c";
> > +			reg = <0x13870000 0x100>;
> > +			interrupts = <345>;
> > +			samsung,i2c-bus-number = <1>;
> > +			samsung,i2c-slave-addr = <16>;
> > +			samsung,i2c-sda-delay = <100>;
> > +			samsung,i2c-max-bus-freq = <100000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			wm8994@1a {
> > +				compatible = "wlf,wm8994";
> > +				reg = <0x1a>;
> > +			};
> > +		};
> >  	};
> >  };
> > diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> > index bb97b7e..c7fce3e 100644
> > --- a/arch/arm/mach-exynos4/Kconfig
> > +++ b/arch/arm/mach-exynos4/Kconfig
> > @@ -193,6 +193,7 @@ config MACH_EXYNOS4_DT
> >  	select S3C_DEV_HSMMC
> >  	select S3C_DEV_HSMMC2
> >  	select EXYNOS4_SETUP_SDHCI
> > +	select EXYNOS4_SETUP_I2C1
> >  	help
> >  	  Machine support for Samsung Exynos4 machine with device tree enabled.
> >  
> > diff --git a/arch/arm/mach-exynos4/mach-exynos4-dt.c b/arch/arm/mach-exynos4/mach-exynos4-dt.c
> > index 120665a..ef6b4cb 100644
> > --- a/arch/arm/mach-exynos4/mach-exynos4-dt.c
> > +++ b/arch/arm/mach-exynos4/mach-exynos4-dt.c
> > @@ -23,7 +23,10 @@
> >  #include <plat/regs-serial.h>
> >  #include <plat/exynos4.h>
> >  #include <plat/cpu.h>
> > +#include <plat/devs.h>
> >  #include <plat/sdhci.h>
> > +#include <plat/iic.h>
> > +#include <plat/iic-core.h>
> >  
> >  #include <mach/map.h>
> >  
> > @@ -62,6 +65,10 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
> >  	},
> >  };
> >  
> > +static struct s3c2410_platform_i2c exynos4_dt_i2c_data1 __initdata = {
> > +	.cfg_gpio	= s3c_i2c1_cfg_gpio,
> > +};
> > +
> >  /*
> >   * The following lookup table is used to override device names when devices
> >   * are registered from device tree. Optionally, the platform data can also
> > @@ -75,6 +82,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
> >  				"s3c-sdhci.2", &s3c_hsmmc2_def_platdata),
> >  	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", EXYNOS4_PA_HSMMC(0),
> >  				"s3c-sdhci.0", &s3c_hsmmc0_def_platdata),
> > +	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(1),
> > +				"s3c2440-i2c.1", &exynos4_dt_i2c_data1),
> 
> Should not need the platform_data here.  Add DT support to the GPIO
> driver and decode the data from there (which should be easy).

Hmm, do we have any sane way of passing which configuration settings
should be applied to the gpio pins (given that there can be up to 13
non-IO settings for some of these pins).

Also, since this data is really part of the SoC, I don't really want
to see n different .dts files hanging around with the same information
in it.

Maybe it is time for a standardised callback to allow devices to connect
themselves to the pins they need, and have dt capability of over-riding
the information if it needs it.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
