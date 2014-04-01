From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: exynos4: cpu hotplug + cpuidle/AFTR broken
Date: Tue, 01 Apr 2014 14:29:28 +0200
Message-ID: <533AB128.7050208@samsung.com>
References: <533A9849.1080402@linaro.org> <533AA17A.1090405@samsung.com>
 <533AAE34.20601@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61824 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096AbaDAM3g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Apr 2014 08:29:36 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3C005RKQPAQE60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Apr 2014 13:29:34 +0100 (BST)
In-reply-to: <533AAE34.20601@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>



On 01.04.2014 14:16, Daniel Lezcano wrote:
> On 04/01/2014 01:22 PM, Tomasz Figa wrote:
>> Hi Daniel,
>>
>> On 01.04.2014 12:43, Daniel Lezcano wrote:
>>>
>>> Hi all,
>>>
>>> I tried the v3.14 kernel and unplugged the cpu1. That leads to a kernel
>>> hang without any trace.
>>>
>>> If I disable the cpuidle AFTR state through sysfs before unplugging
>>> cpu1, it works well.
>>>
>>> I reproduced the issue on v3.14, v3.13, v3.12, v3.11
>>>
>>> v3.10 works fine.
>>
>> Could you try to reproduce the same issue on linux-next? Some of PM
>> issues on Exynos should be patches there.
>
> Tested on linux-next. Works fine.

Great, thanks.

>
> Do you have an idea of the patch which have fixed the issue ? In order
> to backport it the kernels mentioned above.

Most likely it's this one:

61557b8bac ARM: EXYNOS: Do not resume l2x0 if not enabled before suspend

Best regards,
Tomasz
