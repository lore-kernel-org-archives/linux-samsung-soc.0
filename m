From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v5 0/2] irqchip: Move Exynos PM to use stacked domains
Date: Tue, 24 Feb 2015 15:39:56 +0530
Message-ID: <54EC4DF4.1010906@samsung.com>
References: <1424713534-7112-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11654 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345AbbBXKJR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 05:09:17 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NK9007SBTJFHZB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Feb 2015 19:09:15 +0900 (KST)
In-reply-to: <1424713534-7112-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Mark,

On Monday 23 February 2015 11:15 PM, Marc Zyngier wrote:
> This series is extracted from [4], which is trying to remove all
> traces of gic_arch_extn from the tree. As some maintainers are more
> responsive than others (understatement of the year...), I've decided
> to split it per sub-arch, and get it moving, at least partially.
>
> This series addresses Exynos by converting its PM support to a stacked
> domain on top of the standard GIC.
>
> Based on 4.0-rc1.
>
> * From v4: [4]
> - Extracted from the full series
> - Rebased on 4.0-rc1
>
> * From v3 [3]:
> - Rebased on top of the patch working around hardcoded IRQ on OMAP4/5 [4]
> - Fixed more iMX6 DTs (Stephan)
> - Fixed Exynos4/5 DTs
>
> * From v2 [2]:
> - Addressed numerous comments from Thierry
> - Merged bug fixes from Nishanth
> - Merged bug fix from Stefan
>
> * From v1 [1]:
> - Rebased on 3.19-rc3
> - Fixed a number of additional platforms
> - Added crossbar conversion to stacked domains
> - Merged bug fixes from Nishanth
>
> [4]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/317531.html
> [3]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/315385.html
> [2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/314041.html
> [1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/307338.html
>
> Marc Zyngier (2):
>    ARM: exynos4/5: convert pmu wakeup to stacked domains
>    DT: exynos: update PMU binding
>
>   .../devicetree/bindings/arm/samsung/pmu.txt        |  17 +++
>   arch/arm/boot/dts/exynos4.dtsi                     |   4 +
>   arch/arm/boot/dts/exynos5250.dtsi                  |   4 +
>   arch/arm/boot/dts/exynos5420.dtsi                  |   4 +
>   arch/arm/mach-exynos/exynos.c                      |  14 +--
>   arch/arm/mach-exynos/suspend.c                     | 122 +++++++++++++++++++--
>   6 files changed, 146 insertions(+), 19 deletions(-)
>

I tested and verified S2R functionality on Exynos5250 based SMDK5250 
board, and suspend-resume working fine. For testing on SMDK5250 you can 
add my tested-by.

Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>


Thanks,
Pankaj Dubey
