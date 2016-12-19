From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] arm: dts: exynos: Enable DMA support for UART modules
 on Exynos5 SoCs
Date: Mon, 19 Dec 2016 07:37:39 +0100
Message-ID: <da1ecfbc-d4f4-57f1-fd22-ab09a63233f8@samsung.com>
References: <1481891254-7992-1-git-send-email-m.szyprowski@samsung.com>
 <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161216165113epcas5p19adefff709f4fc3df43e63feae911141@epcas5p1.samsung.com>
 <20161216165059.GA3428@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62488 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbcLSGhp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 01:37:45 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIF00DAS6EUV350@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Dec 2016 06:37:42 +0000 (GMT)
In-reply-to: <20161216165059.GA3428@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,


On 2016-12-16 17:50, Krzysztof Kozlowski wrote:
> On Fri, Dec 16, 2016 at 01:39:00PM +0100, Marek Szyprowski wrote:
>> UART modules can use DMA for offloading data transfers and reducing
>> interrupts, so enable this feature for Exynos5 boards. Tested on
>> Google ChromeBook Snow (Exynos5250) and Odroid XU3 (Exynos5422) boards.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> v2:
>> - added Exynos5250
>> - fixed copy/paste typo for serial 2 and 3
>> ---
>>   arch/arm/boot/dts/exynos5250.dtsi | 8 ++++++++
>>   arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
>>   2 files changed, 16 insertions(+)
>>
> On Exynos4412 enabling DMA for serial exposed some interesting bugs so I
> assume here the fun will start after applying? :)

Enabling DMA on Exynos4412 already exposed bugs, which finally were fixed
and now it works really fine there. I don't expect any issues after enabling
it on Exynos5250/5422.

> Looks good, what about Exynos5410?

Exynos5410 will be handled separately, because it needs more patches - 
PL3310
DMA controllers are not yet defined nor clocks for them.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
