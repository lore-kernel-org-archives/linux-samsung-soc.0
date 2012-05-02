From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] drivers: genpd: let platform code to register devices
 into disabled domains
Date: Wed, 2 May 2012 14:03:07 +0900
Message-ID: <CAH9JG2VG0X5XCshyBOq7f6OsHiDrNLoMjp=ehp+K0njOOCkwyg@mail.gmail.com>
References: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com>
	<201204292255.25438.rjw@sisk.pl>
	<201205012117.39750.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:42582 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753476Ab2EBFDJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 May 2012 01:03:09 -0400
In-Reply-To: <201205012117.39750.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org

On 5/2/12, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Sunday, April 29, 2012, Rafael J. Wysocki wrote:
>> On Friday, April 06, 2012, Marek Szyprowski wrote:
>> > Some bootloaders disable power domains on boot and the platform startup
>> > code registers them in the 'disabled' state. Current gen_pd code
>> > assumed
>> > that the devices can be registered only to the power domain which is in
>> > 'enabled' state and these devices are active at the time of the
>> > registration. This is not correct in our case. This patch lets drivers
>> > to be registered into 'disabled' power domains and finally solves
>> > mysterious freezes and lack of resume/suspend calls on Samsung Exynos4
>> > NURI and UniversalC210 platforms.
>> >
>> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> > ---
>> >  drivers/base/power/domain.c |    7 +------
>> >  1 files changed, 1 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
>> > index 73ce9fb..05f5799f 100644
>> > --- a/drivers/base/power/domain.c
>> > +++ b/drivers/base/power/domain.c
>> > @@ -1211,11 +1211,6 @@ int __pm_genpd_add_device(struct
>> > generic_pm_domain *genpd, struct device *dev,
>> >
>> >  	genpd_acquire_lock(genpd);
>> >
>> > -	if (genpd->status == GPD_STATE_POWER_OFF) {
>> > -		ret = -EINVAL;
>> > -		goto out;
>> > -	}
>> > -
>> >  	if (genpd->prepared_count > 0) {
>> >  		ret = -EAGAIN;
>> >  		goto out;
>> > @@ -1239,7 +1234,7 @@ int __pm_genpd_add_device(struct generic_pm_domain
>> > *genpd, struct device *dev,
>> >  	dev_pm_get_subsys_data(dev);
>> >  	dev->power.subsys_data->domain_data = &gpd_data->base;
>> >  	gpd_data->base.dev = dev;
>> > -	gpd_data->need_restore = false;
>> > +	gpd_data->need_restore = true;
>>
>> I think that should be:
>>
>> +	gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
>>
>> Otherwise, on the next domain power off the device's state won't be
>> saved.
>
> Ping?
Hi Rafael,

Now Marek is on vacation util 6 May. He'll answer at that time.
Sorry.

Thank you,
Kyungmin Park
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
