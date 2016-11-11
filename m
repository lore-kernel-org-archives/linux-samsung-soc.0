From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add ARM PMU node for exynos7
Date: Fri, 11 Nov 2016 18:31:21 +0530
Message-ID: <5825C121.6050708@samsung.com>
References: <1478748643-3081-1-git-send-email-alim.akhtar@samsung.com>
 <CGME20161110133734epcas3p2b271260900216d3e3a4b2b8e133a327b@epcas3p2.samsung.com>
 <4922ada9-2eb2-f0cf-e4b1-a74f4397f97c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <4922ada9-2eb2-f0cf-e4b1-a74f4397f97c@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Robin,

On 11/10/2016 07:07 PM, Robin Murphy wrote:
> Hi Alim,
>
> On 10/11/16 03:30, Alim Akhtar wrote:
>> This patch adds ARM Performance Monitor Unit dt node for exynos7.
>> PMU provides various statistics on the operation of the CPU and
>> memory system at runtime, which are very useful when debugging or
>> profiling code. This enables the same.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos7.dtsi |    8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> index e0d0d01..53ce4be 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> @@ -472,6 +472,14 @@
>>   			status = "disabled";
>>   		};
>>
>> +		arm-pmu {
>> +			compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
>> +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
>
> Per Documentation/devicetree/bindings/arm/pmu.txt there should also be
> an "interrupt-affinity" property describing which SPI belongs to which core.
>
Thanks for review, will resend after adding "interrupt-affinity" property.

> Robin.
>
>> +		};
>> +
>>   		timer {
>>   			compatible = "arm,armv8-timer";
>>   			interrupts = <GIC_PPI 13
>>
>
>
>
>
