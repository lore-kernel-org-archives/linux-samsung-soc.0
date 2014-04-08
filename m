From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/7] drm/exynos: add super device support
Date: Tue, 8 Apr 2014 17:37:52 +0900
Message-ID: <CAAQKjZPpn2aYxYvisRMUmSManqat+e8EtmSDDXKp4kTSRAXxSQ@mail.gmail.com>
References: <1396355882-17010-1-git-send-email-inki.dae@samsung.com>
	<1396355882-17010-2-git-send-email-inki.dae@samsung.com>
	<533EB9C6.80302@samsung.com>
	<CAAQKjZPbzb+qvJA5y+Kco9BRv4j3iVatM_0bd+ugyuVZUbfFFg@mail.gmail.com>
	<53403E42.1010403@gmail.com>
	<CAAQKjZP+RbkO0yVNEKgWWAkogx+p36HKwVyJ+4EjPHrSOarBwQ@mail.gmail.com>
	<5342B3AD.1030502@samsung.com>
	<CAAQKjZNf=Lr=9DwFM4KCia8jeUpsVu-6h9RyfFpqK+8kkDsbgA@mail.gmail.com>
	<5342C6FA.7060201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:54228 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756263AbaDHIhy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 04:37:54 -0400
Received: by mail-wi0-f171.google.com with SMTP id q5so6559670wiv.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 01:37:53 -0700 (PDT)
In-Reply-To: <5342C6FA.7060201@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

2014-04-08 0:40 GMT+09:00, Tomasz Figa <tomasz.figa@gmail.com>:
> On 07.04.2014 17:16, Inki Dae wrote:
>> Hi Andrzej,
>>
>> 2014-04-07 23:18 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>>> Hi Inki and Tomasz,
>>>
>>> On 04/06/2014 05:15 AM, Inki Dae wrote:
>>>
>>> (...)
>>>> The code creating the list of components to wait for
>>>> (exynos_drm_add_components()) doesn't seem to consider which sub-drivers
>>>> are
>>>> actually enabled in kernel config.
>>>>
>>>> Are you sure?
>>>>
>>>> exynos_drm_add_components() will try to attach components *added to
>>>> component_lists. And these components will be added by only
>>>> corresponding sub drivers to the component_lists and
>>>> master->components.
>>>>
>>>> So in this case, if users disabled HDMI support then a commponent
>>>> object for HDMI sub driver doesn't exists in the component_lists and
>>>> master->components. This means that a component object for HDMI sub
>>>> driver *cannot be attached to master object*.
>>>>
>>>> As a result, component_bind_add() will ignor component_bind call for
>>>> HDMI sub driver so HDMI driver will not be bounded. The only
>>>> components added by sub drivers will be bound, component->ops->bind().
>>>>
>>>> For more understanding, it seems like you need to look into below
>>>> codes,
>>>>
>>>> static int exynos_drm_add_components(...)
>>>> {
>>>>          ...
>>>>          for (i == 0;; i++) {
>>>>                  ...
>>>>                  node = of_parse_phandle(np, "ports", i);
>>>>                  ...
>>>>                  ret = component_master_add_child(m, compare_of, node);
>>>>                  ...
>>>>          }
>>>> }
>>>
>>> Hmm, In case HDMI driver is not present, HDMI device is not probed and
>>> HDMI component is not added, so component_master_add_child returns
>>> an error when it tries to add hdmi component and master is never brought
>>> up, am I correct?
>>>
>>
>> Ok, after that,
>>
>> ret = component_master_add(,..)
>> if (ret < 0)
>>           DRM_DEBUG_KMS("re-tried by last sub driver probed later.\n");
>>
>> As you can see above, if component_master_add() is failed, return 0,
>> *not error*. And then component_add() called by other kms drivers,
>> late probing of hdmi or fimd probing - if there is any kms driver
>> enabled - will try to bring up master again by calling
>> try_to_bring_up_master() from beginning.
>>
>> And if component_list is empty then it means that there is no any kms
>> driver enabled.
>>
>> Do you still think in that case, exynos drm initialization will be
>> failed?
>
> There will be no HDMI driver to call component_add(), because HDMI sub
> driver will be disabled in kernel config and any previous
> component_master_add_child() for the phandle pointing to HDMI node will
> wail, because such component will never be registered.
>
> The complete failure path is as follows:
>
> exynos_drm_platform_probe()
> 	component_master_add()
> 		try_to_bring_up_master()
> 			exynos_drm_add_components()
> 				// phandle to HDMI node
> 				component_master_add_child()
> 				= -ENXIO
> 			= -ENXIO
> 		= 0 // but no call to master->ops->bind(master->dev);
> 	= 0
> = 0 // but Exynos DRM platform is not registered yet
>
> Now if any other late-probed sub-driver comes, the sequence will be as
> follows (let's take FIMD as an example):
>
> fimd_probe()
> 	component_add()
> 		try_to_bring_up_masters()
> 			try_to_bring_up_master()
> 				exynos_drm_add_components()
> 					// phandle to HDMI node
> 					component_master_add_child()
> 					= -ENXIO
> 				= -ENXIO
> 			= 0 // but no call to 	
> 			    // master->ops->bind(master->dev);
> 		= 0
> 	= 0
> = 0 // but Exynos DRM platform still not registered
>
> And the same for any late-probed driver, unless HDMI drivers loads, but
> there is no HDMI driver, because it is disabled in kernel config and not
> compiled in.
>

Ah, right. I missed that it gets phandle to hdmi, and compares the
phandle to one in component_list.
Yes, in this case, exynos drm driver will be failed because
component_list never has a component object for hdmi.
So this shouldn't return as long as there is any component - in
component_list - that can be attached to master.

Hm.. the foot of the candle is dark.

For this, I fixed and tested it like below,
for (i = 0;; i++) {
        node = of_parse_phandle(np, "ports", i);
        ...
        ret = component_master_add_child(...);
        ...
        if (!ret)
                attached_cnt++;
}

if (!attached_cnt)
        return -ENXIO;
...

And one more thing, it seems that we could  resolve dt broken issue
easily by getting phandle to existing device node directly.

Thanks,
Inki Dae

> Best regards,
> Tomasz
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
