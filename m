From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] DW-MSHC support on Exynos4412-TRATS2 board
Date: Sat, 21 Dec 2013 07:16:14 +0900
Message-ID: <52B4C1AE.4000506@samsung.com>
References: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:59176 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175Ab3LTWQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 17:16:20 -0500
Received: by mail-pb0-f48.google.com with SMTP id md12so3152585pbc.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 14:16:19 -0800 (PST)
In-Reply-To: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>

On 12/13/13 01:18, Tomasz Figa wrote:
> This series fixes spotted issues with DW-MSHC support on Exynos4x12
> SoCs and then enables DW-MSHC controller to handle eMMC memory on
> Exynos4412-TRATS2 board. As opposed to using sdhci-s3c for eMMC,
> MMC 4.4 extensions can be used and in general performance is improved.
>
> Tested on Exynos4412-TRATS2 board.
>
> Tomasz Figa (3):
>    clk: samsung: exynos4: Fix definition of div_mmc_pre4 divider
>    ARM: dts: exynos4x12: Fix definition of MSHC device tree nodes
>    ARM: dts: exynos4412-trats2: Use MSHC controller for eMMC memory
>
>   arch/arm/boot/dts/exynos4412-odroidx.dts |  5 +----
>   arch/arm/boot/dts/exynos4412-origen.dts  |  5 +----
>   arch/arm/boot/dts/exynos4412-trats2.dts  | 20 ++++++++++++++++----
>   arch/arm/boot/dts/exynos4412.dtsi        |  8 --------
>   arch/arm/boot/dts/exynos4x12.dtsi        | 13 +++++++++++++
>   drivers/clk/samsung/clk-exynos4.c        |  3 ++-
>   6 files changed, 33 insertions(+), 21 deletions(-)
>
Looks good to me, applied.

Thanks,
Kukjin
