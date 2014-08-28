From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 1/5] rtc: s3c: Define s3c_rtc structure to remove global
 variables.
Date: Thu, 28 Aug 2014 13:49:25 +0900
Message-ID: <53FEB4D5.8000704@samsung.com>
References: <y@samsung.com> <1407808871-6046-1-git-send-email-y@samsung.com>
 <1407808871-6046-2-git-send-email-y@samsung.com>
 <20140822134204.1fa5be7aeb76a50b45ccc5f5@linux-foundation.org>
 <53FA89FD.1030004@samsung.com>
 <20140826143149.7cd3ab27b6247a59a486e681@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50469 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297AbaH1Et1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 00:49:27 -0400
In-reply-to: <20140826143149.7cd3ab27b6247a59a486e681@linux-foundation.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: a.zummo@towertech.it, kgene.kim@samsung.com, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Dear Andrew,

On 08/27/2014 06:31 AM, Andrew Morton wrote:
> On Mon, 25 Aug 2014 09:57:33 +0900 Chanwoo Choi <cw00.choi@samsung.com> wrote:
> 
>> Dear Andrew, 
>>
>> On 08/23/2014 05:42 AM, Andrew Morton wrote:
>>> On Tue, 12 Aug 2014 11:01:07 +0900 y@samsung.com wrote:
>>>
>>>> This patch define s3c_rtc structure including necessary variables for S3C RTC
>>>> device instead of global variables. This patch improves the readability by
>>>> removing global variables.
>>>
>>> Below is the v1->v2 delta.
>>>
>>> Why were all those tests of info->base added?  Can it really be zero? 
>>> I don't see how.
>>
>> If some functions (e.g., s3c_rtc_settime) accesses the rtc register
>> by using info->base before the initialization of info->base in s3c_rtc_probe,
>> I thought that null pointer error would happen.
> 
> probe() should be called before anything else.  If we're somehow
> calling s3c_rtc_settime() before probe() has completed then something
> very bad is happening - for example, the device may have been
> registered far too early.  But I don't think that's the case here.

I means that existing rtc-s3c.c driver executed s3c_rtc_settime() in s3c_rtc_probe()
before initialization of info->base. But, It is my mistake. so, I modified it just as following:

-		s3c_rtc_settime(NULL, &rtc_tm);
+		s3c_rtc_settime(&pdev->dev, &rtc_tm);

> 
> That being said, it does seem strange that s3c_rtc_probe() calls
> devm_rtc_device_register() *before* trying to request its IRQs.  So if
> IRQ requesting fails, we go and immediately unregister the device. 
> Some other drivers do it this way, others do not.  Wouldn't it be
> better to defer registration until we know that all the probe() setup
> operations have succeeded?

You're right. I missed this point. If rtc-s3c.c driver completed the probe function,
info->base has always right address.

+	if (!info->base)
+		return -EINVAL;
+

As you said, checking state of 'info-base' is un-needed.
I'll send new patchset(v3) to fix it.

> 
>> But, I missed one point which info->base might have the garbate data instead of NULL.
>> I'll add the initialization code for info->base.
>> 	info->base = NULL;
>>
>> If you don't agree it, I'll drop this code checking the state of info->base on next patchset(v3).
> 
> Well, we should have those checks in there unless we know they're
> needed.  And if they *are* needed, we should have a good understanding
> of why they're needed, and we should be sure that we're not just
> working around some underlying problem.

You are right. Thanks for your comment and advice.

Best Regards,
Chanwoo Choi
