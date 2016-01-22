From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 03/10] rtc: max77686: Use usleep_range() instead of
 msleep()
Date: Fri, 22 Jan 2016 09:05:49 -0300
Message-ID: <56A21B1D.8030303@osg.samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
 <1453407813-14646-4-git-send-email-javier@osg.samsung.com>
 <56A1F935.2040904@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:37700 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753394AbcAVMF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2016 07:05:58 -0500
In-Reply-To: <56A1F935.2040904@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org

Hello Laxman,

On 01/22/2016 06:41 AM, Laxman Dewangan wrote:
>
> On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
>>       RTC_SEC = 0,
>> @@ -130,7 +130,8 @@ static int max77686_rtc_update(struct max77686_rtc_info *info,
>>                   __func__, ret, data);
>>       else {
>>           /* Minimum 16ms delay required before RTC update. */
>> -        msleep(MAX77686_RTC_UPDATE_DELAY);
>> +        usleep_range(MAX77686_RTC_UPDATE_DELAY,
>> +                 MAX77686_RTC_UPDATE_DELAY * 2);
>>       }
>>
>
> Instead of making usleep_range(16000, 32000), can we make small range as
> usleep_range(16000, 17000)?
>

Yes, I also didn't know how to make the delay smaller. If I do for example

usleep_range(delay, delay + 10000), then the 10000 delta would be too big
for max77802 (50 times the minimum required 200 delay).

So I used delay * 2 for two reasons:

1) That way is generic enough and can work for any delay

2) My understanding is that most of times the delay should be precise and
    is not that bad if sometimes the delay is the worst case (2 * X) since
    after all the delay is the minimum required.

I also see that usleep_range(X, X * 2) is a used pattern across the kernel.

> I am using as usleep_range(16000, 16000) always.

According to Documentation/timers/timers-howto.txt, that's not a good
idea since usleep_range() is implemented using high-resolution timers
so by not using a range, the kernel won't be able to merge the wakeup
with other wakeups which leads to much more interrupts being triggered.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
