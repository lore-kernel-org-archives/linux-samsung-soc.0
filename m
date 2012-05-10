From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] drivers: genpd: let platform code to register devices into
 disabled domains
Date: Thu, 10 May 2012 14:46:19 +0200
Message-ID: <023801cd2eaa$e5ddf8a0$b199e9e0$%szyprowski@samsung.com>
References: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com>
 <201204292255.25438.rjw@sisk.pl>
 <06aa01cd2c54$c7d39660$577ac320$%szyprowski@samsung.com>
 <201205072045.02505.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:49319 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133Ab2EJMqa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 08:46:30 -0400
In-reply-to: <201205072045.02505.rjw@sisk.pl>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hi Rafael,

On Monday, May 07, 2012 8:45 PM Rafael J. Wysocki wrote:

> On Monday, May 07, 2012, Marek Szyprowski wrote:
> > Hi Rafael,
> >
> > I'm sorry for a late reply, I was on holidays last week and just got back to
> > the office.
> >
> > On Sunday, April 29, 2012 10:55 PM Rafael J. Wysocki wrote:
> >
> > > On Friday, April 06, 2012, Marek Szyprowski wrote:
> > > > Some bootloaders disable power domains on boot and the platform startup
> > > > code registers them in the 'disabled' state. Current gen_pd code assumed
> > > > that the devices can be registered only to the power domain which is in
> > > > 'enabled' state and these devices are active at the time of the
> > > > registration. This is not correct in our case. This patch lets drivers
> > > > to be registered into 'disabled' power domains and finally solves
> > > > mysterious freezes and lack of resume/suspend calls on Samsung Exynos4
> > > > NURI and UniversalC210 platforms.
> > > >
> > > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > > ---
> > > >  drivers/base/power/domain.c |    7 +------
> > > >  1 files changed, 1 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> > > > index 73ce9fb..05f5799f 100644
> > > > --- a/drivers/base/power/domain.c
> > > > +++ b/drivers/base/power/domain.c
> > > > @@ -1211,11 +1211,6 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct
> > > device *dev,
> > > >
> > > >  	genpd_acquire_lock(genpd);
> > > >
> > > > -	if (genpd->status == GPD_STATE_POWER_OFF) {
> > > > -		ret = -EINVAL;
> > > > -		goto out;
> > > > -	}
> > > > -
> > > >  	if (genpd->prepared_count > 0) {
> > > >  		ret = -EAGAIN;
> > > >  		goto out;
> > > > @@ -1239,7 +1234,7 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct
> > > device *dev,
> > > >  	dev_pm_get_subsys_data(dev);
> > > >  	dev->power.subsys_data->domain_data = &gpd_data->base;
> > > >  	gpd_data->base.dev = dev;
> > > > -	gpd_data->need_restore = false;
> > > > +	gpd_data->need_restore = true;
> > >
> > > I think that should be:
> > >
> > > +	gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
> > >
> > > Otherwise, on the next domain power off the device's state won't be saved.
> > >
> > > >  	list_add_tail(&gpd_data->base.list_node, &genpd->dev_list);
> > > >  	if (td)
> > > >  		gpd_data->td = *td;
> >
> > I've tested the above change and there is problem. Let me explain in detail the
> > sw/hw configuration I have.
> >
> > There is a power domain and the device driver. The device itself also has it's own
> > power management code (which enables and disables clocks).  Some power domains are
> > disabled by bootloader and some devices in the active power domains have their
> > clocks disabled too. In the current runtime pm code the devices were probed in
> > 'disabled' state and had to enable itself by calling get_runtime_sync(). My initial
> > patch restored runtime pm handling to the old state (the same which was with non
> > gen_pd based driver or no power domain driver at all, where runtime pm was handled
> > by platform bus). If I apply your patch the runtime_restore
> 
> I guess you mean .runtime_resume().
> 
> > callback is not called on first driver probe for devices inside the domain which
> > has been left enabled by the bootloader.
> 
> I don't see why .probe() should depend on the runtime PM framework to call
> .runtime_resume() for it.  It looks like .probe() could just call
> .runtime_resume() directly if needed.
> 
> Besides, your change breaks existing code as I said.

Before using gen_pd power domains we had the following flow of calls/controls:

1. fimc_probe(fimd_pdev)
...
2. pm_runtime_enable(fimd_pdev->dev)
3. pm_runtime_get_sync(fimd_pdev->dev)
	3a. parent device's runtime_resume()
	3b. fimc_runtime_resume(fimd_pdev->dev)
...
4. pm_runtime_put(fimd_pdev->dev)
...
5. (runtime put timer kicks off)
	5a. fimc_runtime_put(fimd_pdev->dev)
	5b. parent device's runtime_suspend()

(this flow assumed that fimc device was the only child of its parent platform device).

Now with power gen_pd driver with my patch I get the following call sequence:

1. fimc_probe(fimd_pdev)
...
2. pm_runtime_enable(fimd_pdev->dev)
3. pm_runtime_get_sync(fimd_pdev->dev)
	3a. gen_pd pd_power_on(...)
	3b. fimc_runtime_resume(fimd_pdev->dev)
4. pm_runtime_put(fimd_pdev->dev)
...
5. (runtime put timer kicks off)
	5a. fimc_runtime_put(fimd_pdev->dev)
	5b. gen_pd pd_power_off (...)

so it works like before.

Now with your suggested change I get following call sequence:

1. fimc_probe(fimc_pdev)
...
2. pm_runtime_enable(fimd_pdev->dev)
3. pm_runtime_get_sync(fimd_pdev->dev)
	(gen_pd finds that the power domain is already activated)
...
4. pm_runtime_put(fimd_pdev->dev)
...
5. (runtime put timer kicks off)
	5a. fimc_runtime_put(fimd_pdev->dev)
	5b. gen_pd pd_power_off (...)

As you can notice in point 3, gen_pd driver checks its internal state,
finds that the power domain is already enabled and skips calling 
fimc_runtime_resume(). This breaks the driver which worked fine before.
Please notice that fimc_runtime_resume() does something completely 
different than the power domain driver and those operations are essential
for getting the driver to work correctly.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
