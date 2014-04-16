From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 16 Apr 2014 16:48:57 +0200
Message-ID: <534E9859.7000307@samsung.com>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
 <1397554134-11827-6-git-send-email-sachin.kamat@linaro.org>
 <534E8AE1.4010402@samsung.com> <4516298.kO98TB1Ozz@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52951 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161426AbaDPOtB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:49:01 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N44007T5P5EJ820@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 15:48:50 +0100 (BST)
In-reply-to: <4516298.kO98TB1Ozz@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Thomas Abraham <ta.omasab@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Abraham <thomas.ab@samsung.com>

On 16.04.2014 16:31, Arnd Bergmann wrote:
> On Wednesday 16 April 2014 15:51:29 Tomasz Figa wrote:
>> On 15.04.2014 11:28, Sachin Kamat wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> This makes it possible to enable the exynos platform as part of a
>>> multiplatform kernel, in addition to keeping the single-platform
>>> Exynos support.
>>> sparsemem is currently not supported in multiplatform.
>>
>> Is this still true as of today?
>>
>> Otherwise looks fine.
>
> sparsemem is still not supported in multiplatform, but after I looked
> at it in more detail, I came to the conclusion that there is no
> reason why it couldn't be. It just needs testing so we are confident
> that it doesn't break other platforms, and we need to find good
> platform-independent values for MAX_PHYSMEM_BITS and SECTION_SIZE_BITS
> to put into asm/memory.h, since we can't have them set in mach/memory.h
> for multiplatform.
>
> Looking at my patch again now, I would actually prefer to kill off
> the single-platform support for exynos right away. I don't see
> any reason to keep it now, and it complicates the test matrix.

That would be the best option, assuming that it wouldn't introduce 
feature regressions. Unfortunately there is still ongoing work on 
cpufreq driver to make it multiplatform-aware, so dropping single 
platform support right now would introduce at least this one regression.

Thomas, is there any progress on new version of Exynos cpufreq rework 
series?

Best regards,
Tomasz
