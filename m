From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: Export MIPI CSIS/DSIM PHY control functions
Date: Wed, 09 Jan 2013 17:40:01 -0800
Message-ID: <00e201cdeed3$69b40cd0$3d1c2670$@samsung.com>
References: <1357226497-25166-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22859 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932383Ab3AJBkP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 20:40:15 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGD00JDNZAUN7E0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 10:40:14 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGD005B0ZAZL020@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 10:40:14 +0900 (KST)
In-reply-to: <1357226497-25166-1-git-send-email-s.nawrocki@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
> The s5p_csis_phy_enable/s5p_dsim_phy_enable functions are now used
> directly by corresponding drivers and thus need to be exported so
> the drivers can be built as modules.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/setup-mipiphy.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/setup-mipiphy.c b/arch/arm/plat-
> samsung/setup-mipiphy.c
> index 1474593..66df315 100644
> --- a/arch/arm/plat-samsung/setup-mipiphy.c
> +++ b/arch/arm/plat-samsung/setup-mipiphy.c
> @@ -8,6 +8,7 @@
>   * published by the Free Software Foundation.
>   */
> 
> +#include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
> @@ -50,8 +51,10 @@ int s5p_csis_phy_enable(int id, bool on)
>  {
>  	return __s5p_mipi_phy_control(id, on, S5P_MIPI_DPHY_SRESETN);
>  }
> +EXPORT_SYMBOL(s5p_csis_phy_enable);
> 
>  int s5p_dsim_phy_enable(struct platform_device *pdev, bool on)
>  {
>  	return __s5p_mipi_phy_control(pdev->id, on,
> S5P_MIPI_DPHY_MRESETN);
>  }
> +EXPORT_SYMBOL(s5p_dsim_phy_enable);
> --
> 1.7.9.5

OK, applied.

Thanks.

- Kukjin
