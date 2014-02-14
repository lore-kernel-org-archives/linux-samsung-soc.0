From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: Samsung-clk patches for 3.15
Date: Fri, 14 Feb 2014 09:05:29 +0900
Message-ID: <52FD5DC9.6000006@samsung.com>
References: <52E27AE9.7040501@samsung.com> <52E6EDC1.9080003@gmail.com> <251c01cf1bbd$36802390$a3806ab0$@samsung.com> <52E6F726.1070900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:62228 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbaBNAFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 19:05:37 -0500
Received: by mail-pb0-f50.google.com with SMTP id rq2so11510428pbb.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 16:05:37 -0800 (PST)
In-Reply-To: <52E6F726.1070900@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, a.hajda@samsung.com, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, thomas.ab@samsung.com, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'Mike Turquette' <mturquette@linaro.org>

On 01/28/14 09:17, Tomasz Figa wrote:
>
>
> On 28.01.2014 01:09, Kukjin Kim wrote:
>> Tomasz Figa wrote:
>>>
>>> [Forgot to Cc Mike...]
>>>
>>> On 24.01.2014 15:38, Tomasz Figa wrote:
>>>> Hi,
>>>>
>>
>> Hi,
>>
>>>> Linux 3.14 is going to include Andrzej Hajda's patches converting
>>>> Samsung clock drivers to use clock ID defines in include/dt-bindings,
>>>> instead of local enums, but to avoid unnecessary merge conflicts we
>>>> have converted only the clock driver, leaving DTS files unchanged yet.
>>>>
>>>> We intend to complete the conversion in 3.15, by replacing magic
>>>> numbers in DTS files with respective preprocessor macros, but to
>>>> reduce potential conflicts we need help of you, Samsung clock patches
>>> authors :).
>>>>
>>>> I'd like to ask anybody who already has patches for DTS files adding
>>>> any clock-related contents still using numeric IDs, e.g. clock
>>>> properties in nodes or full nodes containing clock properties, to make
>>>> sure that the patches are merged before Andrzej sends the conversion
>>>> patches. Then Andrzej's script will generate patches updating all
>>>> clock properties, leaving no numeric IDs in DTS files.
>>>>
>>
>> There are several DTS patches in v3.14-drop/soc-exynos-2 branch of my
>> tree
>> for 3.15 and it will be merged after done of multiplatform, I need to
>> rebase
>> them based on v3.14-rc1 though...So I think, would be better if we could
>> update DTS with using Andrzej's script after merging it into arm-soc...
>
> Basically my intention is to:
>
> 1) Have any existing patches using clock numbers merged in reasonable
> period of time (to not miss the merge window with DTS conversion patches).
>
> 2) Stop accepting such patches anymore.
>
> 3) Rerun Andrzej's script and convert all device tree sources to use
> clock macros.
>
> Andrzej's patches for DTSes should go through your tree anyway (as any
> Samsung DTS patches by default), so it shouldn't be a problem,
> regardless of merging anything into arm-soc.
>

Makes sense, OK. I agreed. I'll apply Andrzej's "[PATCH RESEND v2 00/12] 
clk/exynos convert clock IDs to macros" and every exynos dt should be 
posted based on that from now on.

Thanks,
- Kukjin
