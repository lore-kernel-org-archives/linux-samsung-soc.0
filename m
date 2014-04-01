From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: exynos4: cpu hotplug + cpuidle/AFTR broken
Date: Tue, 01 Apr 2014 14:49:17 +0200
Message-ID: <533AB5CD.7080209@linaro.org>
References: <533A9849.1080402@linaro.org> <533AA17A.1090405@samsung.com> <533AAE34.20601@linaro.org> <533AB128.7050208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:38679 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751162AbaDAMtG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Apr 2014 08:49:06 -0400
Received: by mail-we0-f173.google.com with SMTP id w61so6135129wes.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2014 05:49:04 -0700 (PDT)
In-Reply-To: <533AB128.7050208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>

On 04/01/2014 02:29 PM, Tomasz Figa wrote:
>
>
> On 01.04.2014 14:16, Daniel Lezcano wrote:
>> On 04/01/2014 01:22 PM, Tomasz Figa wrote:
>>> Hi Daniel,
>>>
>>> On 01.04.2014 12:43, Daniel Lezcano wrote:
>>>>
>>>> Hi all,
>>>>
>>>> I tried the v3.14 kernel and unplugged the cpu1. That leads to a k=
ernel
>>>> hang without any trace.
>>>>
>>>> If I disable the cpuidle AFTR state through sysfs before unpluggin=
g
>>>> cpu1, it works well.
>>>>
>>>> I reproduced the issue on v3.14, v3.13, v3.12, v3.11
>>>>
>>>> v3.10 works fine.
>>>
>>> Could you try to reproduce the same issue on linux-next? Some of PM
>>> issues on Exynos should be patches there.
>>
>> Tested on linux-next. Works fine.
>
> Great, thanks.
>
>>
>> Do you have an idea of the patch which have fixed the issue ? In ord=
er
>> to backport it the kernels mentioned above.
>
> Most likely it's this one:
>
> 61557b8bac ARM: EXYNOS: Do not resume l2x0 if not enabled before susp=
end

Confirmed.

This patch fixes the issue.

Will you send the fix for the different kernel v3.14, v3.13, v3.12 ?=20
(v3.11 is EOL).

Thanks !

   -- Daniel

<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for =
ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
