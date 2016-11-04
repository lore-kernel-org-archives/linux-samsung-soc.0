From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/4] Add SCU device node support for Exynos4
Date: Fri, 04 Nov 2016 08:33:34 +0100
Message-ID: <b6a27e2f-a8d7-0ada-240b-923d95824b92@samsung.com>
References: <CGME20161104033644epcas1p46d49c63576294d645c7fc131374bb49b@epcas1p4.samsung.com>
 <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57890 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753956AbcKDHdl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 03:33:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG300D8BX01E070@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2016 07:33:37 +0000 (GMT)
In-reply-to: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Pankaj,

On 2016-11-04 04:39, Pankaj Dubey wrote:
> This patch series does some cleanup for Exynos4 SoC based boards.
> We are currently statically mapping SCU SFRs in mach-exynos/exynos.c
> which can be avoided and related dependencies can be removed by introduction
> of SCU device node.
>    
> This patch series is tested on Exynos4210 based Origen board for SMP boot.
>
> Pankaj Dubey (4):
>    ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
>    ARM: dts: exynos: Add SCU device node to exynos4.dtsi
>    ARM: EXYNOS: Remove static mapping of SCU SFR
>    ARM: EXYNOS: Remove unused soc_is_exynos{4,5}
>
>   arch/arm/boot/dts/exynos4.dtsi               |  5 +++
>   arch/arm/mach-exynos/common.h                |  5 ---
>   arch/arm/mach-exynos/exynos.c                | 22 -------------
>   arch/arm/mach-exynos/include/mach/map.h      |  2 --
>   arch/arm/mach-exynos/platsmp.c               | 49 +++++++---------------------
>   arch/arm/mach-exynos/pm.c                    | 14 ++++++--
>   arch/arm/mach-exynos/suspend.c               | 15 ++++++---
>   arch/arm/plat-samsung/include/plat/map-s5p.h |  4 ---
>   8 files changed, 38 insertions(+), 78 deletions(-)

Nice cleanup! Works fine on Exynos4412-based Odroid U3 (SMP boot and S2R).

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
