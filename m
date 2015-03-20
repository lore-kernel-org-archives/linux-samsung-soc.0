From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Fri, 20 Mar 2015 09:25:28 +0100
Message-ID: <CAJKOXPeD86vmrKm8tYgccxzTQrshXbU981tMxwBvbDUK9-6-Lw@mail.gmail.com>
References: <54D779FB.9070306@math.uni-bielefeld.de>
	<54D86913.2050109@samsung.com>
	<54DF9089.8050204@math.uni-bielefeld.de>
	<CAJKOXPcSRjO__ywh0QVDex8zKZ2FEvgCt4JsPs78_kHzCtqZBA@mail.gmail.com>
	<71afa85252e1c95251e696749172757b@math.uni-bielefeld.de>
	<550B75F4.2000901@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:33476 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbbCTIZ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 04:25:29 -0400
Received: by ykek76 with SMTP id k76so39214648yke.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2015 01:25:28 -0700 (PDT)
In-Reply-To: <550B75F4.2000901@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, p.osmialowsk@samsung.com

2015-03-20 2:20 GMT+01:00 Tobias Jakobi <liquid.acid@gmx.net>:
> Hello!
>
> Tobias Jakobi wrote:
>> Hello Krzysztof,
>>
>> On 2015-02-17 14:24, Krzysztof Kozlowski wrote:
>>> Looking at the backtrace this seems very likely however I have
>>> troubles reproducing this. Any special tree or config is required
>>> (except MMC_CLKGATE and DEBUG_ATOMIC_SLEEP)?
>>>
>>> Best regards,
>>> Krzysztof
>> The kernel was build with this config:
>> https://github.com/tobiasjakobi/odroid-environment/blob/master/sourcecode/system/vanilla-3.19-debug.conf
>>
>>
>> I didn't have DEBUG_ATOMIC_SLEEP enabled back then, but I could try to
>> reproduce it again.
> This issue is still happening with 4.0.0-rc4.
>
> [    7.336824] BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:97

Hi,

Yes, Pawel Osmialowski's patch fixed one such issue but the rest still
exists. I looked at this and it was not quite easy fix. I don't have
spare time now for this issue so if anyone is interested in fixing
this then it would be great.

BTW Tobias, the OOPS/dmesg of yours is wrapped around 72 char. It is
harder to read it this way.

Best regards,
Krzysztof
