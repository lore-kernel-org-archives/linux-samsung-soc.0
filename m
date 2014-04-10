From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 21/27] ARM: dts: exynos3250: Add PMU dt data
Date: Thu, 10 Apr 2014 20:20:10 +0900
Message-ID: <53467E6A.6040105@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
 <1397124377-16969-13-git-send-email-cw00.choi@samsung.com>
 <002701cf54a6$f6593720$e30ba560$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25901 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935056AbaDJLUN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 07:20:13 -0400
In-reply-to: <002701cf54a6$f6593720$e30ba560$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org

Hi,

On 04/10/2014 07:23 PM, Chanho Park wrote:
> Hi,
> 
>> -----Original Message-----
>> From: linux-arm-kernel [mailto:linux-arm-kernel-
>> bounces@lists.infradead.org] On Behalf Of Chanwoo Choi
>> Sent: Thursday, April 10, 2014 7:06 PM
>> To: kgene.kim@samsung.com; t.figa@samsung.com; linux-samsung-
>> soc@vger.kernel.org
>> Cc: hyunhee.kim@samsung.com; sw0312.kim@samsung.com; linux-
>> kernel@vger.kernel.org; yj44.cho@samsung.com; inki.dae@samsung.com;
>> cw00.choi@samsung.com; kyungmin.park@samsung.com; linux-arm-
>> kernel@lists.infradead.org
>> Subject: [PATCH 21/27] ARM: dts: exynos3250: Add PMU dt data
>>
>> From: Hyunhee Kim <hyunhee.kim@samsung.com>
>>
>> ARM CPU has its own PMU (Performance Monitoring Unit). This patch add
>> PMU dt
>> data to support PMU for CPU. Exynos3250 has four PMU interrupts.
>>
>> Signed-off-by: Hyunhee Kim <hyunhee.kim@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos3250.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi
>> b/arch/arm/boot/dts/exynos3250.dtsi
>> index ceed761..2f0ca32 100644
>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>> @@ -280,4 +280,9 @@
>>  		pinctrl-0 = <&i2c7_bus>;
>>  		status = "disabled";
>>  	};
>> +
>> +	pmu {
>> +		compatible = "arm,cortex-a7-pmu";
>> +		interrupts = <0 18 0>, <0 19 0>, <0 20 0>, <0 21 0>;
>> +	};
> 
> As I know, the exynos3250 has two CPU cores. Why does it have four pmu
> interrupts?
> IMO it is sufficient it has only two interrupts.

OK, I'll fix it using only two interrupt for dual-core.

Best Regards,
Chanwoo Choi
