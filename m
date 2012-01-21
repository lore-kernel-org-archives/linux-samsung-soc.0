From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 21:33:25 +0000
Message-ID: <20120121213324.GB8331@opensource.wolfsonmicro.com>
References: <1327171600-5489-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <4F1B2D40.70202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1B2D40.70202-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jan 21, 2012 at 10:25:20PM +0100, Sylwester Nawrocki wrote:
> On 01/21/2012 07:46 PM, Mark Brown wrote:
> > Add stub runtime_pm calls which go through the flow of enabling and
> > disabling but don't actually do anything with the device itself as
> > there's nothing useful we can do. This provides the core PM framework
> > with information about when the device is idle, enabling chip wide
> > power savings.

> Sorry, unless I'm missing something, currently there is no clock or
> power domain drivers for the I2C controllers in any SoC versions this
> driver is used with. So it seems like this patch introduces just 
> an overhead of pm_runtime calls, in addition to clk_enable/disable. 

> I can't see what the PM core would use the information about device's
> power state for. Is there really anything else, regarding I2C controllers
> power management, than can be done except individual devices' clock 
> gating ?

Lots of the SoCs have system wide WFI modes (like the STOP and DEEP-STOP
modes of the S3C64xx) which will gate the power to the I2C controller
and also do system wide things like put the RAM into self refresh mode.
These modes all require that the device be idle at the SoC level so we
need to know that all the IPs within the SoC are quiesced which is what
I'm shooting for with all these patches.  The wins from these modes are
definitely worth the effort.
