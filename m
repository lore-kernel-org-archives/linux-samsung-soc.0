From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: exynos4: cpu hotplug + cpuidle/AFTR broken
Date: Tue, 01 Apr 2014 14:16:52 +0200
Message-ID: <533AAE34.20601@linaro.org>
References: <533A9849.1080402@linaro.org> <533AA17A.1090405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:41623 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890AbaDAMQj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Apr 2014 08:16:39 -0400
Received: by mail-we0-f175.google.com with SMTP id q58so6055079wes.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2014 05:16:38 -0700 (PDT)
In-Reply-To: <533AA17A.1090405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>

On 04/01/2014 01:22 PM, Tomasz Figa wrote:
> Hi Daniel,
>
> On 01.04.2014 12:43, Daniel Lezcano wrote:
>>
>> Hi all,
>>
>> I tried the v3.14 kernel and unplugged the cpu1. That leads to a ker=
nel
>> hang without any trace.
>>
>> If I disable the cpuidle AFTR state through sysfs before unplugging
>> cpu1, it works well.
>>
>> I reproduced the issue on v3.14, v3.13, v3.12, v3.11
>>
>> v3.10 works fine.
>
> Could you try to reproduce the same issue on linux-next? Some of PM
> issues on Exynos should be patches there.

Tested on linux-next. Works fine.

Do you have an idea of the patch which have fixed the issue ? In order=20
to backport it the kernels mentioned above.

Thanks

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
