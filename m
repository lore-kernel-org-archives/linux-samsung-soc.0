From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] drivers: genpd: let platform code to register devices into disabled domains
Date: Tue, 1 May 2012 21:17:39 +0200
Message-ID: <201205012117.39750.rjw@sisk.pl>
References: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com> <201204292255.25438.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:47979 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751846Ab2EATMy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 May 2012 15:12:54 -0400
In-Reply-To: <201204292255.25438.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On Sunday, April 29, 2012, Rafael J. Wysocki wrote:
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
> > @@ -1211,11 +1211,6 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct device *dev,
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
> > @@ -1239,7 +1234,7 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct device *dev,
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

Ping?
