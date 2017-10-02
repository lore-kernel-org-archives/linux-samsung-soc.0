From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add support for Hardkernel's
 Odroid HC1 board
Date: Mon, 02 Oct 2017 08:34:04 +0200
Message-ID: <5166bb0e-41f9-a010-70ae-161abb26382d@samsung.com>
References: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929113314eucas1p250037030204ab9d0f936afa6f660923f@eucas1p2.samsung.com>
        <1506684783-9722-3-git-send-email-m.szyprowski@samsung.com>
        <20170930172320.trklynm33x2ra75g@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54331 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbdJBGeK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:34:10 -0400
In-reply-to: <20170930172320.trklynm33x2ra75g@kozik-lap>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

On 2017-09-30 19:23, Krzysztof Kozlowski wrote:
> On Fri, Sep 29, 2017 at 01:33:02PM +0200, Marek Szyprowski wrote:
>> Odroid HC1 board is based on Odroid XU4 board, but it has no HDMI,
>> no eMMC, no build-in USB3.0 hub, no extension port pins, and no GPIO
>> button. USB3.0 ports are used for build-in JMicron USB to SATA bridge
>> and Gigabit R8152 ethernet chips. HC1 uses only passive cooling.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/Makefile                         |   1 +
>>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443 +++++++++++++++++++++
>>   arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 217 ++++++++++
>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 428 +-------------------
> Please experiment with -M (maybe -M20%?) and -B so this would be
> detected as rename. It might create much simpler patch thus making the
> review easy (one could see that the changes are just movements).

I didn't manage to generate different patch with those options. I have
however checked that odroidxu3/xu3-lite/xu4 dtbs are exactly the same after
applying this patch (using dtx_diff tool).

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
