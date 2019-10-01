From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add interrupt to DMC controller
 in Exynos5422
Date: Tue, 1 Oct 2019 14:38:43 +0200
Message-ID: <16c56e81-d0a7-a405-fa12-83442364c260@partner.samsung.com>
References: <20190925161813.21117-1-l.luba@partner.samsung.com>
        <CGME20190925161842eucas1p271a9cf4f62b3d7af02c0a5d0d1eb9c4f@eucas1p2.samsung.com>
        <20190925161813.21117-2-l.luba@partner.samsung.com>
        <20190927085359.GA19131@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927085359.GA19131@pi3>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 9/27/19 10:53 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 25, 2019 at 06:18:11PM +0200, Lukasz Luba wrote:
>> Add interrupt to Dynamic Memory Controller in Exynos5422 and Odroid
>> XU3-family boards. It will be used instead of devfreq polling mode
>> governor. The interrupt is connected to performance counters private
>> for DMC, which might track utilisation of the memory channels.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5420.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index ac49373baae7..72738e620d11 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -240,6 +240,8 @@
>>   		dmc: memory-controller@10c20000 {
>>   			compatible = "samsung,exynos5422-dmc";
>>   			reg = <0x10c20000 0x100>, <0x10c30000 0x100>;
>> +			interrupt-parent = <&combiner>;
>> +			interrupts = <16 0>;
> 
> You register DMC for DREX0 and DREX1 but take only DREX0 interrupt. Why
> skipping second?
> 

Right, the second should also be there: <16 1>. The channel 1 has not
been triggered in CPU test cases but might be used by some other
NoC clients.
I will add it in the next version.

Regards,
Lukasz
