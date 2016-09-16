From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add entries for sound support on
 Odroid-XU board
Date: Fri, 16 Sep 2016 13:58:32 +0200
Message-ID: <71286ef8-4b7f-cfde-7bb9-9f3bd2289527@samsung.com>
References: <CGME20160916112217eucas1p1694395dda2a1e8cdf562007ed8141542@eucas1p1.samsung.com>
 <1474024920-32744-1-git-send-email-s.nawrocki@samsung.com>
 <f4d204d8-b6b8-5173-c530-bfea1ec9ed7d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51134 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755563AbcIPL6j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 07:58:39 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODL00HE1ILOLF50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2016 12:58:36 +0100 (BST)
In-reply-to: <f4d204d8-b6b8-5173-c530-bfea1ec9ed7d@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene@kernel.org, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org

On 09/16/2016 01:25 PM, Sylwester Nawrocki wrote:
> On 09/16/2016 01:22 PM, Sylwester Nawrocki wrote:
>> This patch adds device nodes for the AUDSS clock controller,
>> peripheral DMA 0/1 controllers and the Audio Subsystem I2S controller.
>> These entries are required for sound support on Odroid-XU board.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>> This patch depends on a patch adding clock ID macro definitions.
>> I'm going to provide a topic branch containing required changes.
>>
>> Changes since v1:
>>  - GIC_SPI, IRQ_TYPE_NONE used in the PDMA and max98080 interrupt
>>    specifiers,
>>  - assigned-clock-* properties moved to respective controller
>>    nodes.
> 
> And here is a pull request containing clk dependency patches:
> 
> The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:
> 
>   Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.9-exynos54x0-dt
> 
> for you to fetch changes up to 58d6506f327e3d192998ba03632f546da221b8d8:
> 
>   clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks (2016-09-09
> 10:13:02 +0200)
> 

Pulled and applied, thanks!

Krzysztof
