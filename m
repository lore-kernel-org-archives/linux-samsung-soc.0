From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/5] arm64: dts: exynos: Add dts files for Samsung
 Exynos5433 64bit SoC
Date: Thu, 3 Nov 2016 21:47:16 +0200
Message-ID: <20161103194716.GC12945@kozik-lap>
References: <1478155149-28527-1-git-send-email-cw00.choi@samsung.com>
 <1478155149-28527-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34486 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752932AbcKCTrY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 15:47:24 -0400
Content-Disposition: inline
In-Reply-To: <1478155149-28527-4-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, andi.shyti@samsung.com, chanwoo@kernel.org

On Thu, Nov 03, 2016 at 03:39:07PM +0900, Chanwoo Choi wrote:
> This patch adds new Exynos5433 dtsi to support 64-bit Exynos5433 SoC based on
> Octa-core CPUs (quad Cortex-A57 and quad Cortex-A53). And Exynos5433 supports
> PSCI (Power State Coordination Interface) v0.1.
> 
> This patch includes following Device Tree node to support Exynos5433 SoC:
> 1. Octa cores for big.LITTLE architecture
> - Cortex-A53 LITTLE Quad-core
> - Cortex-A57 big Quad-core
> - Support PSCI v0.1
> 

Patch looks good to me. The GIC interrupt flags will have to be fixed
someday (e.f. https://patchwork.kernel.org/patch/9336553/) but this may
wait... It is violating the GIC since ancient times so I guess we can
violate it some more till someone will be annoyed enough to fix it. :)

BR,
Krzysztof
