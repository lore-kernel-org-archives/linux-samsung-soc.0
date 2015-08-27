From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] rtc: Fix module autoload for rtc-{ab8500,max8997,s5m}
 drivers
Date: Thu, 27 Aug 2015 14:23:15 +0200
Message-ID: <55DF0133.2070009@osg.samsung.com>
References: <1440671672-26590-1-git-send-email-javier@osg.samsung.com>
 <CAPAsAGyrEm--=WfGB4wSFSXE8HZpp+HDuV=p4JmFbV-X2keQCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60362 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751936AbbH0MXV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 08:23:21 -0400
In-Reply-To: <CAPAsAGyrEm--=WfGB4wSFSXE8HZpp+HDuV=p4JmFbV-X2keQCg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Luis de Bethencourt <luis.bg@samsung.com>, linux-samsung-soc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org

Hello Andrey,

On 08/27/2015 02:20 PM, Andrey Ryabinin wrote:
> 2015-08-27 13:34 GMT+03:00 Javier Martinez Canillas <javier@osg.samsung.com>:
>> These platform drivers have a platform device ID table but the module
>> alias information is not created so module autoloading will not work.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>>  drivers/rtc/rtc-ab8500.c  | 1 +
>>  drivers/rtc/rtc-max8997.c | 1 +
>>  drivers/rtc/rtc-s5m.c     | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
>> index 133d2e2e1a25..8537d1e3a995 100644
>> --- a/drivers/rtc/rtc-ab8500.c
>> +++ b/drivers/rtc/rtc-ab8500.c
>> @@ -446,6 +446,7 @@ static const struct platform_device_id ab85xx_rtc_ids[] = {
>>         { "ab8500-rtc", (kernel_ulong_t)&ab8500_rtc_ops, },
>>         { "ab8540-rtc", (kernel_ulong_t)&ab8540_rtc_ops, },
> 
> Completely irrelevant, but this array should have an empty terminating element.
>

You are right, it's missing a sentinel indeed. But
that change should be done in a separate patch.
 
>>  };
>> +MODULE_DEVICE_TABLE(platform, ab85xx_rtc_ids);
>>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
