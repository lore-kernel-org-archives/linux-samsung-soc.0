From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/5] arm64: dts: exynos: Fix FSYS CMU parent clocks in
 Exynos 5433 SoC
Date: Thu, 17 Nov 2016 07:51:37 +0100
Message-ID: <cd8ea73c-3852-2cd8-586e-64ba99c2888b@samsung.com>
References: <CGME20161116130707eucas1p20f49e19c746905f858ca7c7b1e7c0e37@eucas1p2.samsung.com>
 <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <1479301615-11240-2-git-send-email-m.szyprowski@samsung.com>
 <CAGTfZH0FknLzB+dPvMGxVj3WuXba1BLix5gb5i8xMe+mk9jZVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38754 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938698AbcKQGvn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 01:51:43 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGR00GI8XQ4A940@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 06:51:40 +0000 (GMT)
In-reply-to: <CAGTfZH0FknLzB+dPvMGxVj3WuXba1BLix5gb5i8xMe+mk9jZVQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cwchoi00@gmail.com
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Chanwoo,


On 2016-11-16 17:31, Chanwoo Choi wrote:
> Hi Marek,
>
> 2016-11-16 22:06 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>> This patch corrects FSYS CMU parent clocks specified in clock controller
>> node to let improved Exynos 5433 clocks driver to control proper clocks
>> on FSYS<->TOP CMU boundary.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> index 1188630..6564875 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> @@ -312,7 +312,7 @@
>>
>>                          clock-names = "oscclk",
>>                                  "sclk_ufs_mphy",
>> -                               "div_aclk_fsys_200",
>> +                               "aclk_fsys_200",
> FSYS cmu doesn't use the "aclk_fsys_200" clock as parent clock.
>
> When I check the clk-exynos5433.c driver, CLK_MOUT_ACLK_FSYS_200_USER
> mux in the FSYS cmu
> uses the "div_aclk_fsys_200" clock as parent clock instead of "aclk_fsys_200".

Then this is a bug in clk-exynos5433.c driver. aclk_fsys_200 is the correct
parent for CLK_MOUT_ACLK_FSYS_200_USER mux. See page 582 and 814
(CLK_MUX_SEL_FSYS0 register description) of Exynos 5433 User Manual (rev 
0.10).
Also my experiments revealed that aclk_fsys_200 gate register
(CLK_ACLK_FSYS_200 clk) has to be enabled to do any operation on devices in
FSYS block, so this is definitely the clock that is a parent of the whole
block.

I will prepare a fix for clk-exynos5433.c driver and dt bindings docs too.

>
>>                                  "sclk_pcie_100_fsys",
>>                                  "sclk_ufsunipro_fsys",
>>                                  "sclk_mmc2_fsys",
>> @@ -322,7 +322,7 @@
>>                                  "sclk_usbdrd30_fsys";
>>                          clocks = <&xxti>,
>>                                  <&cmu_cpif CLK_SCLK_UFS_MPHY>,
>> -                               <&cmu_top CLK_DIV_ACLK_FSYS_200>,
>> +                               <&cmu_top CLK_ACLK_FSYS_200>,
>>                                  <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
>>                                  <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
>>                                  <&cmu_top CLK_SCLK_MMC2_FSYS>,
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Best Regards,
> Chanwoo Choi
>
>
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
