From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Wed, 17 Feb 2016 18:34:59 +0900
Message-ID: <56C43EC3.6040301@samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
 <56C1762E.9040208@samsung.com> <56C1ED07.6090008@osg.samsung.com>
 <56C25D55.5040208@samsung.com> <56C43D1A.2000206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52394 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755662AbcBQJfG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 04:35:06 -0500
In-reply-to: <56C43D1A.2000206@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

On 17.02.2016 18:27, Marek Szyprowski wrote:
> Hello,
> 
> On 2016-02-16 00:20, Krzysztof Kozlowski wrote:
>> On 16.02.2016 00:21, Javier Martinez Canillas wrote:
>>> Hello Krzysztof,
>>>
>>> On 02/15/2016 03:54 AM, Krzysztof Kozlowski wrote:
>>>> On 12.02.2016 13:30, Javier Martinez Canillas wrote:
>>>>> The driver's init and exit function don't do anything besides
>>>>> adding and
>>>>> deleting the I2C driver so the module_i2c_driver() macro could be
>>>>> used.
>>>>>
>>>>> Currently is not being used because the driver is initialized at
>>>>> subsys
>>>>> initcall level, claiming that this is done to allow consumers
>>>>> devices to
>>>>> use the resources provided by this driver. But dependencies should
>>>>> be in
>>>>> the DT and consumers drivers should not rely in the registration
>>>>> order.
>>>>>
>>>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>> ---
>>>>>
>>>>>    drivers/mfd/max77686.c | 13 +------------
>>>>>    1 file changed, 1 insertion(+), 12 deletions(-)
>>>>>
>>>> In the past not all dependencies supported deferred probing so such
>>>> ordering was required.
>>>>
>>>> I don't like the "dependencies should be in DT" reason for the
>>>> change...
>>>> because it is kind of wishful thinking. Yeah, the dependencies
>>>> should be
>>>> in DT, but are they?
>>>>
>>>> Instead *please check it* and write:
>>>> "Dependencies are in DT so manual ordering of init calls is not
>>>> necessary any more".
>>>>
>>> For the max77802 I know that's the case since the only two DTS in
>>> mainline
>>> that use it are the Peach Pit and Pi and I'm very familiar with those
>>> two.
>>>
>>> But I wonder how can I check that this is the case for the max77686.
>>> Most
>>> DTS in mainline have nodes that use some clocks and regulators
>>> provided by
>>> the PMIC, only arch/arm/boot/dts/exynos5250-smdk5250.dts doesn't have
>>> one
>>> of the regulators as input supply or clock consumer defined.
>> +Cc Marek Szyprowski, who may know a lot more about dependencies between
>> these.
>>
>> I wouldn't care for drivers not taking references to regulators/clocks.
>> Most of necessary regulators and clocks are turned on by bootloader or
>> by default values in PMIC. This means that later probing of PMIC
>> shouldn't influence drivers which are not using it.
>>
>> The remaining problem was unsupported deferred probing by some of the
>> drivers using regulators/clocks (drivers being consumers of regulators
>> or clocks). AFAIR one of example was USB OTG.
> 
> USB OTG has been recently fixed to finally support deferred probing, see
> commit 855ed04a3758b205e84b269f92d26ab36ed8e2f7 ("usb: gadget: udc-core:
> independent registration of gadgets and gadget drivers").

Thanks for the confirmation!

Best regards,
Krzysztof
