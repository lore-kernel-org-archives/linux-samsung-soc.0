From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: EXYNOS: Remove static mapping of SCU SFR
Date: Wed, 9 Nov 2016 22:03:51 +0200
Message-ID: <20161109200351.GA23534@kozik-lap>
References: <1478693755-11953-1-git-send-email-pankaj.dubey@samsung.com>
 <1478693755-11953-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35458 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751618AbcKIUD5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 15:03:57 -0500
Received: by mail-wm0-f66.google.com with SMTP id a20so20667002wme.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2016 12:03:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1478693755-11953-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

On Wed, Nov 09, 2016 at 05:45:54PM +0530, Pankaj Dubey wrote:
> Lets remove static mapping of SCU SFR mainly used in CORTEX-A9 SoC based
> boards. Instead use mapping from device tree node of SCU.
> 
> NOTE: This patch has dependency on DT file of any such CORTEX-A9 SoC
> based boards, in the absence of SCU device node in DTS file, only single
> CPU will boot. So if you are using OUT-OF-TREE DTS file of CORTEX-A9 based
> Exynos SoC make sure to add SCU device node to DTS file for SMP boot.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h                |  1 +
>  arch/arm/mach-exynos/exynos.c                | 22 ------------------
>  arch/arm/mach-exynos/include/mach/map.h      |  2 --
>  arch/arm/mach-exynos/platsmp.c               | 34 +++++++++++++++++++++-------
>  arch/arm/mach-exynos/pm.c                    |  4 +---
>  arch/arm/mach-exynos/suspend.c               |  4 +---
>  arch/arm/plat-samsung/include/plat/map-s5p.h |  4 ----
>  7 files changed, 29 insertions(+), 42 deletions(-)
>

Applied on a next/soc branch after merging next/dt to preserve
bisectability.

Best regards,
Krzysztof
