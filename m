From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 01/25] ARM: dts: exynos4: add rotator nodes
Date: Fri, 13 Nov 2015 09:31:30 +0100
Message-ID: <56459FE2.3010404@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-2-git-send-email-m.szyprowski@samsung.com>
 <56454987.8000501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22261 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799AbbKMIbd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 03:31:33 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXQ00NKCVOJ1G60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 08:31:31 +0000 (GMT)
In-reply-to: <56454987.8000501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

On 2015-11-13 03:23, Krzysztof Kozlowski wrote:
> On 10.11.2015 22:23, Marek Szyprowski wrote:
>> This patch adds device node for Rotator device to Exynos 4210 and 4x12
>> device tree files.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi    | 10 +++++++++-
>>   arch/arm/boot/dts/exynos4210.dtsi |  8 ++++++++
>>   arch/arm/boot/dts/exynos4x12.dtsi |  4 ++++
>>   3 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index 2f31f773b096..3fa575ad7693 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -718,6 +718,15 @@
>>   		iommus = <&sysmmu_jpeg>;
>>   	};
>>   
>> +	rotator: rotator@12810000 {
>> +		compatible = "samsung,exynos4210-rotator";
>> +		reg = <0x12810000 0x1000>;
>> +		interrupts = <0 83 0>;
>> +		clocks = <&clock CLK_ROTATOR>;
>> +		clock-names = "rotator";
>> +		iommus = <&sysmmu_rotator>;
>> +	};
>> +
>>   	hdmi: hdmi@12D00000 {
>>   		compatible = "samsung,exynos4210-hdmi";
>>   		reg = <0x12D00000 0x70000>;
>> @@ -945,7 +954,6 @@
>>   		interrupts = <5 0>;
>>   		clock-names = "sysmmu", "master";
>>   		clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
>> -		power-domains = <&pd_lcd0>;
> Hmm.... I wonder why you changed this. Sysmmu rotator and rotator are
> not a part of LCD power domain on Exynos4x12 (or they should not be?)? Why?

On Exynos 4210 rotator (and its SYSMMU) belongs to LCD0 power domain. On
Exynos 4x12 it belong to TOP power domain (which is always on and not
described in DTS).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
