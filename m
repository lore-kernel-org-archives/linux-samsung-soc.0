From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add entries for sound support on
 Odroid-XU board
Date: Tue, 06 Sep 2016 13:30:12 +0200
Message-ID: <bc8544f0-6a28-532f-cfdb-7ca28270b662@samsung.com>
References: <1471883654-2113-1-git-send-email-s.nawrocki@samsung.com>
 <05c45777-732b-3701-36dc-2448003acd50@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28970 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934617AbcIFLaV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 07:30:21 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OD200MWTYMIX520@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Sep 2016 12:30:18 +0100 (BST)
In-reply-to: <05c45777-732b-3701-36dc-2448003acd50@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/30/2016 08:42 AM, Krzysztof Kozlowski wrote:
>> +&clock {
>> > +       clocks = <&fin_pll>;
> I dig into it and I have some questions:
> 1. Missing clock-names?
> 2. What code parses it?
> 3. Don't we need it also for other SoC/boards?

Apologies, I missed this one.

Ad.1. clock-names is not needed as there will be only one clock and there
is no need to get the clock by name.  If it bothers you we could add e.g.
clock-names = "osc", but IMO it's just an unnecessary complication.

Ad.2 of_clk_get() called from within of_clk_init() and exynos5410_clk_init.

Ad.2. I think it makes sense to add it for all Exynos SoCs where it's missing.

-- 
Regards,
Sylwester
