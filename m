From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos: Add MSCL power domain to
 Exynos 5433 SoC
Date: Fri, 01 Dec 2017 10:18:21 +0900
Message-ID: <5A20ADDD.8020203@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112650eucas1p13a3cc167bc64d133cf24e4f621865203@eucas1p1.samsung.com>
        <20171129112638.15813-4-m.szyprowski@samsung.com>
        <5A1F6AF3.5050809@samsung.com> <5A1F7219.5080506@samsung.com>
        <dc21a17f-c281-cb71-8d06-5a15f8d9a04e@samsung.com>
        <8c9ccbc5-21ee-3df7-ac7f-2a4506e6fa43@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62012 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbdLABSi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 20:18:38 -0500
In-reply-to: <8c9ccbc5-21ee-3df7-ac7f-2a4506e6fa43@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear Marek,

On 2017년 11월 30일 21:21, Marek Szyprowski wrote:
> Dear Chanwoo,
> 
> On 2017-11-30 10:35, Marek Szyprowski wrote:
>> On 2017-11-30 03:51, Chanwoo Choi wrote:
>>> On 2017년 11월 30일 11:20, Chanwoo Choi wrote:
>>>> On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
>>>>> This patch adds support for MSCL power domain to Exynos 5433 SoCs, which
>>>>> contains following devices: a clock controller, JPEG codec device and its
>>>>> SYSMMU.
>>>>>
>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 10 ++++++++++
>>>>>   1 file changed, 10 insertions(+)
>>>> Looks good to me.
>>>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>
>>>> [snip]
>>>>
>>> When I tested this patch with enabling exynos-bus.c,
>>> I got the following external abort. In order to fix this abort,
>>> I add the power-domain property to arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
>>> as following:
>>
>> Thanks for this report. You are right that exynos-bus devices should be
>> also added to respective power domains. I will also check how to add
>> runtime PM support and awareness of power domain to exynos-bus driver,
>> to avoid blocking respective power domains in turned on state.
> 
> I've investigated it further and it turned out to be a missing case in
> my runtime PM patch for clocks core.
> 
> In this case exynos-bus operates on a clock, which is in the
> TOP CMU and TOP power domain (always on), which has no relation with
> the newly added MSCL power domain. We should not mix this by forcing
> exynos-bus to be in the MSCL domain.
> 
> The reported external abort is solved by proper patch for clock core:
> https://patchwork.kernel.org/patch/10084725/
> 
> This patch (and the other patches from this patch series) can be applied
> without any changes.

I tested it with your clk patch. It is well working. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
