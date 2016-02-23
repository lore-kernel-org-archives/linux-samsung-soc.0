From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Move syscon reboot/poweroff to common dtsi
 for Exynos
Date: Tue, 23 Feb 2016 09:18:25 +0900
Message-ID: <56CBA551.4030205@samsung.com>
References: <1455636348-14277-1-git-send-email-javier@osg.samsung.com>
 <56C3D745.7050904@samsung.com> <56C3D99C.3090403@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19469 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159AbcBWASc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Feb 2016 19:18:32 -0500
In-reply-to: <56C3D99C.3090403@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

On 17.02.2016 11:23, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 02/16/2016 11:13 PM, Krzysztof Kozlowski wrote:
> 
> [snip]
> 
>>> diff --git a/arch/arm/boot/dts/exynos-syscon-restart.dtsi
>>> b/arch/arm/boot/dts/exynos-syscon-restart.dtsi
>>> new file mode 100644
>>> index 000000000000..09a2040054ed
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/exynos-syscon-restart.dtsi
>>> @@ -0,0 +1,27 @@
>>> +/*
>>> + * Samsung's Exynos SoC syscon reboot/poweroff nodes common definition.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +/ {
>>> +    soc {
>>> +        compatible = "simple-bus";
>>
>> The exynos4 does not have soc node. I wonder whether we should provide
>> here also address and size:
>>                  #address-cells = <1>;
>>                  #size-cells = <1>;
>>         ranges;
>>
>> Without this it works fine but that does not look correct enough.
>>
>> A minor effect of this patch on Exynos4 is that syscon-poweroff/reboot
>> are now the only children of "soc" simple-bus (rest of platform devices
>> is not)... but this is not a problem.
>>
>> Works fine so only the question about cells/ranges remains. Any comments?
>>
> 
> I in fact had the #address-cells and #size-cells at the beginning but then
> realized that both the syscon-poweroff and syscon-reboot nodes didn't have
> a reg property so it felt strange to me to have those.
> 
> Also, I thought that maybe a SoC dtsi may need a different #address-cells
> and #size-cells for the other child nodes so having those in this dtsi
> could override the values in the SoC dtsi depending where is included.
> 
> So I thought it could do more harm than good but I've no strong opinion
> and can add those if you prefer.

No comments from other people so I guess there are no objections.
Applied for late v4.6.

Best regards,
Krzysztof
