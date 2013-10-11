From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2] ARM: EXYNOS: Move arm core power down clock to
 exynos5250 common clock
Date: Fri, 11 Oct 2013 09:33:22 +0200
Message-ID: <4953642.S7P9jyspGP@amdn883>
References: <1381470134-29410-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45238 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753492Ab3JKHd0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 03:33:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUH009Z4UBI2L00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Oct 2013 08:33:24 +0100 (BST)
In-reply-to: <1381470134-29410-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, Abhilash Kesavan <a.kesavan@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Amit,

On Friday 11 of October 2013 11:12:14 Amit Daniel Kachhap wrote:
> Now with common clock support added for exynos5250 it is necessary to move
> this code to exynos5250 common clock driver as clock registers should be
> handled there. This change is tested in exynos5250 based arndale platform.
> 
> Cc: Abhilash Kesavan <a.kesavan@samsung.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Acked-by: Kukjin Kim <kgene.kim@samsugn.com>

nit: Typo in samsung. Probably something that Kukjin can fix up when
applying, though.

> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
> 
> Changes in V2:
> * Rebased against linux-next tree.
> * Removed un-used macros in regs-clock.h
> 
>  arch/arm/mach-exynos/cpuidle.c                 |   35 --------------------
>  arch/arm/mach-exynos/include/mach/regs-clock.h |   16 ---------
>  drivers/clk/samsung/clk-exynos5250.c           |   42 ++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 51 deletions(-)

Otherwise

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
