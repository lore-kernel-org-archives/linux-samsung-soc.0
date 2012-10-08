From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/5] clk: exynos4: register clocks using common clock
 framework
Date: Mon, 08 Oct 2012 09:54:31 +0200
Message-ID: <3056568.RZOfOW29pM@amdc1227>
References: <1349629855-4962-1-git-send-email-thomas.abraham@linaro.org>
 <1349629855-4962-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47735 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753852Ab2JHHyn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 03:54:43 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBK009HVDYI7YU0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 16:54:41 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBK007AYDYY6P70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 16:54:41 +0900 (KST)
In-reply-to: <1349629855-4962-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, mturquette@ti.com, mturquette@linaro.org

Hi Thomas,

The whole series looks much better now. Although there is still one more 
thing from my comments to previous version unresolved, see the inline 
comment.

On Monday 08 of October 2012 02:10:52 Thomas Abraham wrote:
> For legacy Exynos4 platforms, the available clocks are statically
> listed and then registered using the common clock framework. On device
> tree enabled exynos platfotms, the device tree is searched and all
> clock nodes found are registered. Support for Exynos4210 and
> Exynos4x12 platforms is included.
> 
> Cc: Mike Turquette <mturquette@ti.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  drivers/clk/samsung/Makefile      |    1 +
>  drivers/clk/samsung/clk-exynos4.c |  647
> +++++++++++++++++++++++++++++++++++++ 2 files changed, 648
> insertions(+), 0 deletions(-)
>  create mode 100644 drivers/clk/samsung/clk-exynos4.c
> 
[snip]
> +			EXYNOS4_CLKSRC_MASK_CAM, 28, "sclk_csis"),
> +	GATECLK(NULL, "sclk_cam0", "div_cam0", 0,
> +			EXYNOS4_CLKSRC_MASK_CAM, 16, NULL),
> +	GATECLK(NULL, "sclk_cam1", "div_cam1", 0,
> +			EXYNOS4_CLKSRC_MASK_CAM, 20, NULL),
> +	GATECLK("exynos4-fimc.0", "sclk_fimc", "div_fimc0", 0,
> +			EXYNOS4_CLKSRC_MASK_CAM, 0, "sclk_fimc"),
> +	GATECLK("exynos4-fimc.1", "sclk_fimc", "div_fimc1", 0,
> +			EXYNOS4_CLKSRC_MASK_CAM, 4, "sclk_fimc"),
> +	GATECLK("exynos4-fimc.2", "sclk_fimc", "div_fimc2", 0,
> +			EXYNOS4_CLKSRC_MASK_CAM, 8, "sclk_fimc"),
> +	GATECLK("exynos4-fimc.3", "sclk_fimc", "div_fimc3", 0,
> +			EXYNOS4_CLKSRC_MASK_CAM, 12, "sclk_fimc"),

You cannot register more than one clock with the same platform name 
(sclk_fimc). Shouldn't these names be appended with an index, just like 
with div_fimc{0,1,2,3}?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
