From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 1/5] ARM: dts: exynos: Artik5 topic branch for v4.7
Date: Mon, 25 Apr 2016 11:01:25 +0200
Message-ID: <571DDCE5.5020201@samsung.com>
References: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com>
 <1460541682-32417-2-git-send-email-k.kozlowski@samsung.com>
 <7068458.f0qaFCRyGK@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53439 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483AbcDYJBb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 05:01:31 -0400
In-reply-to: <7068458.f0qaFCRyGK@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org

On 04/24/2016 11:15 PM, Arnd Bergmann wrote:
> On Wednesday 13 April 2016 12:01:18 Krzysztof Kozlowski wrote:
>> Topic branch for Device Tree changes for Exynos 3250 for v4.7:
>>
>> Merge necessary new clocks from Sylwester (used by new board) and add support
>> for Exynos3250-based Artik5 board.
>>
> 
> Merged into next/dt, thanks!
> 
> I see that you have modified the include/dt-bindings/clock/exynos3250.h
> file. Two questions about that:
> 
> - How is this going to get synchronized with the respective driver changes
>   in a way that avoids breaking the build of the clk tree? Do you just
>   wait another merge window for that?

Mentioned include/dt-bindings change comes from clk tree, merged here
(see "Merge tag 'clk-v4.7-exynos3250' of
git://linuxtv.org/snawrocki/samsung into
for-v4.7/dt-exynos3250-artik5"). I assume that any driver related
changes in clk tree would be on top of that commit.

> 
> - Are there any other clocks that you should define now so you don't run
>   into dependency problems later?

Indeed we might have similar for Exynos5422 and devfreq but I already
talked with Sylwester about it. He pushed such changes to clk folks and
prepared a tag for me - just in case:
https://lkml.org/lkml/2016/4/15/561

Best regards,
Krzysztof
