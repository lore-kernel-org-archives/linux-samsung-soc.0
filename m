From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/4] Fixes for DT CPU topology specification on Exynos
Date: Thu, 08 May 2014 17:24:56 +0200
Message-ID: <536BA1C8.8050806@samsung.com>
References: <1397832181-5153-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32018 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945AbaEHPZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 11:25:01 -0400
In-reply-to: <1397832181-5153-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi,

On 18.04.2014 16:42, Tomasz Figa wrote:
> Due to some parts of Exynos SoC support designed originally in a non-scalable
> way, relying on 1:1 mapping between value returned by cpu_logical_map() and
> CPU IDs as seen by PMU and GIC, trying to specify CPU topology in device tree
> caused various boot-up issues on Exynos SoCs, ranging from CPUs other than 0
> failing to boot to crashes due to GIC driver accessing registers out of range.
> 
> This series attempts to fix aforementioned issues by removing incorrect
> assumptions from Exynos SoC core code and GIC driver and then adding CPU
> topology data to device tree sources of Exynos4.
> 
> [On Exynos4210-based TRATS and Exynos4412-based TRATS2 board]
> Tested-by: Tomasz Figa <t.figa@samsung.com>
> 
> Tomasz Figa (4):
>   ARM: EXYNOS: Fix definitions of S5P_ARM_CORE_* registers
>   ARM: EXYNOS: Fix core ID used by platsmp and hotplug code
>   irqchip: gic: Add support for per CPU bank offset specification in DT
>   ARM: dts: exynos4: Add CPU topology data
> 
>  Documentation/devicetree/bindings/arm/cpus.txt |  7 ++
>  Documentation/devicetree/bindings/arm/gic.txt  | 34 +++++++++-
>  arch/arm/boot/dts/exynos4210.dtsi              | 19 ++++++
>  arch/arm/boot/dts/exynos4212.dtsi              | 19 ++++++
>  arch/arm/boot/dts/exynos4412.dtsi              | 37 ++++++++--
>  arch/arm/mach-exynos/hotplug.c                 | 10 +--
>  arch/arm/mach-exynos/platsmp.c                 | 31 +++++----
>  arch/arm/mach-exynos/regs-pmu.h                |  4 +-
>  drivers/irqchip/irq-gic.c                      | 94 ++++++++++++++++++--------
>  9 files changed, 202 insertions(+), 53 deletions(-)
> 

Any comments for this series? I'm especially interested in hearing some
opinions about patch 3/4, which extends DT bindings of ARM GIC.

Best regards,
Tomasz
