From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add BUS1 instance pinctrl support
Date: Mon, 14 Sep 2015 15:26:29 +0900
Message-ID: <55F66895.7030902@samsung.com>
References: <1440761134-27639-1-git-send-email-alim.akhtar@samsung.com>
 <55E3E95D.50003@samsung.com> <55F6563A.2030107@samsung.com>
 <55F6606F.3090000@samsung.com> <55F66641.6010209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40123 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbbING0k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Sep 2015 02:26:40 -0400
In-reply-to: <55F66641.6010209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, gautam.vivek@samsung.com

On 14.09.2015 15:16, Alim Akhtar wrote:
> Hello,
> 
> On 09/14/2015 11:21 AM, Krzysztof Kozlowski wrote:
>> On 14.09.2015 14:08, Alim Akhtar wrote:
>>> Hi
>>>
>>> On 08/31/2015 11:12 AM, Krzysztof Kozlowski wrote:
>>>> On 28.08.2015 20:25, Alim Akhtar wrote:
>>>>> This adds BUS1 instance pinctrl for exynos7 soc.
>>>>>
>>>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi |  111
>>>>> +++++++++++++++++++++++
>>>>>    arch/arm64/boot/dts/exynos/exynos7.dtsi         |    7 ++
>>>>>    2 files changed, 118 insertions(+)
>>>>
>>>> The "etc1" GPIO in my datasheet is not fully documented but the rest
>>>> looks good:
>>>>
>>> Ok will send v2 and remove etc1 gpio node.
>>
>> You don't have to. I mentioned it only for reference that I cannot
>> review the etc GPIO node because it is not mentioned in my datasheet.
>> However you may have different (e.g. newer) datasheet and etc1 could be
>> documented there.
>>
> Sorry for delay, I check two versions of the UM and unfortunately both
> show incomplete entries for etc1, my downstream code has these changes
> though.
>> I applied the first version of patch some time ago (your response is
>> after two weeks). Do you want me to replace it with v2?
>>
> Please consider taking my v2 which I just posted.
> Thanks again.

Okay, I'll replace the patch with v2.

Best regards,
Krzysztof
