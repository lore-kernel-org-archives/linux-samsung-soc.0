From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3] ARM: dts: add CPU nodes for Exynos4 SoCs
Date: Thu, 25 Sep 2014 14:56:33 +0900
Message-ID: <018e01cfd885$770dd940$65298bc0$@kernel.org>
References: <5230569.XLlNbB5NvF@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46429 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbaIYF4m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 01:56:42 -0400
In-reply-to: <5230569.XLlNbB5NvF@amdc1032>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Lorenzo Pieralisi' <lorenzo.pieralisi@arm.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Thomas Abraham' <ta.omasab@gmail.com>

Bartlomiej Zolnierkiewicz wrote:
> 
> Recent patch by Tomasz Figa ("irqchip: gic: Fix core ID calculation
> when topology is read from DT") fixed GIC driver to filter cluster ID
> from values returned by cpu_logical_map() for SoCs having registers
> mapped without per-CPU banking making it is possible to add CPU nodes
> for Exynos4 SoCs.  In case of Exynos SoCs these CPU nodes are also
> required by future changes adding initialization of cpuidle states in
> Exynos cpuidle driver through DT.
> 
> Tested on Origen board (Exynos4210 SoC) and Trats2 (Exynos4412 SoC).
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
> Based on for-next branch of linux-samsung.git tree.
> 
> v3:
> - refreshed on top of Kukjin's tree
> 
> v2:
> - match the unit-address with the reg
> 
>  arch/arm/boot/dts/exynos4210.dtsi |   17 +++++++++++++++++
>  arch/arm/boot/dts/exynos4212.dtsi |   17 +++++++++++++++++
>  arch/arm/boot/dts/exynos4412.dtsi |   29 +++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+)

Thanks for re-spin and looks good to me.

Applied.

Thanks,
Kukjin
