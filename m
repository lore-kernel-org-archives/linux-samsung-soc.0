From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Mon, 15 Feb 2016 12:21:43 -0300
Message-ID: <56C1ED07.6090008@osg.samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
 <56C1762E.9040208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48419 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751079AbcBOPVu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 10:21:50 -0500
In-Reply-To: <56C1762E.9040208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

Hello Krzysztof,

On 02/15/2016 03:54 AM, Krzysztof Kozlowski wrote:
> On 12.02.2016 13:30, Javier Martinez Canillas wrote:
>> The driver's init and exit function don't do anything besides adding and
>> deleting the I2C driver so the module_i2c_driver() macro could be used.
>>
>> Currently is not being used because the driver is initialized at subsys
>> initcall level, claiming that this is done to allow consumers devices to
>> use the resources provided by this driver. But dependencies should be in
>> the DT and consumers drivers should not rely in the registration order.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>   drivers/mfd/max77686.c | 13 +------------
>>   1 file changed, 1 insertion(+), 12 deletions(-)
>>
>
> In the past not all dependencies supported deferred probing so such
> ordering was required.
>
> I don't like the "dependencies should be in DT" reason for the change...
> because it is kind of wishful thinking. Yeah, the dependencies should be
> in DT, but are they?
>
> Instead *please check it* and write:
> "Dependencies are in DT so manual ordering of init calls is not
> necessary any more".
>

For the max77802 I know that's the case since the only two DTS in mainline
that use it are the Peach Pit and Pi and I'm very familiar with those two.

But I wonder how can I check that this is the case for the max77686. Most
DTS in mainline have nodes that use some clocks and regulators provided by
the PMIC, only arch/arm/boot/dts/exynos5250-smdk5250.dts doesn't have one
of the regulators as input supply or clock consumer defined.

For the clock, I guess the RTC is just broken since it's using the s3c6410
controller that requires a source clock and this is not defined.

Now the question is if it doesn't really need the regulators or is that
the DTS isn't correctly defined and some drivers were relying on the MFD
and regulator drivers to be registered at subsys initcall level?

> My fast tests of this patch shown that it works good... but some more
> thorough tests should be done.
>

What do you suggest? The drivers now support deferred probing but as said,
I don't know how I can be sure that drivers aren't missing input supplies
and relying in regulators being registered early and marked as always-on.
  
> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
