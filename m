From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add PSCI function IDs for cpu-{on,off} on
 exynos7
Date: Wed, 20 Jan 2016 08:22:41 +0530
Message-ID: <569EF679.5040909@samsung.com>
References: <1453198884-28723-1-git-send-email-alim.akhtar@samsung.com>
 <20160119103224.GA25024@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35738 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933005AbcATCv6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jan 2016 21:51:58 -0500
In-reply-to: <20160119103224.GA25024@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, k.kozlowski@samsung.com, devicetree@vger.kernel.org, kgene@kernel.org

Hi Mark,

On 01/19/2016 04:02 PM, Mark Rutland wrote:
> On Tue, Jan 19, 2016 at 03:51:24PM +0530, Alim Akhtar wrote:
>> This patch adds cpu-{on,off} function IDs as per PSCI specification,
>> with this we can boot multiple CPUs and can use cpu hotplug on
>> exynos7 platform.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos7.dtsi |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> index f9c5a549c2c0..1a2bb3b453e5 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> @@ -65,6 +65,8 @@
>>   	psci {
>>   		compatible = "arm,psci-0.2";
>>   		method = "smc";
>> +		cpu_on = <0xC4000003>;
>> +		cpu_off = <0x84000002>;
>>   	};
>
> There is no need for this patch.
>
> The "arm,psci-0.2" compatible string implicitly tells the kernel that
> the full set of mandatory PSCI 0.2 functions are present, with the IDs
> mandated by PSCI 0.2. That includes CPU_ON and CPU_OFF amongst others.
>
> The only reason to provide IDs is to function on kernels without PSCI
> 0.2 support. Given the compatible string hasn't been updated for that,
> this is insufficient for that case.
>
Ah, right, this patch is not required for psci,0.2, thanks for 
clarification.
sorry for the noise.

> Thanks,
> Mark.
>
>
