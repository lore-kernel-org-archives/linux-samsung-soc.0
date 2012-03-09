From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] ARM: Exynos: JPEG board definition and device register
Date: Fri, 09 Mar 2012 10:26:09 -0800
Message-ID: <4F5A4B41.2000009@samsung.com>
References: <1328005243-6072-1-git-send-email-andrzej.p@samsung.com> <4F2902C0.5020805@linaro.org> <000001cce0cc$08258a90$18709fb0$%p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:36368 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752951Ab2CIS0L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 13:26:11 -0500
Received: by ghrr11 with SMTP id r11so1026704ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 10:26:11 -0800 (PST)
In-Reply-To: <000001cce0cc$08258a90$18709fb0$%p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Andrzej Pietrasiewicz wrote:
> Hello Tushar,
>
> On Wednesday, February 01, 2012 10:16 AM Tushar Behera wrote:

[...]

>>>
>> [snip]
>>>
>>> +#ifdef CONFIG_S5P_DEV_JPEG
>>> +static struct resource s5p_jpeg_resource[] = {
>>> +	[0] = {
>>> +		.start	= S5P_PA_JPEG,
>>> +		.end	= S5P_PA_JPEG + SZ_4K - 1,
>>> +		.flags	= IORESOURCE_MEM,
>>> +	},
>>> +	[1] = {
>>> +		.start	= IRQ_JPEG,
>>> +		.end	= IRQ_JPEG,
>>> +		.flags	= IORESOURCE_IRQ,
>>> +	},
>>> +};
>>
>> Should be using DEFINE_RES_MEM and DEFINE_RES_IRQ.
>>
> Thank you for pointing this out. I will fix it.
>
Probably, I didn't get updated this so now happens build error about 
lack of s5p_device_jpeg.

>> Also, wouldn't be a good idea to split this patch into 2 different
>> patches for platform-specific and board-specific changes?
>>
> I think I will split it into 3 patches: platform-specific and
> 2 board-specific (universal, nuri).
>
Yes, please re-submit adding platform_device of jpeg. If not, I should 
drop regarding patches in my tree for upcoming merge window.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
