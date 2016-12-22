From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [v3] arm: dts: exynos: Enable DMA support for UART modules on
 Exynos5 SoCs
Date: Thu, 22 Dec 2016 12:18:52 +0100
Message-ID: <2b04debd-c221-aa26-797f-f9a7557d3043@samsung.com>
References: <1482141648-21294-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161222111557epcas4p3dd75d80c6a61b35c9477d5bd9bad75e3@epcas4p3.samsung.com>
 <585BB579.9040403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41636 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756055AbcLVLTN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Dec 2016 06:19:13 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIL008ZF3FJWQ00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Dec 2016 11:18:55 +0000 (GMT)
In-reply-to: <585BB579.9040403@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Alim,

On 2016-12-22 12:14, Alim Akhtar wrote:
> Hello,
>
> On 12/19/2016 03:30 PM, Marek Szyprowski wrote:
>> UART modules can use DMA for offloading data transfers and reducing
>> interrupts, so enable this feature for Exynos5 boards. Tested on
>> Google ChromeBook Snow (Exynos5250), Odroid XU (Exynos5410) and Odroid
>> XU3 (Exynos5422) boards.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> v3:
>> - added Exynos5410
>
> make failed with this patch with below error:
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dtb
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma0"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma0"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma1"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma1"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma0"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma0"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma1"
>
> ERROR (phandle_references): Reference to non-existent node or label 
> "pdma1"
>
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[1]: *** [arch/arm/boot/dts/exynos5410-odroidxu.dtb] Error 2
> make: *** [dtbs] Error 2
> -------------------------------------
>
> I tried building against linux-next with tag v4.9.
>
> 69973b8 Linux 4.9
> 2e4333c Merge branch 'upstream' of 
> git://git.linux-mips.org/pub/scm/ralf/upstream-linus
> ba73515 MIPS: Lantiq: Fix mask of GPE frequency
>
> Let me know if I am missing other patches.

Please apply it on top of for-next branch from 
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git

 > [...]

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
