From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 6/6] ARM: EXYNOS4: Limit usage of pl330 device
 instance to non-dt build
Date: Wed, 14 Sep 2011 10:26:33 -0600
Message-ID: <20110914162633.GL3134@ponder.secretlab.ca>
References: <1315852165-32402-1-git-send-email-thomas.abraham@linaro.org>
 <1315852165-32402-2-git-send-email-thomas.abraham@linaro.org>
 <1315852165-32402-3-git-send-email-thomas.abraham@linaro.org>
 <1315852165-32402-4-git-send-email-thomas.abraham@linaro.org>
 <1315852165-32402-5-git-send-email-thomas.abraham@linaro.org>
 <1315852165-32402-6-git-send-email-thomas.abraham@linaro.org>
 <1315852165-32402-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:41461 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753359Ab1INQ0i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 12:26:38 -0400
Received: by gyg10 with SMTP id 10so1532379gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 09:26:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1315852165-32402-7-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

On Mon, Sep 12, 2011 at 11:59:25PM +0530, Thomas Abraham wrote:
> The pl330 device instances and associated platform data is required only
> for non-device-tree builds. With device tree enabled, the data about the
> platform is obtained from the device tree. For images that include both
> dt and non-dt platforms, an addditional check is added to ensure that
> static amba device registrations is applicable to only non-dt platforms.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-exynos4/dma.c
> index c3c0d17..3203a31 100644
> --- a/arch/arm/mach-exynos4/dma.c
> +++ b/arch/arm/mach-exynos4/dma.c
> @@ -24,6 +24,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/amba/bus.h>
>  #include <linux/amba/pl330.h>
> +#include <linux/of.h>
>  
>  #include <asm/irq.h>
>  #include <plat/devs.h>
> @@ -138,6 +139,11 @@ struct amba_device exynos4_device_pdma1 = {
>  
>  static int __init exynos4_dma_init(void)
>  {
> +#ifdef CONFIG_OF
> +	if (of_have_populated_dt())
> +		return 0;
> +#endif
> +

Drop the #ifdef.  of_have_populated_dt() has an empty stub for
!CONFIG_OF.  Otherwise looks good to me.  Well done not breaking
non-DT support when CONFIG_OF is enabled.  :-)

The other patches in this series look good to me too.

g.
