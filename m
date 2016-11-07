From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/4] ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
Date: Mon, 07 Nov 2016 09:07:42 +0530
Message-ID: <581FF706.3050502@samsung.com>
References: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
 <1478230764-13748-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161105154127epcas1p1316e4c558b8442426db131ce7bb87bd2@epcas1p1.samsung.com>
 <20161105154119.GA8183@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56306 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752132AbcKGDe4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Nov 2016 22:34:56 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG901K6S5XQNZ70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Nov 2016 12:34:38 +0900 (KST)
In-reply-to: <20161105154119.GA8183@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, thomas.ab@samsung.com

Hi Krzysztof,

On Saturday 05 November 2016 09:11 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 04, 2016 at 09:09:21AM +0530, Pankaj Dubey wrote:
>> We can safely remove exynos_smp_init_cpus() hook from mach-exynos/platsmp.c,
>> as all SMP platforms in mach-exynos can rely on DT for CPU core description
>> instead of determining number of cores from the SCU.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  arch/arm/mach-exynos/platsmp.c | 31 -------------------------------
>>  1 file changed, 31 deletions(-)
>>
> 
> 
> Thanks, applied. Somehow your patchset did not reach linux-samsung-soc's
> Parchwork. I don't have a clue why... It is on linux-arm-kernel's
> Patchwork.
> 

Thanks for looking into this series.

I am also not sure why its not reflecting for you on linux-samsung-soc's
Patchwork, but I can see this series in linux-samsung-soc Patchwork at
below links:

[1/4]: https://patchwork.kernel.org/patch/9411787/
[2/4]: https://patchwork.kernel.org/patch/9411789/
[3/4]: https://patchwork.kernel.org/patch/9411791/
[4/4]: https://patchwork.kernel.org/patch/9411793/

Will you please review other two patches (3/4 and 4/4) in this series?

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
> 
> 
> 
> 
