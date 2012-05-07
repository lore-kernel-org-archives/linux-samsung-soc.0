From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] drivers: genpd: let platform code to register devices into
 disabled domains
Date: Mon, 07 May 2012 15:24:50 +0200
Message-ID: <06aa01cd2c54$c7d39660$577ac320$%szyprowski@samsung.com>
References: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com>
 <201204292255.25438.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24711 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756236Ab2EGNY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 May 2012 09:24:56 -0400
In-reply-to: <201204292255.25438.rjw@sisk.pl>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hi Rafael,

I'm sorry for a late reply, I was on holidays last week and just got back to 
the office.

On Sunday, April 29, 2012 10:55 PM Rafael J. Wysocki wrote:

> On Friday, April 06, 2012, Marek Szyprowski wrote:
> > Some bootloaders disable power domains on boot and the platform startup
> > code registers them in the 'disabled' state. Current gen_pd code assumed
> > that the devices can be registered only to the power domain which is in
> > 'enabled' state and these devices are active at the time of the
> > registration. This is not correct in our case. This patch lets drivers
> > to be registered into 'disabled' power domains and finally solves
> > mysterious freezes and lack of resume/suspend calls on Samsung Exynos4
> > NURI and UniversalC210 platforms.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  drivers/base/power/domain.c |    7 +------
> >  1 files changed, 1 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> > index 73ce9fb..05f5799f 100644
> > --- a/drivers/base/power/domain.c
> > +++ b/drivers/base/power/domain.c
> > @@ -1211,11 +1211,6 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct
> device *dev,
> >
> >  	genpd_acquire_lock(genpd);
> >
> > -	if (genpd->status == GPD_STATE_POWER_OFF) {
> > -		ret = -EINVAL;
> > -		goto out;
> > -	}
> > -
> >  	if (genpd->prepared_count > 0) {
> >  		ret = -EAGAIN;
> >  		goto out;
> > @@ -1239,7 +1234,7 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct
> device *dev,
> >  	dev_pm_get_subsys_data(dev);
> >  	dev->power.subsys_data->domain_data = &gpd_data->base;
> >  	gpd_data->base.dev = dev;
> > -	gpd_data->need_restore = false;
> > +	gpd_data->need_restore = true;
> 
> I think that should be:
> 
> +	gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
> 
> Otherwise, on the next domain power off the device's state won't be saved.
> 
> >  	list_add_tail(&gpd_data->base.list_node, &genpd->dev_list);
> >  	if (td)
> >  		gpd_data->td = *td;

I've tested the above change and there is problem. Let me explain in detail the 
sw/hw configuration I have.

There is a power domain and the device driver. The device itself also has it's own 
power management code (which enables and disables clocks).  Some power domains are 
disabled by bootloader and some devices in the active power domains have their 
clocks disabled too. In the current runtime pm code the devices were probed in
'disabled' state and had to enable itself by calling get_runtime_sync(). My initial
patch restored runtime pm handling to the old state (the same which was with non 
gen_pd based driver or no power domain driver at all, where runtime pm was handled
by platform bus). If I apply your patch the runtime_restore callback is not called
on first driver probe for devices inside the domain which has been left enabled by
the bootloader.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
