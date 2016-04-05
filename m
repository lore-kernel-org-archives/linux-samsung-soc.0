From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH v2] ARM: dts: exynos-5422-odroid: Add eMMC and SD
 regulator supplies
Date: Tue, 5 Apr 2016 09:28:00 +0200
Message-ID: <57036900.1030506@fivetechno.de>
References: <57023A01.4070403@fivetechno.de> <57033753.5020906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:49732 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751785AbcDEH2J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2016 03:28:09 -0400
In-Reply-To: <57033753.5020906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Krzysztof,

Am 05.04.2016 um 05:56 schrieb Krzysztof Kozlowski:
> On 04.04.2016 18:55, Markus Reichl wrote:
>> Add vmmc and vqmmc supplies from MF circuit sheets for eMMC and SD on
>> odroid XU3 and XU4 to avoid warnings in dmesg output and remove their
>> always_on properties.
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>> Changes in V2:
>>     Sqashed two patches in one.
>>
>> Tested with eMMC only on XU4.
>> SD still needs testing.
> 
> I tested the SD card, everything looks fine. Applied with adjusted
> commit message (the warnings I asked for should be mentioned). Thanks.
> 

Thanks,
--
Markus Reichl

> Best regards,
> Krzysztof
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
