From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 4/7] ARCH: EXYNOS: split up exynos4 SoC specific PMU data
Date: Thu, 05 Nov 2015 11:03:48 +0530
Message-ID: <563AEA3C.8090603@samsung.com>
References: <1445864143-25695-1-git-send-email-pankaj.dubey@samsung.com>
 <1445864143-25695-5-git-send-email-pankaj.dubey@samsung.com>
 <56381432.1080908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44740 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932103AbbKEFdm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 00:33:42 -0500
In-reply-to: <56381432.1080908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com



On Tuesday 03 November 2015 07:26 AM, Krzysztof Kozlowski wrote:
> On 26.10.2015 21:55, Pankaj Dubey wrote:
>> This patch splits up mach-exynos/pmu.c file, and moves exynos4210,
>> exynos4412 and exynos4212 PMU configuration data and functions handing
>> data into a common exynos4 SoC specific PMU file mach-exynos/exynos4-pmu.c.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/Makefile      |   2 +-
>>   arch/arm/mach-exynos/exynos-pmu.h  |   3 +
>>   arch/arm/mach-exynos/exynos4-pmu.c | 223 +++++++++++++++++++++++++++++++++++++
>>   arch/arm/mach-exynos/pmu.c         | 207 ----------------------------------
>>   4 files changed, 227 insertions(+), 208 deletions(-)
>>   create mode 100644 arch/arm/mach-exynos/exynos4-pmu.c
>>
>
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks,

Pankaj Dubey

> Best regards,
> Krzysztof
>
>
