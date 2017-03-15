From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos/dsi: make te-gpios optional
Date: Wed, 15 Mar 2017 18:07:10 +0900
Message-ID: <58C9043E.5030007@samsung.com>
References: <CGME20170313153029eucas1p114f034a5dea7374f6d14d4d1636d0b68@eucas1p1.samsung.com>
 <1489419022-20501-1-git-send-email-a.hajda@samsung.com>
 <58C8B98B.3070505@samsung.com>
 <2573ff3c-f04f-0270-329b-4ed626748300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52677 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751310AbdCOJHP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Mar 2017 05:07:15 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMU00N39MO16K30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Mar 2017 18:07:13 +0900 (KST)
In-reply-to: <2573ff3c-f04f-0270-329b-4ed626748300@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>



2017년 03월 15일 16:58에 Andrzej Hajda 이(가) 쓴 글:
> On 15.03.2017 04:48, Inki Dae wrote:
>>
>> 2017년 03월 14일 00:30에 Andrzej Hajda 이(가) 쓴 글:
>>> In case of HW-TRIGGER te-gpios interrupt is not necessary. With this
>>> patch we can get rid of 60 interrupt callbacks per second.
>> Andrzej,
>>
>> Sorry but above description is not clear.
> 
> I agree, it could be improved.
> 
>>
>> If panel device node of command mode panel device doesn't provide te-gpios property then now the panel driver will fail to probe.
>> Seems this patch makes it to allow the panel driver probing is always ok even if gpio is invalid.
> 
> I guess you mean DSI driver.

mipi_dsi_attach function call fails and this function is called by panel driver so panel driver probing would fail.

> 
>>
>> So how about handling this at top of this function like below?
>>
>> if (!of_property_read_bool(node, "te-gpios"))
>> 	return 0;
> 
> Looks OK, it can be also done without additional call:
> dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
> if (dsi->te_gpio == -ENOENT)
>         return 0;
> 
>>
>> And I think the description should be modified properly including subject of this patch. 
> 
> OK, I will post v2.
> 
> BTW, I though little bit about it and:
> 1. te-gpios property is in panel node, but panel driver do not use it at
> all.

Right but panel driver don't have to use this because te(Tearing Effect) signal means that MCU completed to transter all data of SRAM - internal framebuffer of panel device - to Display panel. So TE is used to notify the completion to Display controller.

> 2. it is parsed by DSI driver, but DSI driver does not need it at all,
> it just forwards it to DECON.

The reason - te interrupt handler is registered by DSI driver - is that te interrupt handler should be registered at driver probing but display controller - FIMD and DECON - drivers cannot know the te gpio pin until crtc and connector is connected. 
So DSI driver just registers te interrupt handler and this handler just calls crct's handler at ready status.

> 3. DECON driver uses it, but it does not control it at all: parsing,
> switching on/off, life time.
> 
> So maybe it would better to move whole te-gpios property to DECON node,
> maybe even make it interrupt property instead of gpio, as it servers
> only to irq.
> After move DECON driver would know when this property is required and
> probe should fail (SW mode), it could control enable/disable of
> associated irq - currently the code is racy,
> and finally there will not be parsing of panel node by DSI driver - it
> violates DT principles.
> 
> What do you think about it?

About this, we had already discussion before and Thierry gave us good comments,
https://lists.freedesktop.org/archives/dri-devel/2014-July/063201.html

I believe above discussion would give you some help to understand why we handle TE interrupt like now.

Anyway, agree. now code is not good so it could be more cleanned up.

Thanks,
Inki Dae

> 
> Regards
> Andrzej
> 
>>
>> Thanks,
>> Inki Dae
>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index 812e2ec..f95fac5 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -1349,9 +1349,8 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
>>>  
>>>  	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
>>>  	if (!gpio_is_valid(dsi->te_gpio)) {
>>> -		dev_err(dsi->dev, "no te-gpios specified\n");
>>> -		ret = dsi->te_gpio;
>>> -		goto out;
>>> +		dev_info(dsi->dev, "no te-gpios specified\n");
>>> +		return 0;
>>>  	}
>>>  
>>>  	ret = gpio_request(dsi->te_gpio, "te_gpio");
>>>
>>
> 
> 
> 
