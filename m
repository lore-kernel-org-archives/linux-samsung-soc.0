From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v5 1/2] clk: samsung: exynos5440: move restart code into
 clock driver
Date: Wed, 19 Nov 2014 09:07:42 +0530
Message-ID: <000901d003aa$3490e8a0$9db2b9e0$@samsung.com>
References: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
 <1416307650-15162-2-git-send-email-pankaj.dubey@samsung.com>
 <546B62F3.3030807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16864 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753741AbaKSDhN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 22:37:13 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF900HTNOPYK0B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 12:37:10 +0900 (KST)
In-reply-to: <546B62F3.3030807@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net

On Tuesday, November 18, 2014 8:47 PM, Sylwester Nawrocki Wrote:
> On 18/11/14 11:47, Pankaj Dubey wrote:
> > Let's register restart handler for Exynos5440 from it's clock driver
> > for restart functionality. So that we can cleanup restart hooks from
> > machine specific file.
> >
> > CC: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > CC: Tomasz Figa <tomasz.figa@gmail.com>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> The patch looks good to me.
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Just one comment below.
> 

Thanks for review. 

> > ---
> >  arch/arm/mach-exynos/exynos.c        |   19 +------------------
> >  drivers/clk/samsung/clk-exynos5440.c |   29
> ++++++++++++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/exynos.c
> > b/arch/arm/mach-exynos/exynos.c index 8f638ad..8f995b7 100644
> > --- a/arch/arm/mach-exynos/exynos.c
> > +++ b/arch/arm/mach-exynos/exynos.c
> > @@ -89,24 +89,7 @@ static struct map_desc exynos5_iodesc[] __initdata
> > = {
> >
> >  static void exynos_restart(enum reboot_mode mode, const char *cmd)  {
> > -	struct device_node *np;
> > -	u32 val = 0x1;
> > -	void __iomem *addr = pmu_base_addr + EXYNOS_SWRESET;
> > -
> > -	if (of_machine_is_compatible("samsung,exynos5440")) {
> > -		u32 status;
> > -		np = of_find_compatible_node(NULL, NULL,
"samsung,exynos5440-
> clock");
> > -
> > -		addr = of_iomap(np, 0) + 0xbc;
> > -		status = __raw_readl(addr);
> > -
> > -		addr = of_iomap(np, 0) + 0xcc;
> > -		val = __raw_readl(addr);
> > -
> > -		val = (val & 0xffff0000) | (status & 0xffff);
> > -	}
> > -
> > -	__raw_writel(val, addr);
> > +	__raw_writel(0x1, pmu_base_addr + EXYNOS_SWRESET);
> >  }
> >
> 
> > +static int exynos5440_clk_restart_notify(struct notifier_block *this,
> > +		unsigned long code, void *unused)
> > +{
> > +	u32 val, status;
> > +
> > +	status = readl_relaxed(reg_base + 0xbc);
> > +	val = readl_relaxed(reg_base + 0xcc);
> > +	val = (val & 0xffff0000) | (status & 0xffff);
> > +	writel_relaxed(val, reg_base + 0xcc);
> 
> Can we have macro definitions for these 0xcc, 0xbc address offsets ?
> I must say I couldn't find them documented in any Exynos datasheet I've
got though.
> 

I also wished this, but I could not find them documented. 
So I tried to keep logic of original code as it is, just changed location. 
I would also like to mention that I have not tested this on exynos5440 as I
do not have
one with me. I believe if it was working at its original place in
exynos_restart it should work
here also. Other patch (2/2) I have verified on Exynos3250 board and its
working well.

Thanks,
Pankaj Dubey
> > +	return NOTIFY_DONE;
> > +}
> 
> --
> Regards,
> Sylwester
