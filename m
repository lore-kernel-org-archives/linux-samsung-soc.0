From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/25] ARM: dts: exynos4: add rotator nodes
Date: Fri, 13 Nov 2015 17:36:42 +0900
Message-ID: <5645A11A.4050304@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-2-git-send-email-m.szyprowski@samsung.com>
 <56454B02.9030502@samsung.com> <5645A038.3040207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18775 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754459AbbKMIgp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 03:36:45 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXQ005SJVX7DQ60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 08:36:43 +0000 (GMT)
In-reply-to: <5645A038.3040207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

On 13.11.2015 17:32, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-11-13 03:29, Krzysztof Kozlowski wrote:
>> On 10.11.2015 22:23, Marek Szyprowski wrote:
>>> This patch adds device node for Rotator device to Exynos 4210 and 4x12
>>> device tree files.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos4.dtsi    | 10 +++++++++-
>>>   arch/arm/boot/dts/exynos4210.dtsi |  8 ++++++++
>>>   arch/arm/boot/dts/exynos4x12.dtsi |  4 ++++
>>>   3 files changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>>> b/arch/arm/boot/dts/exynos4.dtsi
>>> index 2f31f773b096..3fa575ad7693 100644
>>> --- a/arch/arm/boot/dts/exynos4.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>>> @@ -718,6 +718,15 @@
>>>           iommus = <&sysmmu_jpeg>;
>>>       };
>>>   +    rotator: rotator@12810000 {
>>> +        compatible = "samsung,exynos4210-rotator";
>>> +        reg = <0x12810000 0x1000>;
>> One more question after looking at second patch. You are mapping size of
>> 0x1000 instead of 0x64. Any particular reason? (it does not really
>> matter... just wondering)
> 
> Nope, it might be just a copy/paste issue I've missed. Do you want to
> unify it to
> 0x64 or 0x1000?

To 0x64, please. That would make it synced with datasheet.

Best regards,
Krzysztof
