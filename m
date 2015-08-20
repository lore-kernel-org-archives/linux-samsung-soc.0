From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 3/5] ARM: EXYNOS: DTS: add SROM device node for exynos4
Date: Thu, 20 Aug 2015 17:07:47 +0530
Message-ID: <55D5BC0B.2010203@samsung.com>
References: <1430296712-10287-1-git-send-email-pankaj.dubey@samsung.com>
 <1430296712-10287-4-git-send-email-pankaj.dubey@samsung.com>
 <5565B24F.9060601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49812 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306AbbHTLiO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 07:38:14 -0400
In-reply-to: <5565B24F.9060601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux@arm.linux.org.uk, heiko@sntech.de, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, thomas.ab@samsung.com, kgene@kernel.org

Hi,


On Wednesday 27 May 2015 05:32 PM, Krzysztof Kozlowski wrote:
> W dniu 29.04.2015 o 17:38, Pankaj Dubey pisze:
>> Add SROM device node for exynos4.
>
> Subject prefix: "ARM: dts:"
>
Ok.
>>
>> CC: Rob Herring <robh+dt@kernel.org>
>> CC: Mark Rutland <mark.rutland@arm.com>
>> CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index 77ea547..48490ea 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -76,6 +76,11 @@
>>   		reg = <0x10000000 0x100>;
>>   	};
>>
>> +	sromc@12570000 {
>> +		compatible = "samsung,exynos-srom";
>> +		reg = <0x12570000 0x100>;
>
> There are 5 registers, so size of 0x100 seems to be bigger than needed.
> Maybe limit it to actual length?
>
Yes, we do not need size of 0x100. Will take care in next version.

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
>
