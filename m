From: Dong Aisheng <b29396@freescale.com>
Subject: Re: [PATCH v3] mfd: syscon: Decouple syscon interface from
 platform devices
Date: Thu, 18 Sep 2014 11:07:24 +0800
Message-ID: <20140918030722.GB26661@shlinux1.ap.freescale.net>
References: <1410935510-1567-1-git-send-email-pankaj.dubey@samsung.com>
 <201409171723.04549.arnd@arndb.de>
 <000001cfd2f0$c9d0ebd0$5d72c370$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bl2on0144.outbound.protection.outlook.com ([65.55.169.144]:51756
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757263AbaIRDdv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 23:33:51 -0400
Content-Disposition: inline
In-Reply-To: <000001cfd2f0$c9d0ebd0$5d72c370$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org, tomasz.figa@gmail.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com, kgene.kim@samsung.com

On Thu, Sep 18, 2014 at 08:59:32AM +0530, Pankaj Dubey wrote:
> +CC: Dong Aisheng 
> 
> Hi Arnd,
> 
> On Wednesday, September 17, 2014, Arnd Bergmann wrote,
> > > V2 of this patchset and related discussion can be found here [1].
> > >
> > > Changes since v2:
> > >  - Added back platform device support from syscon, with one change that
> > >    syscon will not be probed for DT based platform.
> > >  - Added back syscon_regmap_lookup_by_pdevname API so that non-DT base
> > >    users of syscon will not be broken.
> > >  - Removed unwanted change in syscon.h.
> > >  - Modified Signed-off-by list, added Suggested-by of Tomasz Figa and
> > >    Arnd Bergmann.
> > >  - Added Tested-by of Vivek Gautam for testing on Exynos platform.
> > 
> > Looks fine. Provided you can figure out the problem that Dong Aisheng
> reported,
> > please add my
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> 
> Thanks. 
> After he reported I have again done code walk-through of regmap_init_mmio
> and 
> could not see any such fatal error.  At the same time I have replied to Dong
> Aisheng,
> asking for more details and waiting for his reply. 
>  

I just replied and gave the log.

Regards
Dong Aisheng

> > > -}
> > > +static struct syscon *of_syscon_register(struct device_node *np);
> > >
> > 
> > One  minor comment: please avoid doing forward declarations of local
> functions. It
> > took me a while to understand what is going on because I expect all
> functions to be
> > ordered such that they only get called by functions below, and don't need
> this.
> > 
> > Just move of_syscon_register() here directly.
> > 
> 
> OK, I will remove forward declaration of "of_syscon_register" and respin
> patch once again.
> 
> > 	Arnd
> 
> Thanks,
> Pankaj Dubey
> 
