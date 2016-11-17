From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/5] arm64: dts: exynos: Move FSYS CMU configuration from
 Exynos5433 dtsi to TM2 dts
Date: Thu, 17 Nov 2016 07:36:17 +0100
Message-ID: <f29233a6-26dd-d36e-7ae6-b69b5fa60b67@samsung.com>
References: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161116130708eucas1p15ac7edddb555cc2b55bb28142ce9656e@eucas1p1.samsung.com>
 <1479301615-11240-4-git-send-email-m.szyprowski@samsung.com>
 <20161116165402.GA3727@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38229 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936405AbcKQGgX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 01:36:23 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGR00CECX0KSG40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 06:36:20 +0000 (GMT)
In-reply-to: <20161116165402.GA3727@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Krzysztof,


On 2016-11-16 17:54, Krzysztof Kozlowski wrote:
> On Wed, Nov 16, 2016 at 02:06:53PM +0100, Marek Szyprowski wrote:
>> Move initial FSYS CMU (related to USB 3.0 devices) clocks configuration
>> from generic exynos5433.dtsi file to exynos5433-tm2.dts, as this is
>> a board specific item.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 13 +++++++++++++
>>   arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 28 ---------------------------
>>   2 files changed, 13 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> index 9ea3f32..b7b2482 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> @@ -892,6 +892,19 @@
>>   	status = "okay";
>>   };
>>   
>> +&cmu_fsys {
> If there would be a resubmit, please put it in alphabetical order.
>
>> +	assigned-clocks = <&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
>> +		<&cmu_top CLK_MOUT_SCLK_USBDRD30>,
>> +		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
>> +		<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>,
>> +		<&cmu_top CLK_DIV_SCLK_USBDRD30>;
>> +	assigned-clock-parents = <&cmu_top CLK_SCLK_USBDRD30_FSYS>,
>> +		<&cmu_top CLK_MOUT_BUS_PLL_USER>,
>> +		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
>> +		<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>;
>> +	assigned-clock-rates = <0>, <0>, <0>, <0>, <66700000>;
> I see this is not an equivalent change - some clocks are not assigned
> now. I had impression from the commit msg that it will be just a move so
> no practical impact. Won't there be a problem with missing clock
> assigns?

I've checked those clocks 2 times and I must have been blind. The clock
identifiers are so long that I missed that some PHYCLK related clocks are
for DRD and some for HOST USB. I will add missing assigns in the next 
version.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
