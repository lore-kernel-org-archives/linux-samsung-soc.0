From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add entries for sound support on
 Odroid-XU board
Date: Mon, 05 Sep 2016 13:39:49 +0200
Message-ID: <a094364a-b189-5756-ebaf-5f83099d56a4@samsung.com>
References: <1471883654-2113-1-git-send-email-s.nawrocki@samsung.com>
 <05c45777-732b-3701-36dc-2448003acd50@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29185 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932209AbcIELj6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 07:39:58 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OD100L7Q4EJET50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2016 12:39:55 +0100 (BST)
In-reply-to: <05c45777-732b-3701-36dc-2448003acd50@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/30/2016 08:42 AM, Krzysztof Kozlowski wrote:
> Except the name and assigned clocks, this looks the same as
> exynos5422-odroidxu3-audio.dtsi. How about combining them? The name
> could be the same and the assigned-clocks maybe have to be applied to
> XU3 as well?

I could move assigned-clock* properties to the audi2s0 node but on Odroid 
XU the audio CODEC is on different I2C bus, there is very little in common
left.  XU3 already has its assigned-clocks specified and the are subtle
differences, it took me some time to figure out the right settings for XU,
you need to be careful with them!
Given that Odroid XU uses different SoC and there are differences in the
board layout I wouldn't bother with reusing exynos5422-odroidxu3-audio.dtsi
for XU.

--
Thanks, 
Sylwester
