From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM
Date: Tue, 27 May 2014 07:06:10 +0900
Message-ID: <5383BAD2.6020406@samsung.com>
References: <1400670752-673-1-git-send-email-t.figa@samsung.com>	<1400858533-4327-1-git-send-email-t.figa@samsung.com>	<53826377.8060709@samsung.com> <CAKohpo=b=Jm4vZfgS2YPA740QfvktgVExXXzOdSUmQjGWhzrhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:36242 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826AbaEZWGT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 18:06:19 -0400
Received: by mail-pa0-f48.google.com with SMTP id rd3so8094426pab.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 15:06:18 -0700 (PDT)
In-Reply-To: <CAKohpo=b=Jm4vZfgS2YPA740QfvktgVExXXzOdSUmQjGWhzrhg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sachin Kamat <sachin.kamat@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On 05/26/14 14:40, Viresh Kumar wrote:
> On 26 May 2014 03:11, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> I'm not sure Thomas' v5 cpufreq-cpu0 driver can be upstreamed for 3.16
>> because of dependency with others, some of them got ack though...
>>
>> * "PM / OPP: move cpufreq specific helpers out of OPP layer"
>> - https://www.mail-archive.com/linux-omap@vger.kernel.org/msg104610.html
>
> This is already lying in Rafael's tree.
>
Good.

>> * "cpufreq: opp: Add device tree based lookup of boost mode frequency"
>> - http://www.spinics.net/lists/arm-kernel/msg334336.html
>>
Probably need more time?

>> So firstly, I've queued this instead with exynos-multiplatform series...
>>
>> How do you think?
>
> Looks fine to me. Thanks.

OK, I applied with your ack.

Thanks,
- Kukjin
