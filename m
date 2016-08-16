From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/7] Documentation: bindings: Add Exynos5433 PMU compatible
Date: Tue, 16 Aug 2016 17:08:14 +0900
Message-ID: <57B2C9EE.6000005@samsung.com>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471328843-26653-3-git-send-email-cw00.choi@samsung.com>
 <CGME20160816074111epcas1p2ef832dad29a5b0a81fc5e783aed70ee4@epcas1p2.samsung.com>
 <488f925b-4c37-1759-04a8-11d992405527@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58117 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928AbcHPIIR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 04:08:17 -0400
In-reply-to: <488f925b-4c37-1759-04a8-11d992405527@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, chanwoo@kernel.org

Hi Krzysztof,

On 2016년 08월 16일 16:40, Krzysztof Kozlowski wrote:
> On 08/16/2016 08:27 AM, Chanwoo Choi wrote:
>> This patch adds the exynos5433 PMU compatible to support the access
>> of PMU (Power Management Unit) block.
>>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> index 2d6356d8daf4..bf5fc59a6938 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> @@ -10,6 +10,7 @@ Properties:
>>  		   - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
>>  		   - "samsung,exynos5410-pmu" - for Exynos5410 SoC,
>>  		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
>> +		   - "samsung,exynos5433-pmu" - for Exynos5433 SoC.
>>  		   - "samsung,exynos7-pmu" - for Exynos7 SoC.
>>  		second value must be always "syscon".
> 
> Is there any plan to add Exynos5433 support to
> drivers/soc/samsung/exynos-pmu.c? If no... then exynos7-pmu might be
> reused. If yes, then this makes sense.

Yes.
I'll support the suspend-to-ram for Exynos5433. But it is not right now.
because the current kernel support the suspend-to-ram for only 32-bit Exynos.
and the pm/suspend code are included in in arch/arm/mach-exynos/.

To support the suspend-to-ram for 64bit Exynos, I need a lot of time
to support the 64-bit suspend.

Regards,
Chanwoo Choi
