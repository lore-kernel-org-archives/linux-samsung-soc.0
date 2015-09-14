From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add BUS1 instance pinctrl support
Date: Mon, 14 Sep 2015 10:38:10 +0530
Message-ID: <55F6563A.2030107@samsung.com>
References: <1440761134-27639-1-git-send-email-alim.akhtar@samsung.com>
 <55E3E95D.50003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39097 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbbINFRc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Sep 2015 01:17:32 -0400
In-reply-to: <55E3E95D.50003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, gautam.vivek@samsung.com

Hi

On 08/31/2015 11:12 AM, Krzysztof Kozlowski wrote:
> On 28.08.2015 20:25, Alim Akhtar wrote:
>> This adds BUS1 instance pinctrl for exynos7 soc.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi |  111 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/exynos/exynos7.dtsi         |    7 ++
>>   2 files changed, 118 insertions(+)
>
> The "etc1" GPIO in my datasheet is not fully documented but the rest
> looks good:
>
Ok will send v2 and remove etc1 gpio node.

> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
Thanks!!
> Best regards,
> Krzysztof
>
>
