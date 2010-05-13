From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2] ARM: S5PC100: Pre-requisite clock patch for
 plat-s5pc1xx to plat-s5p move.
Date: Thu, 13 May 2010 16:07:21 +0200
Message-ID: <007a01caf2a5$a049fed0$e0ddfc70$%szyprowski@samsung.com>
References: <1273750504-2094-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36199 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753836Ab0EMOIJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 May 2010 10:08:09 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2D00B7T39IFR@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 May 2010 23:08:06 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2D00FRB395NA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 May 2010 23:08:06 +0900 (KST)
In-reply-to: <1273750504-2094-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.ab@samsung.com>, ben-linux@fluff.org, kyungmin.park@samsung.com

Hello,

On Thursday, May 13, 2010 1:35 PM Kukjin Kim wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> This is a pre-requisite clock patch for the plat-s5pc1xx to plat-s5p
> movement. The patches that perform the movement of the code from
> plat-s5pc1xx to plat-s5p (and mach-s5pc100) should also enable the
> build for the mach-s5pc100/clock.c code.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pc100/clock.c                   | 1362
> +++++++++++++++++++++++
>  arch/arm/mach-s5pc100/include/mach/regs-clock.h |   71 ++
>  arch/arm/plat-s5p/clock.c                       |    2 +-
>  arch/arm/plat-s5p/include/plat/pll.h            |   22 +
>  arch/arm/plat-s5p/include/plat/s5p-clock.h      |    2 +
>  5 files changed, 1459 insertions(+), 1 deletions(-)
>  create mode 100755 arch/arm/mach-s5pc100/clock.c
>  create mode 100644 arch/arm/mach-s5pc100/include/mach/regs-clock.h
> 
> diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
> new file mode 100755
> index 0000000..3c9192b
> --- /dev/null
> +++ b/arch/arm/mach-s5pc100/clock.c
> @@ -0,0 +1,1362 @@
> +/* linux/arch/arm/mach-s5pc100/clock.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5PC100 - Clock support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +
> +#include <mach/map.h>
> +
> +#include <plat/cpu-freq.h>
> +#include <mach/regs-clock.h>
> +#include <plat/clock.h>
> +#include <plat/cpu.h>
> +#include <plat/pll.h>
> +#include <plat/s5p-clock.h>
> +#include <plat/clock-clksrc.h>
> +#include <plat/s5pc100.h>
> +
> +static struct clk s5p_clk_otgphy = {
> +	.name		= "otg_phy",
> +	.id		= -1,
> +};
> +
> +static struct clk *clk_src_mout_href_list[] = {
> +	[0] = &s5p_clk_27m,
> +	[1] = &clk_fin_hpll,
> +};
> +
> +static struct clksrc_sources clk_src_mout_href = {
> +	.sources	= clk_src_mout_href_list,
> +	.nr_sources	= ARRAY_SIZE(clk_src_mout_href_list),
> +};
> +
> +static struct clksrc_clk clk_mout_href = {
> +	.clk = {
> +		.name           = "mout_href",
> +		.id             = -1,
> +	},
> +	.sources        = &clk_src_mout_href,
> +	.reg_src        = { .reg = S5P_CLK_SRC0, .shift = 20, .size = 1 },
> +};
> +
> +static struct clk *clk_src_mout_48m_list[] = {
> +	[0] = &s5p_clk_xusbxti,

s5p_clk_xusbxti clock is not defined anywhere.

> ...

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
