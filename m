From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 1/7] ARM: EXYNOS: removing redundant code from regs-pmu.h
Date: Thu, 05 Nov 2015 10:57:44 +0530
Message-ID: <563AE8D0.9070106@samsung.com>
References: <1445864143-25695-1-git-send-email-pankaj.dubey@samsung.com>
 <1445864143-25695-2-git-send-email-pankaj.dubey@samsung.com>
 <56380FD3.1060204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <56380FD3.1060204@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org



On Tuesday 03 November 2015 07:07 AM, Krzysztof Kozlowski wrote:
> On 26.10.2015 21:55, Pankaj Dubey wrote:
>> commit 6ec4f8d0d91f ("ARM: EXYNOS: add generic function to calculate
>> cpu number") introduced exynos_pmu_cpunr to be used by multi-cluster SoC's
>> e.g Exynos5420, but it's no more used in the codebase and hence removing
>> this part of code.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/pmu.c      | 1 +
>>   arch/arm/mach-exynos/regs-pmu.h | 9 ---------
>>   2 files changed, 1 insertion(+), 9 deletions(-)
>>
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks for review.

Pankaj
> Best regards,
> Krzysztof
>
>
>
