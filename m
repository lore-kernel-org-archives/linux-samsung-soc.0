From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 13:59:25 +0530
Message-ID: <5631D8E5.6090506@samsung.com>
References: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
 <56317960.9070608@samsung.com>
 <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
 <006c01d11218$d6e2d500$84a87f00$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37900 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751190AbbJ2I3A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 04:29:00 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWZ031VA3K97BC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 17:28:57 +0900 (KST)
In-reply-to: <006c01d11218$d6e2d500$84a87f00$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>

Hi Pavel,

On Thursday 29 October 2015 12:40 PM, Pavel Fedin wrote:
>   Hello!
>
>> Patch looks ok, but after Alim's patch series [1] to handle poweroff
>> and reboot via generic syscon based driver gets merged, this will
>> become redundant entry into PMU driver in the absence of any PMU  data
>> for Exynos5410. Alim has taken care of adding power-off and reboot
>> device node in exynos5410.dtsi [2].
>>
>> [1]: http://www.spinics.net/lists/devicetree/msg98858.html
>> [2]: http://www.spinics.net/lists/devicetree/msg98862.html
>
>   I looked at those patches, IMHO they are too large for doing too small thing. What they do is basically describing two registers one-by-one and adding a separate per-register driver. Isn't it too much just for pushing a reset pin?
>   May be we should just invent some generic "compatible" string, like "samsung,exynos-pmu" (or "Samsung,exynos-pmu-generic", if you want to be more specific), which would do the same as my patch currently does? This would be only several lines of code, achieving the same result.
>

These patches are not adding any new code, except DT entry. Infact 
restart handler will be removed from PMU driver and we will be using 
generic syscon based implementation for reboot, which is already present 
in Linux kernel. Thus effectively reducing LoC. Only we need to add 
device node entries in respective DT files, and this is being done for 
all Exynos SoCs including exynos5410.

Thanks,
Pankaj Dubey
> Kind regards,
> Pavel Fedin
> Expert Engineer
> Samsung Electronics Research center Russia
>
>
>
