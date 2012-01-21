From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 22:23:53 +0100
Message-ID: <201201212223.54801.heiko@sntech.de>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com> <20120121183155.GE10751@opensource.wolfsonmicro.com> <4F1B2235.4000009@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F1B2235.4000009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Am Samstag 21 Januar 2012, 21:38:13 schrieb Sylwester Nawrocki:
> On 01/21/2012 07:31 PM, Mark Brown wrote:
> > On Sat, Jan 21, 2012 at 04:52:58PM +0100, Sylwester Nawrocki wrote:
> >> On 01/21/2012 02:28 PM, Mark Brown wrote:
> > that the rather serious problems with getting I2C patches applied I'd
> > rather do as little as possible in individual patches.
> > 
> > It would also introduce a regression for systems that don't use runtime
> > PM (probably most s3c24xx ones).
> 
> Indeed, I'd forgotten about this fact for a while. I suspect the Run-time
> PM core functionality could be enabled on those platform, allowing to make
> the common driver dependant on PM_RUNTIME. Not sure if that's acceptable
> for the smaller SoCs though. It rather sounds more like lots of trouble
> for little benefits. Maybe it's desirable to do that at some point anyway.

At least S3C2416/S3C2450 and S3C2412 (i.e. the ARMv5 SoCs) might profit from 
it, as they also support the idle modes (stop modes) that Mark is targetting 
with his patches in the long run.

Not sure about the 2410, 2440 and 2443 currently

Heiko
