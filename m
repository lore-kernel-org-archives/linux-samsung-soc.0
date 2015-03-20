From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] exynos: pmu: use PS_HOLD based poweroff for all supported
 SoCs
Date: Fri, 20 Mar 2015 16:11:04 +0100
Message-ID: <550C3888.7050905@samsung.com>
References: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
 <CAJKOXPeeUjcwO6qBdHA8DJaviPxRwjAsSe7ciyGDFOUoNhZvcQ@mail.gmail.com>
 <CAJKOXPe4=DHsV3_axDUhpimRaqSHA3=HLiSJ1K3DYZoGRRiTTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23358 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbbCTPLI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 11:11:08 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NLI00C4PNP5SDC0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Mar 2015 15:15:05 +0000 (GMT)
In-reply-to: <CAJKOXPe4=DHsV3_axDUhpimRaqSHA3=HLiSJ1K3DYZoGRRiTTg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Hello,

On 2015-02-09 11:58, Krzysztof Kozlowski wrote:
> 2015-02-09 10:06 GMT+01:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>> 2015-02-09 8:25 GMT+01:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>>> PS_HOLD based power off procedure is common for all Exynos SoCs, so use
>>> it for every Exynos SoC.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/pmu.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> I tried this on Trats2 board (Exynos 4412) and message "Power down
>> failed, please power off system manually." appears. Is it expected? Or
>> am I missing some patches (I applied this on top of next-20150129)?
> It was my fault (I left attached JIG cable which prevents power off).
> Now it works fine.
>
> Tested on Trats2 (Exynos4412):
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Patch also looks good, so:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Gentle ping for merging this in v4.1-next...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
