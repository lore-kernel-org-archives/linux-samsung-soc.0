From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: exynos: Lower SD card interface voltage
 to 2.8 V on Odroid X/X2/U3
Date: Wed, 04 May 2016 15:06:45 +0200
Message-ID: <5729F3E5.4010702@samsung.com>
References: <1462365840-27406-1-git-send-email-k.kozlowski@samsung.com>
 <1462365840-27406-3-git-send-email-k.kozlowski@samsung.com>
 <764fb4d7-873f-0e59-446b-e9652151512d@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38414 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753140AbcEDNGu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 May 2016 09:06:50 -0400
In-reply-to: <764fb4d7-873f-0e59-446b-e9652151512d@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 05/04/2016 02:51 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/04/2016 08:44 AM, Krzysztof Kozlowski wrote:
>> Odroid X/X2/U3 schematics say that SD card vmmc regulator
>> (LDO21/TFLASH) operates on 2.8 V. Mainline U-Boot uses that value as
>> well and 2.8 V is common on Exynos-based boards. Additionally use some
>> descriptive name for this regulator.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> ---
>> Changes since v2:
>> 1. Add Javier's tag.
>>
> 
> It's missing though :)
> 
> Adding the tag again so it can be picked by patchwork:
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

D'oh!

Thanks for spotting,
Krzysztof
