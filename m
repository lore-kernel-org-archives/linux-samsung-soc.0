From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: resolve infinite loop issue on non
 multi-platform
Date: Fri, 07 Nov 2014 12:11:24 +0100
Message-ID: <545CA8DC.3070400@samsung.com>
References: <1415283007-10096-1-git-send-email-inki.dae@samsung.com>
 <1415293720.31102.1.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26503 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454AbaKGLLb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 06:11:31 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEO00NQV1VS4700@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Nov 2014 11:14:16 +0000 (GMT)
In-reply-to: <1415293720.31102.1.camel@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 11/06/2014 06:08 PM, Sjoerd Simons wrote:
> On Thu, 2014-11-06 at 23:10 +0900, Inki Dae wrote:
>> This patch resovles the infinite loop issue incurred
>> when Exyno drm driver is enabled but all kms drivers
>> are disabled on Exynos board by returning -EPROBE_DEFER
>> only in case that there is kms device registered.
> 
> It would be nice if you could explain in the commit message/comment why
> returning -EPROBE_DEFER causes an infinite loop and why it's the wrong
> thing to do in this case? 
> 
> Even if you know this probe will never succeed in the future (so
> deferring is actually pointless), deferring really shouldn't trigger
> infinte loops in calling code
> 

+CC: Grant and Greg

It seems to be partly an issue with deferred probing. I guess it affects
all drivers which in their probe can cause successful probe of
sub-driver/sub-device, and after that the main driver defers probing,
unwinding changes including removal of sub-driver/sub-device. Driver
core incorrectly re-triggers probing in this case.

In this particular case it could be fixed in exynos_drm driver I guess,
but maybe it would be good to fix deferred probing, if possible.

Regards
Andrzej


>>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index ecc86aa..14c6af7 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -488,6 +488,12 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
>>  
>>  	mutex_lock(&drm_component_lock);
>>  
>> +	/* Do not retry to probe if there is no any kms driver regitered. */
>> +	if (list_empty(&drm_component_list)) {
>> +		mutex_unlock(&drm_component_lock);
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>>  	list_for_each_entry(cdev, &drm_component_list, list) {
>>  		/*
>>  		 * Add components to master only in case that crtc and
> 
> 
