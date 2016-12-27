From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos542x: mark some clocks as critical
Date: Tue, 27 Dec 2016 17:24:36 +0900
Message-ID: <58622544.406@samsung.com>
References: <CGME20161222094441epcas5p330bb16763e02149a275c30eb644b0e7c@epcas5p3.samsung.com>
 <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
 <CAGTfZH3CuFNSHwhWzYeU+JE0UyyTqWRA3k2tvCprPcYUMBSYbQ@mail.gmail.com>
 <35dcf8f3-13e2-bc38-64b2-69a42b1f8d9c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <35dcf8f3-13e2-bc38-64b2-69a42b1f8d9c@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, cwchoi00@gmail.com
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Marek,

On 2016년 12월 27일 17:14, Marek Szyprowski wrote:
> Dear Chanwoo,
> 
> 
> On 2016-12-23 18:00, Chanwoo Choi wrote:
>> Dear Marek,
>>
>> I have a question. I agree some clocks should be always on with CLK_IS_CRITICAL.
>> CLK_ACLK333 is only used on exynos5420.dtsi. So, I understand to add
>> CLK_IS_CRITICAL flag to CLK_ACLK333.
>>
>> Except for CLK_ACLK333, the remaining clocks with CLK_IS_CRITICAL were
>> not used on mainline kernel (arch/arm/boot/dts/*). It means that the
>> remaining clocks might be ON before applying this patch. So,
>> CLK_IGNORE_UNUSED might be enough to maintain their ON state.
>>
>> If we don't add the CLK_IGNORE_UNUSED flag to clocks except for
>> CLK_ACLK333, are there any problem?
>> But, if bootloader don't turn on these clocks, this patch is necessary.
> 
> Please note that CLK_IGNORE_UNUSED doesn't protect clock from turning off as
> a result of turn off operation on one of the child-clocks. This patch fixes

Right. It was my mistake that I thought the 'aclk_*' clocks are leaf clock.


> the boot hang caused by changes in SYSMMU driver, which resulted in turning
> off some clocks for G2D domain. Similar issues might happen for other domains
> depending on the probe order. Till now it worked only by a luck, because
> there was child clock enabled early enough, which protected one of those
> clocks from turning off.

This patch makes sense.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Regards,
Chanwoo Choi

[snip]
