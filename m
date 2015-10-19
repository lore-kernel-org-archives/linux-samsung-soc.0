From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/7] Switch to generic syscon regmap based drivers
Date: Mon, 19 Oct 2015 15:54:55 +0900
Message-ID: <562493BF.9080301@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:25479 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbbJSGzG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 02:55:06 -0400
In-reply-to: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 19.10.2015 15:03, Alim Akhtar wrote:
...

Hi,

I am happy to see more contributions from your side! Keep it up. :)

However this empty space in your cover letter is the place for
description of the patchset. What do you want to achieve here? What kind
of problem are you solving? What features are you adding? Any dependencies?

Best regards,
Krzysztof

> Alim Akhtar (7):
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos3250 SoCs
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos4
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5410 SoC
>   ARM: exynos_defconfig: Normalize exynos defconfig
>   ARM: exynos_defconfig: Enable generic syscon-{reboot, poweroff}
>     drivers
>   ARM: EXYNOS: Remove code for restart and poweroff for exynos SoCs
> 
>  arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++
>  arch/arm/boot/dts/exynos4.dtsi    |   14 ++++++++++++
>  arch/arm/boot/dts/exynos5.dtsi    |   14 ++++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++
>  arch/arm/configs/exynos_defconfig |   11 +++++-----
>  arch/arm/mach-exynos/pmu.c        |   43 -------------------------------------
>  6 files changed, 61 insertions(+), 49 deletions(-)
> 
