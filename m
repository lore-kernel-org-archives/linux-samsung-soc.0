From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] arm: dts: exynos: add exynos5422 cpu
 capacity-dmips-mhz information
Date: Sun, 17 Sep 2017 09:37:43 +0200
Message-ID: <20170917073743.GD19716@kozik-book>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
 <20170830144120.9312-4-dietmar.eggemann@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:47874 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750803AbdIQHhr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 03:37:47 -0400
Content-Disposition: inline
In-Reply-To: <20170830144120.9312-4-dietmar.eggemann@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@arm.com>

On Wed, Aug 30, 2017 at 03:41:19PM +0100, Dietmar Eggemann wrote:
> The following 'capacity-dmips-mhz' dt property values are used:
> 
> Cortex-A15: 1024, Cortex-A7: 539
> 
> They have been derived form the cpu_efficiency values:
> 
> Cortex-A15: 3891, Cortex-A7: 2048
> 
> by scaling them so that the Cortex-A15s (big cores) use 1024.
> 
> The cpu_efficiency values were originally derived from the "Big.LITTLE
> Processing with ARM Cortex™-A15 & Cortex-A7" white paper
> (http://www.cl.cam.ac.uk/~rdm34/big.LITTLE.pdf). Table 1 lists 1.9x
> (3891/2048) as the Cortex-A15 vs Cortex-A7 performance ratio for the
> Dhrystone benchmark.
> 
> The following platforms are affected once cpu-invariant accounting
> support is re-connected to the task scheduler:
> 
> odroidxu3, odroidxu3-lite, odroidxu4
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> ---
>  arch/arm/boot/dts/exynos5422-cpus.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
