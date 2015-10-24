From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] ARM: dts: Exynos for v4.4 (3rd)
Date: Sat, 24 Oct 2015 20:02:48 +0900
Message-ID: <CAJKOXPcugB_njEkyJJzXOpgs1ACgwwEf=ZnMumDbrx_5GvCHhA@mail.gmail.com>
References: <1444974144-12928-1-git-send-email-k.kozlowski@samsung.com>
	<1444974144-12928-2-git-send-email-k.kozlowski@samsung.com>
	<562A8C0F.8010902@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:36232 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751205AbbJXLCt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Oct 2015 07:02:49 -0400
In-Reply-To: <562A8C0F.8010902@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>

2015-10-24 4:35 GMT+09:00 Kukjin Kim <kgene@kernel.org>:
> On 10/16/15 14:42, Krzysztof Kozlowski wrote:
>> Dear Kukjin,
>>
>> Last batch of changes to DT for Exynos for v4.4.
>> Includes dependency - clock driver changes.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 9aaf43d9b59d6b5d8daeb3a4b9d894ea88fc34c5:
>>
>>   clk: samsung: exynos5250: Add DISP1 clocks (2015-10-16 08:49:53 +0900)
>>
>> are available in the git repository at:
>>
>>   https://github.com/krzk/linux.git tags/samsung-dt-4.4-3
>>
>> for you to fetch changes up to 1967da5699e660957737ec6c4015cfd8e428f0ff:
>>
>>   ARM: dts: Add clocks to DISP1 domain in exynos5250 (2015-10-16 14:20:03 +0900)
>>
>> ----------------------------------------------------------------
>> Last round (from my side) of v4.4 Device Tree improvements for Exynos
>> based boards:
>> 1. Fix USB OTG on Exynos3250 (Monk and Rinato), Exynos4210 (Trats
>>    and Universal) and Exynos4412 (Trats2).
>> 2. Fix HDMI and LVDS display on Snow (Exynos5250) after second Suspend to RAM.
>> 3. Minor cleanups and fixes.
>>
>> ----------------------------------------------------------------
>> Krzysztof Kozlowski (2):
>>       Merge tag 'samsung-clk-exynos5250-4.4' into dt-for-next
>
> Since there is no the branch(tags/samsung-clk-exynos5250-4.4) in clk
> tree, I think we don't need to keep the branch as a topic and we can
> just take the patch with Stephen's ack...
>
>>       dt-bindings: Correct the example for Exynos power domain clocks
>>
>> Laurent Pinchart (2):
>>       ARM: dts: Fix typo in regulator enable GPIO property in s5pv210-aquila
>>       ARM: dts: Fix typo in regulator enable GPIO property in s5pv210-goni
>>
>> Marek Szyprowski (1):
>>       ARM: dts: Add vbus regulator to USB2 phy nodes on exynos3250, exynos4210 and exynos4412 boards
>>
>> Tomeu Vizoso (1):
>>       ARM: dts: Add clocks to DISP1 domain in exynos5250
>>
>>  Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 5 ++---
>>  arch/arm/boot/dts/exynos3250-monk.dts                         | 1 +
>>  arch/arm/boot/dts/exynos3250-rinato.dts                       | 1 +
>>  arch/arm/boot/dts/exynos4210-trats.dts                        | 2 +-
>>  arch/arm/boot/dts/exynos4210-universal_c210.dts               | 2 +-
>>  arch/arm/boot/dts/exynos4412-trats2.dts                       | 1 +
>>  arch/arm/boot/dts/exynos5250.dtsi                             | 4 ++++
>>  arch/arm/boot/dts/s5pv210-aquila.dts                          | 2 +-
>>  arch/arm/boot/dts/s5pv210-goni.dts                            | 4 ++--
>>  9 files changed, 14 insertions(+), 8 deletions(-)
>
> In this case, please show all of diff status including merge branch ;-)

Right, thanks for catching this!

Best regards,
Krzysztof
