From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Map PMU address through DT
Date: Wed, 19 Mar 2014 17:01:25 +0100
Message-ID: <5329BF55.8000705@samsung.com>
References: <1395061795-17777-1-git-send-email-vikas.sajjan@samsung.com>
 <1395061795-17777-2-git-send-email-vikas.sajjan@samsung.com>
 <CAK9yfHyF9t0fsO86cqHvAzaWKa17=2MkFq6mhoL0-mwjw6OXQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28623 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757657AbaCSQBd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 12:01:33 -0400
In-reply-to: <CAK9yfHyF9t0fsO86cqHvAzaWKa17=2MkFq6mhoL0-mwjw6OXQQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

On 17.03.2014 15:23, Sachin Kamat wrote:
> Hi Vikas,
>
> On 17 March 2014 18:39, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> Instead of hardcoding the PMU details for each SoC, pass this information
>> through device tree (DT).
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> ---
>>   .../devicetree/bindings/arm/samsung/pmu.txt        |    5 +-
>>   arch/arm/boot/dts/exynos4.dtsi                     |    5 ++
>>   arch/arm/boot/dts/exynos5260.dtsi                  |    5 ++
>>   arch/arm/mach-exynos/common.c                      |   51 +++++++++++++-------
>>   arch/arm/mach-exynos/include/mach/map.h            |    3 --
>>   5 files changed, 47 insertions(+), 22 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> index f1f1552..667a7f0 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> @@ -2,14 +2,15 @@ SAMSUNG Exynos SoC series PMU Registers
>>
>>   Properties:
>>    - compatible : should contain two values. First value must be one from following list:
>> +                  - "samsung,exynos4210-pmu" - for Exynos4210 and Exynos4x12 SoC,
>>                     - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
>> -                  - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
>> +                  - "samsung,exynos5420-pmu" - for Exynos5420 and Exynos5260 SoC.
>>                  second value must be always "syscon".
>>
>>    - reg : offset and length of the register set.
>>
>>   Example :
>>   pmu_system_controller: system-controller@10040000 {
>> -       compatible = "samsung,exynos5250-pmu", "syscon";
>> +       compatible = "samsung,exynos5250-pmu";
>
> If you have removed "syscon" deliberately above, then you should also
> remove the same in the
> binding description which says "second value must be always "syscon".".
>

I believe that "syscon" should be still present as I don't see any code 
providing access to PMU registers to other drivers, that could replace 
the standard syscon interface, being added by this series.

Best regards,
Tomasz
