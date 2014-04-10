From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 10/20] ARM: exynos: cpuidle: Move clock setup to pm.c
Date: Thu, 10 Apr 2014 17:34:33 +0200
Message-ID: <5346BA09.9020708@samsung.com>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
 <1397123751-1957-11-git-send-email-daniel.lezcano@linaro.org>
 <5346A367.2070107@samsung.com> <5346A958.1030302@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13650 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753049AbaDJPei (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 11:34:38 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3T003CMN9HA810@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Apr 2014 16:34:29 +0100 (BST)
In-reply-to: <5346A958.1030302@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

On 10.04.2014 16:23, Daniel Lezcano wrote:
> On 04/10/2014 03:57 PM, Tomasz Figa wrote:
>> Hi Daniel,
>>
>> On 10.04.2014 11:55, Daniel Lezcano wrote:
>>> One more step is moving the clock ratio setting at idle time in pm.c
>>>
>>> The macro names have been changed to be consistent with the other macros
>>> name in the file.
>>>
>>> Note, the clock divider was working only when cpuidle was enabled
>>> because it
>>> was in its init routine. With this change, the clock divider is set in
>>> the pm's
>>> init routine, so it will also operate when the cpuidle driver is not
>>> set, which
>>> is good.
>>>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/cpuidle.c  |   54
>>> ---------------------------------------
>>>   arch/arm/mach-exynos/pm.c       |   35 +++++++++++++++++++++++++
>>>   arch/arm/mach-exynos/regs-pmu.h |   19 ++++++++++++++
>>>   3 files changed, 54 insertions(+), 54 deletions(-)
>>
>> Sorry that I didn't mention that before, but now I recall that there was
>> already a similar patch moving this code to Exynos5250 clock driver,
>> which is the best place for setup of any CMU registers and a step
>> towards removing one more static IO mapping.
>
> Yes, Bartlomiej mentioned it.
>
> Is it possible to merge this mentioned patch or to give a pointer to it
> so I can integrate it into the patchset ?

http://marc.info/?l=linux-arm-kernel&m=138147021207626&w=2

I wonder if it still applies cleanly, though...

Best regards,
Tomasz
