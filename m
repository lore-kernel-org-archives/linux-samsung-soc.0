From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drivers: genpd: let platform code to register devices into
 disabled domains
Date: Mon, 14 May 2012 21:22:17 +0200
Message-ID: <4FB15B69.60004@samsung.com>
References: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com>
 <201205112251.31064.rjw@sisk.pl> <4FB0D77E.2030805@samsung.com>
 <201205142104.18693.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16592 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757613Ab2ENTWW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 15:22:22 -0400
In-reply-to: <201205142104.18693.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, kgene.kim@samsung.com

Hello,

On 5/14/2012 9:04 PM, Rafael J. Wysocki wrote:
> On Monday, May 14, 2012, Marek Szyprowski wrote:
>> Hi
>>
>> On 2012-05-11 22:51, Rafael J. Wysocki wrote:
>>> On Thursday, May 10, 2012, Rafael J. Wysocki wrote:
>>>> On Thursday, May 10, 2012, Marek Szyprowski wrote:
>>>>> Hi Rafael,
>>>>>
>>>>> On Monday, May 07, 2012 8:45 PM Rafael J. Wysocki wrote:
>>>>>
>>>>>> On Monday, May 07, 2012, Marek Szyprowski wrote:
>>>>>>> Hi Rafael,
>>>>>>>
>>>>>>> I'm sorry for a late reply, I was on holidays last week and just got back to
>>>>>>> the office.
>>>>>>>
>>>>>>> On Sunday, April 29, 2012 10:55 PM Rafael J. Wysocki wrote:
>>>>>>>
>>>>>>>> On Friday, April 06, 2012, Marek Szyprowski wrote:
>>>>>>>>> Some bootloaders disable power domains on boot and the platform startup
>>>>>>>>> code registers them in the 'disabled' state. Current gen_pd code assumed
>>>>>>>>> that the devices can be registered only to the power domain which is in
>>>>>>>>> 'enabled' state and these devices are active at the time of the
>>>>>>>>> registration. This is not correct in our case. This patch lets drivers
>>>>>>>>> to be registered into 'disabled' power domains and finally solves
>>>>>>>>> mysterious freezes and lack of resume/suspend calls on Samsung Exynos4
>>>>>>>>> NURI and UniversalC210 platforms.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>>>>>>>>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/base/power/domain.c |    7 +------
>>>>>>>>>    1 files changed, 1 insertions(+), 6 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
>>>>>>>>> index 73ce9fb..05f5799f 100644
>>>>>>>>> --- a/drivers/base/power/domain.c
>>>>>>>>> +++ b/drivers/base/power/domain.c
>>>>>>>>> @@ -1211,11 +1211,6 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct
>>>>>>>> device *dev,
>>>>>>>>>
>>>>>>>>>    	genpd_acquire_lock(genpd);
>>>>>>>>>
>>>>>>>>> -	if (genpd->status == GPD_STATE_POWER_OFF) {
>>>>>>>>> -		ret = -EINVAL;
>>>>>>>>> -		goto out;
>>>>>>>>> -	}
>>>>>>>>> -
>>>>>>>>>    	if (genpd->prepared_count>   0) {
>>>>>>>>>    		ret = -EAGAIN;
>>>>>>>>>    		goto out;
>>>>>>>>> @@ -1239,7 +1234,7 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct
>>>>>>>> device *dev,
>>>>>>>>>    	dev_pm_get_subsys_data(dev);
>>>>>>>>>    	dev->power.subsys_data->domain_data =&gpd_data->base;
>>>>>>>>>    	gpd_data->base.dev = dev;
>>>>>>>>> -	gpd_data->need_restore = false;
>>>>>>>>> +	gpd_data->need_restore = true;
>>>>>>>>
>>>>>>>> I think that should be:
>>>>>>>>
>>>>>>>> +	gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
>>>>>>>>
>>>>>>>> Otherwise, on the next domain power off the device's state won't be saved.
>>>>>>>>
>>>>>>>>>    	list_add_tail(&gpd_data->base.list_node,&genpd->dev_list);
>>>>>>>>>    	if (td)
>>>>>>>>>    		gpd_data->td = *td;
>>>>>>>
>>>>>>> I've tested the above change and there is problem. Let me explain in detail the
>>>>>>> sw/hw configuration I have.
>>>>>>>
>>>>>>> There is a power domain and the device driver. The device itself also has it's own
>>>>>>> power management code (which enables and disables clocks).  Some power domains are
>>>>>>> disabled by bootloader and some devices in the active power domains have their
>>>>>>> clocks disabled too. In the current runtime pm code the devices were probed in
>>>>>>> 'disabled' state and had to enable itself by calling get_runtime_sync(). My initial
>>>>>>> patch restored runtime pm handling to the old state (the same which was with non
>>>>>>> gen_pd based driver or no power domain driver at all, where runtime pm was handled
>>>>>>> by platform bus). If I apply your patch the runtime_restore
>>>>>>
>>>>>> I guess you mean .runtime_resume().
>>>>>>
>>>>>>> callback is not called on first driver probe for devices inside the domain which
>>>>>>> has been left enabled by the bootloader.
>>>>>>
>>>>>> I don't see why .probe() should depend on the runtime PM framework to call
>>>>>> .runtime_resume() for it.  It looks like .probe() could just call
>>>>>> .runtime_resume() directly if needed.
>>>>>>
>>>>>> Besides, your change breaks existing code as I said.
>>>>>
>>>>> Before using gen_pd power domains we had the following flow of calls/controls:
>>>>>
>>>>> 1. fimc_probe(fimd_pdev)
>>>>> ...
>>>>> 2. pm_runtime_enable(fimd_pdev->dev)
>>>>> 3. pm_runtime_get_sync(fimd_pdev->dev)
>>>>> 	3a. parent device's runtime_resume()
>>>>> 	3b. fimc_runtime_resume(fimd_pdev->dev)
>>>>> ...
>>>>> 4. pm_runtime_put(fimd_pdev->dev)
>>>>> ...
>>>>> 5. (runtime put timer kicks off)
>>>>> 	5a. fimc_runtime_put(fimd_pdev->dev)
>>>>> 	5b. parent device's runtime_suspend()
>>>>>
>>>>> (this flow assumed that fimc device was the only child of its parent platform device).
>>>>>
>>>>> Now with power gen_pd driver with my patch I get the following call sequence:
>>>>>
>>>>> 1. fimc_probe(fimd_pdev)
>>>>> ...
>>>>> 2. pm_runtime_enable(fimd_pdev->dev)
>>>>> 3. pm_runtime_get_sync(fimd_pdev->dev)
>>>>> 	3a. gen_pd pd_power_on(...)
>>>>> 	3b. fimc_runtime_resume(fimd_pdev->dev)
>>>>> 4. pm_runtime_put(fimd_pdev->dev)
>>>>> ...
>>>>> 5. (runtime put timer kicks off)
>>>>> 	5a. fimc_runtime_put(fimd_pdev->dev)
>>>>> 	5b. gen_pd pd_power_off (...)
>>>>>
>>>>> so it works like before.
>>>>>
>>>>> Now with your suggested change I get following call sequence:
>>>>>
>>>>> 1. fimc_probe(fimc_pdev)
>>>>> ...
>>>>> 2. pm_runtime_enable(fimd_pdev->dev)
>>>>> 3. pm_runtime_get_sync(fimd_pdev->dev)
>>>>> 	(gen_pd finds that the power domain is already activated)
>>>>> ...
>>>>> 4. pm_runtime_put(fimd_pdev->dev)
>>>>> ...
>>>>> 5. (runtime put timer kicks off)
>>>>> 	5a. fimc_runtime_put(fimd_pdev->dev)
>>>>> 	5b. gen_pd pd_power_off (...)
>>>>>
>>>>> As you can notice in point 3, gen_pd driver checks its internal state,
>>>>> finds that the power domain is already enabled and skips calling
>>>>> fimc_runtime_resume(). This breaks the driver which worked fine before.
>>>>
>>>> It doesn't break anything, you're just using a wrong tool for a wrong
>>>> purpose.  Generic PM domains are not supposed to be a drop-in replacement
>>>> for platform bus type!
>>>>
>>>>> Please notice that fimc_runtime_resume() does something completely
>>>>> different than the power domain driver and those operations are essential
>>>>> for getting the driver to work correctly.
>>>>
>>>> I don't quite understand what you mean here.  What's the power domain driver
>>>> in particular?
>>>>
>>>> Now, you can kind of make things work with my proposed modification of the
>>>> patch if you make your platform code that adds the fmc device to the PM
>>>> domain set its need_restore flag directly afterwards.
>>>>
>>>> So, you do
>>>>
>>>> pm_genpd_add_device(domain, fmc);
>>>> fmc->power.subsys_data->domain_data->need_restore = true;
>>>>
>>>> Or you can actually modify __pm_genpd_add_device() so that it takes
>>>> need_restore as an additional argument.  That would be fine by me too so long
>>>> as pm_genpd_add_device() worked in the same way as before.
>>>>
>>>> However, there is code already in the kernel that will break if you change
>>>> __pm_genpd_add_device() to set need_restore unconditionally.  Is that clear
>>>> enough?
>>>
>>> I think we can use the
>>>
>>> +       gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
>>>
>>> variant of the $subject patch and add e helper for setting the need_restore
>>> flag to it and use that helper along with pm_genpd_add_device() wherever
>>> necessary.
>>>
>>> So, the entire patch might look like the one below.
>>>
>>> What do you think?
>>>
>>> Rafael
>>>
>>> ---
>>>    arch/arm/mach-exynos/pm_domains.c |    2 ++
>>>    drivers/base/power/domain.c       |   27 +++++++++++++++++++++------
>>>    include/linux/pm_domain.h         |    2 ++
>>>    3 files changed, 25 insertions(+), 6 deletions(-)
>>>
>>> Index: linux/drivers/base/power/domain.c
>>> ===================================================================
>>> --- linux.orig/drivers/base/power/domain.c
>>> +++ linux/drivers/base/power/domain.c
>>> @@ -1302,11 +1302,6 @@ int __pm_genpd_add_device(struct generic
>>>
>>>    	genpd_acquire_lock(genpd);
>>>
>>> -	if (genpd->status == GPD_STATE_POWER_OFF) {
>>> -		ret = -EINVAL;
>>> -		goto out;
>>> -	}
>>> -
>>>    	if (genpd->prepared_count>   0) {
>>>    		ret = -EAGAIN;
>>>    		goto out;
>>> @@ -1329,7 +1324,7 @@ int __pm_genpd_add_device(struct generic
>>>    	dev->power.subsys_data->domain_data =&gpd_data->base;
>>>    	gpd_data->base.dev = dev;
>>>    	list_add_tail(&gpd_data->base.list_node,&genpd->dev_list);
>>> -	gpd_data->need_restore = false;
>>> +	gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
>>>    	if (td)
>>>    		gpd_data->td = *td;
>>>
>>> @@ -1457,6 +1452,26 @@ void pm_genpd_dev_always_on(struct devic
>>>    EXPORT_SYMBOL_GPL(pm_genpd_dev_always_on);
>>>
>>>    /**
>>> + * pm_genpd_dev_need_restore - Set/unset the device's "need restore" flag.
>>> + * @dev: Device to set/unset the flag for.
>>> + * @val: The new value of the device's "need restore" flag.
>>> + */
>>> +void pm_genpd_dev_need_restore(struct device *dev, bool val)
>>> +{
>>> +	struct pm_subsys_data *psd;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&dev->power.lock, flags);
>>> +
>>> +	psd = dev_to_psd(dev);
>>> +	if (psd&&   psd->domain_data)
>>> +		to_gpd_data(psd->domain_data)->need_restore = val;
>>> +
>>> +	spin_unlock_irqrestore(&dev->power.lock, flags);
>>> +}
>>> +EXPORT_SYMBOL_GPL(pm_genpd_dev_need_restore);
>>> +
>>> +/**
>>>     * pm_genpd_add_subdomain - Add a subdomain to an I/O PM domain.
>>>     * @genpd: Master PM domain to add the subdomain to.
>>>     * @subdomain: Subdomain to be added.
>>> Index: linux/include/linux/pm_domain.h
>>> ===================================================================
>>> --- linux.orig/include/linux/pm_domain.h
>>> +++ linux/include/linux/pm_domain.h
>>> @@ -156,6 +156,7 @@ static inline int pm_genpd_of_add_device
>>>    extern int pm_genpd_remove_device(struct generic_pm_domain *genpd,
>>>    				  struct device *dev);
>>>    extern void pm_genpd_dev_always_on(struct device *dev, bool val);
>>> +extern void pm_genpd_dev_need_restore(struct device *dev, bool val);
>>>    extern int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
>>>    				  struct generic_pm_domain *new_subdomain);
>>>    extern int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
>>> @@ -201,6 +202,7 @@ static inline int pm_genpd_remove_device
>>>    	return -ENOSYS;
>>>    }
>>>    static inline void pm_genpd_dev_always_on(struct device *dev, bool val) {}
>>> +static inline void pm_genpd_dev_need_restore(struct device *dev, bool val) {}
>>>    static inline int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
>>>    					 struct generic_pm_domain *new_sd)
>>>    {
>>> Index: linux/arch/arm/mach-exynos/pm_domains.c
>>> ===================================================================
>>> --- linux.orig/arch/arm/mach-exynos/pm_domains.c
>>> +++ linux/arch/arm/mach-exynos/pm_domains.c
>>> @@ -123,6 +123,8 @@ static __init void exynos_pm_add_dev_to_
>>>    			pr_info("%s: error in adding %s device to %s power"
>>>    				"domain\n", __func__, dev_name(&pdev->dev),
>>>    				pd->name);
>>> +		else
>>> +			pm_genpd_dev_need_restore(&pdev->dev, true);
>>>    	}
>>>    }
>>>
>>>
>>
>> I'm fine with this solution. Thanks for your help!
>
> OK, no problem.
>
> Do you want me to apply the patch literally in the above form or should I skip
> the arch/arm/mach-exynos/pm_domains.c change for now?

Yes, please skip arch/arm/mach-exynos/pm_domains.c part. We will handle 
it with a separate patch on Samsung tree.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
