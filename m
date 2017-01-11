From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: Replace small letter of base
 address/offset on Exynos5433
Date: Thu, 12 Jan 2017 06:22:42 +0900
Message-ID: <CAGTfZH0H_kA9cRPG4Vqh3iLZncfXqfKDFiSYEXV1zp+9yFP25Q@mail.gmail.com>
References: <CGME20170111005552epcas1p4a1f6ed88022b46544dec4b3801583267@epcas1p4.samsung.com>
 <1484096148-17120-1-git-send-email-cw00.choi@samsung.com> <20170111162613.lxkc7k75f6q3fsz2@kozik-lap>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170111162613.lxkc7k75f6q3fsz2@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, a.hajda@samsung.com, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

2017-01-12 1:26 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
> On Wed, Jan 11, 2017 at 09:55:48AM +0900, Chanwoo Choi wrote:
>> This patch replaces the small letter of base address, offset and hex value
>> with the capital letter to keep the consistency on Exynos5433.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> index abaf6b4d599d..d7ed1a68b6fd 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> @@ -231,7 +231,7 @@
>>               compatible = "arm,psci";
>>               method = "smc";
>>               cpu_off = <0x84000002>;
>> -             cpu_on = <0xC4000003>;
>> +             cpu_on = <0xc4000003>;
>
> There is no point of such "improvements". This is just unnecessary
> churn.
>
> Sometimes such things are accepted as part of some bigger work (vide
> recent Andrzej's sysmmu for HDMI/TV). But on its own? No sense at all.

Do you mean that this patch is not reasonable? or
The modification of cpu_on property is only not reasonable?

It is simple for the consistency to use the hex value in dts file.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
