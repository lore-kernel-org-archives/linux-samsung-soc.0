From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] arm: exynos: Fix "allmodconfig" build errors in mcpm and hotplug
Date: Sat, 31 May 2014 10:15:56 +0530
Message-ID: <CAK9yfHxaDtx7r1wg_8f+A2Z-ZDwvBcfGFq9BkWhSzPjntNsg5A@mail.gmail.com>
References: <1401083696-25702-1-git-send-email-a.kesavan@samsung.com>
	<CAK9yfHzNkVZX6pMkFmdeubTgoZdRhd=U0oMtUDHr9bvZZYQYbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:64396 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbaEaEp5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 May 2014 00:45:57 -0400
Received: by mail-ob0-f174.google.com with SMTP id uz6so2671827obc.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 21:45:56 -0700 (PDT)
In-Reply-To: <CAK9yfHzNkVZX6pMkFmdeubTgoZdRhd=U0oMtUDHr9bvZZYQYbQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>

+ Olof

On 26 May 2014 12:19, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Thanks Abhilash.
>
> On 26 May 2014 11:24, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
>> This fixes the following build errors:
>>
>> /tmp/ccRbZlaA.s: Assembler messages:
>> /tmp/ccRbZlaA.s:69: Error: selected processor does not support ARM mode `isb '
>> /tmp/ccRbZlaA.s:75: Error: selected processor does not support ARM mode `isb '
>> /tmp/ccRbZlaA.s:76: Error: selected processor does not support ARM mode `dsb '
>> make[1]: *** [arch/arm/mach-exynos/hotplug.o] Error 1
>>
>> /tmp/ccJEg4jw.s: Assembler messages:
>> /tmp/ccJEg4jw.s:454: Error: selected processor does not support ARM mode `isb'
>> /tmp/ccJEg4jw.s:455: Error: selected processor does not support ARM mode `dsb'
>> /tmp/ccJEg4jw.s:465: Error: selected processor does not support ARM mode `isb'
>> /tmp/ccJEg4jw.s:474: Error: selected processor does not support ARM mode `isb'
>> /tmp/ccJEg4jw.s:475: Error: selected processor does not support ARM mode `dsb'
>> /tmp/ccJEg4jw.s:516: Error: selected processor does not support ARM mode `isb'
>> /tmp/ccJEg4jw.s:525: Error: selected processor does not support ARM mode `isb'
>> /tmp/ccJEg4jw.s:526: Error: selected processor does not support ARM mode `dsb'
>> make[1]: *** [arch/arm/mach-exynos/mcpm-exynos.o] Error 1
>>
>> Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>
> This patch fixes the above reported issues.
>
> Tested-by: Sachin Kamat <sachin.kamat@linaro.org>

Kukjin,

This patch is also needed to fix the reported build error.

-- 
With warm regards,
Sachin
