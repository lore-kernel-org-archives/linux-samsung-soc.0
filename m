From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 4/6] ARM: SAMSUNG: Restore Samsung PM Debug functionality
Date: Wed, 16 Jul 2014 03:02:39 +0900
Message-ID: <53C56CBF.1020500@samsung.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com> <1403618235-19353-5-git-send-email-t.figa@samsung.com> <033901cf9ab3$44c469a0$ce4d3ce0$@samsung.com> <53BBF7FF.6050105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:44958 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbaGOSCp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 14:02:45 -0400
In-Reply-To: <53BBF7FF.6050105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>

On 07/08/14 22:54, Tomasz Figa wrote:
> On 08.07.2014 15:48, Kukjin Kim wrote:
>> Tomasz Figa wrote:
>>>
>>> Due to recently merged patches and previous merge conflicts, the Samsung
>>> PM Debug functionality no longer can be enabled. This patch fixes
>>> incorrect dependency of SAMSUNG_PM_DEBUG on an integer symbol and adds
>>> missing header inclusion.
>>>
>> Yes, you're right and it should be fixed...but I have comments...
>>
>>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>>> ---
>>>   arch/arm/plat-samsung/Kconfig    | 8 +++++++-
>>>   arch/arm/plat-samsung/pm-debug.c | 1 +
>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
>>> index 301b892..483c959 100644
>>> --- a/arch/arm/plat-samsung/Kconfig
>>> +++ b/arch/arm/plat-samsung/Kconfig
>>> @@ -412,9 +412,14 @@ config S5P_DEV_MFC
>>>
>>>   comment "Power management"
>>>
>>> +config HAVE_SAMSUNG_PM_DEBUG
>>> +	bool
>>> +	help
>>> +	  Allow compilation of Samsung PM debugging code.
>>> +
>>>   config SAMSUNG_PM_DEBUG
>>>   	bool "S3C2410 PM Suspend debug"
>>> -	depends on PM&&  DEBUG_KERNEL&&  DEBUG_S3C_UART
>>> +	depends on PM&&  DEBUG_KERNEL&&  HAVE_SAMSUNG_PM_DEBUG
>>>   	help
>>>   	  Say Y here if you want verbose debugging from the PM Suspend and
>>>   	  Resume code. See<file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
>>> @@ -484,6 +489,7 @@ config S5P_SLEEP
>>>
>>>   config DEBUG_S3C_UART
>>>   	depends on PLAT_SAMSUNG
>>> +	select HAVE_SAMSUNG_PM_DEBUG
>>
>> Hmm...
>>
>> The DEBUG_S3C_UART will be '0' when we select DEBUG_S3C_UART0, then the
>> HAVE_SAMSUNG_PM_DEBUG will not be selected so SAMSUNG_PM_DEBUG is also...
>
> Yes, that's right. I posted v2 after a while in another reply to this
> thread.
>
Any updates? Or I missed your updated?

- Kukjin
