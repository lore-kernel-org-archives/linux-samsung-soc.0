From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: Add SROMc to Exynos 5410
Date: Wed, 28 Oct 2015 15:00:38 +0530
Message-ID: <563095BE.9050106@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
 <91ae80f172192fa4dbc8bf8ee5a9068661592de6.1445935215.git.p.fedin@samsung.com>
 <56302F1F.5090206@samsung.com> <009001d1114f$3c7a1f60$b56e5e20$@samsung.com>
 <56307824.1050302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53716 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbbJ1Jd0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 05:33:26 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWX01KDEBVOFP60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 18:33:24 +0900 (KST)
In-reply-to: <56307824.1050302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>

Hi

On Wednesday 28 October 2015 12:54 PM, Krzysztof Kozlowski wrote:
> On 28.10.2015 16:06, Pavel Fedin wrote:
>>   Hello!
>>
>>>> +		sromc: sromc@12250000 {
>>>> +			compatible = "samsung,exynos-srom";
>>>> +			reg = <0x12250000 0x10>;
>>>
>>> Isn't 0x10 too small (SROM_BC3 won't be mapped)?
>>
>>   Muhaha, indeed, thanks for noticing this.
>>   By the way, i've just checked exynos4.dtsi and exynos5.dtsi, they specify the same size. Did reviewers overlook this small thing?
>
> Yep, I pointed that 0x100 (from first version of patchset) is too big...
> but did not exactly check the length of new value.
>

Yes, once you pointed out I checked UM for Exynos4415, Exynos5250, 
Exynos5420 and Exynos5410 and all these manuals talks about SROM_BC{0-3} 
only. There is no offset such as SROM_BC{4,5} at least in these SoC 
manuals. Accordingly I modified size from 0x100 to 0x10. But looks like 
I missed to remove SROM_BC{{4,5} from exynos-srom.h. I checked only 
these registers are used in the driver, so as such it should not cause 
any issue in driver as of now, only we have some redundant entry in 
exynos-srom.h which can be removed if it's not applicable for any of 
Exynos SoC, after confirmation from Kukjin.


>> Shouldn't it be fixed then?
>
> Yes. It hasn't been pulled yet by arm-soc... Let's wait Kukjin's opinion
> how to deal with exynos[45].dtsi.
>

> Best regards,
> Krzysztof
>

Thanks,
Pankaj Dubey
